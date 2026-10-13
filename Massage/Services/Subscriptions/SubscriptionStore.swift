import Foundation
import Observation
import StoreKit

@Observable @MainActor
final class SubscriptionStore {
  private(set) var products: [Product] = []
  private(set) var hasPremium = false
  private(set) var isBusy = false
  private(set) var isLoading = false
  var message: String?
  let productIDs: [String]
  @ObservationIgnored private var observer: Task<Void, Never>?
  var isConfigured: Bool { !productIDs.isEmpty }
  var selectedProduct: Product? { products.first }
  var priceDescription: String {
    guard let product = selectedProduct, let period = product.subscription?.subscriptionPeriod
    else { return isLoading ? "Loading price…" : "Currently unavailable" }
    let unit: String
    switch period.unit {
    case .day: unit = "Day"
    case .week: unit = "Week"
    case .month: unit = "Month"
    case .year: unit = "Year"
    @unknown default: unit = "Period"
    }
    return "\(product.displayPrice) / \(period.value == 1 ? unit : "\(period.value) \(unit)s")"
  }
  init(productIDs: [String]) {
    self.productIDs = productIDs
  }
  func prepare() async {
    guard isConfigured, !isLoading else { return }
    isLoading = true
    defer { isLoading = false }
    if observer == nil {
      observer = Task { [weak self] in
        for await result in Transaction.updates {
          guard !Task.isCancelled else { return }
          guard case .verified(let transaction) = result,
            self?.productIDs.contains(transaction.productID) == true
          else { continue }
          await self?.refreshEntitlements()
          await transaction.finish()
        }
      }
    }
    await refreshEntitlements()
    do {
      products = try await Product.products(for: productIDs).sorted { $0.price < $1.price }
    } catch {
      message = "Subscriptions couldn’t load. Please try again."
    }
  }
  func purchase() async {
    guard !isBusy else { return }
    guard let product = selectedProduct else {
      message = "Subscriptions aren’t available yet."
      return
    }
    isBusy = true
    message = nil
    defer { isBusy = false }
    do {
      switch try await product.purchase() {
      case .success(.verified(let transaction)):
        await refreshEntitlements()
        await transaction.finish()
      case .success(.unverified):
        message = "This purchase couldn’t be verified. Please try restoring purchases."
      case .pending: message = "Your purchase is awaiting approval."
      case .userCancelled: break
      @unknown default: message = "Your purchase couldn’t be completed."
      }
    } catch { message = "Your purchase couldn’t be completed. Please try again." }
  }
  func restore() async {
    guard !isBusy else { return }
    guard isConfigured else {
      message = "Subscriptions aren’t connected yet. There are no purchases to restore."
      return
    }
    isBusy = true
    message = nil
    defer { isBusy = false }
    do {
      try await AppStore.sync()
      await refreshEntitlements()
      message =
        hasPremium ? "Your purchases have been restored." : "No active subscription was found."
    } catch { message = "Purchases couldn’t be restored. Please try again." }
  }
  func refreshEntitlements() async {
    var entitled = false
    for await result in Transaction.currentEntitlements {
      if case .verified(let transaction) = result,
        productIDs.contains(transaction.productID), transaction.revocationDate == nil,
        !transaction.isUpgraded
      {
        entitled = true
      }
    }
    hasPremium = entitled
  }
}
