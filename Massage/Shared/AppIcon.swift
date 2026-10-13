import SwiftUI

enum AppSymbol: String {
  case relax, mood, chat, settings, easy, medium, hard, intensity, companion, composerAdd,
    composerSend
  var size: CGSize {
    switch self {
    case .relax: CGSize(width: 24.000000, height: 19.000000)
    case .mood: CGSize(width: 20.000000, height: 20.000000)
    case .chat: CGSize(width: 20.000000, height: 20.000000)
    case .settings: CGSize(width: 20.000000, height: 20.000000)
    case .easy: CGSize(width: 12.585393, height: 13.233334)
    case .medium: CGSize(width: 14.675880, height: 9.361364)
    case .hard: CGSize(width: 12.506297, height: 12.506294)
    case .intensity: CGSize(width: 18.000000, height: 18.000000)
    case .companion: CGSize(width: 27.000000, height: 24.000000)
    case .composerAdd: CGSize(width: 14.000000, height: 14.262926)
    case .composerSend: CGSize(width: 14.000000, height: 14.000000)
    }
  }
  var path: Path {
    var p = Path()
    switch self {
    case .relax:
      p.move(to: CGPoint(x: 7.073289, y: 8.291294))
      p.addCurve(
        to: CGPoint(x: 10.774575, y: 11.450892), control1: CGPoint(x: 8.502953, y: 9.084374),
        control2: CGPoint(x: 9.761724, y: 10.161607))
      p.addCurve(
        to: CGPoint(x: 12.000000, y: 13.350892), control1: CGPoint(x: 11.237235, y: 12.040401),
        control2: CGPoint(x: 11.649879, y: 12.676561))
      p.addCurve(
        to: CGPoint(x: 13.225426, y: 11.450892), control1: CGPoint(x: 12.354290, y: 12.676561),
        control2: CGPoint(x: 12.762765, y: 12.044642))
      p.addCurve(
        to: CGPoint(x: 16.926712, y: 8.291294), control1: CGPoint(x: 14.238277, y: 10.157366),
        control2: CGPoint(x: 15.497048, y: 9.080133))
      p.addCurve(
        to: CGPoint(x: 22.749565, y: 6.785714), control1: CGPoint(x: 18.664816, y: 7.328571),
        control2: CGPoint(x: 20.653006, y: 6.785714))
      p.addLine(to: CGPoint(x: 23.162210, y: 6.785714))
      p.addCurve(
        to: CGPoint(x: 24.000000, y: 7.638170), control1: CGPoint(x: 23.624870, y: 6.785714),
        control2: CGPoint(x: 24.000000, y: 7.167411))
      p.addCurve(
        to: CGPoint(x: 12.833623, y: 19.000000), control1: CGPoint(x: 24.000000, y: 13.914955),
        control2: CGPoint(x: 19.002432, y: 19.000000))
      p.addLine(to: CGPoint(x: 11.158042, y: 19.000000))
      p.addCurve(
        to: CGPoint(x: 0.000000, y: 7.638170), control1: CGPoint(x: 4.997569, y: 19.000000),
        control2: CGPoint(x: 0.000000, y: 13.914955))
      p.addCurve(
        to: CGPoint(x: 0.837791, y: 6.785714), control1: CGPoint(x: 0.000000, y: 7.167411),
        control2: CGPoint(x: 0.375130, y: 6.785714))
      p.addLine(to: CGPoint(x: 1.250434, y: 6.785714))
      p.addCurve(
        to: CGPoint(x: 7.073289, y: 8.291294), control1: CGPoint(x: 3.351164, y: 6.785714),
        control2: CGPoint(x: 5.339354, y: 7.328571))
      p.closeSubpath()
      p.move(to: CGPoint(x: 12.666899, y: 0.254464))
      p.addCurve(
        to: CGPoint(x: 16.376520, y: 6.289509), control1: CGPoint(x: 13.371309, y: 0.928795),
        control2: CGPoint(x: 15.226120, y: 2.943304))
      p.addCurve(
        to: CGPoint(x: 12.004169, y: 9.771428), control1: CGPoint(x: 14.707689, y: 7.145449),
        control2: CGPoint(x: 13.221725, y: 8.328796))
      p.addCurve(
        to: CGPoint(x: 7.631817, y: 6.289509), control1: CGPoint(x: 10.787079, y: 8.333705),
        control2: CGPoint(x: 9.303231, y: 7.150446))
      p.addCurve(
        to: CGPoint(x: 11.341438, y: 0.254464), control1: CGPoint(x: 8.782217, y: 2.943304),
        control2: CGPoint(x: 10.641195, y: 0.928795))
      p.addCurve(
        to: CGPoint(x: 12.004169, y: 0.000000), control1: CGPoint(x: 11.520667, y: 0.080580),
        control2: CGPoint(x: 11.758250, y: 0.000000))
      p.addCurve(
        to: CGPoint(x: 12.666899, y: 0.254464), control1: CGPoint(x: 12.250087, y: 0.000000),
        control2: CGPoint(x: 12.487670, y: 0.084821))
      p.closeSubpath()
    case .mood:
      p.move(to: CGPoint(x: 20.000000, y: 4.285663))
      p.addCurve(
        to: CGPoint(x: 19.163162, y: 2.265351), control1: CGPoint(x: 20.000000, y: 3.527899),
        control2: CGPoint(x: 19.698980, y: 2.801171))
      p.addCurve(
        to: CGPoint(x: 17.142857, y: 1.428511), control1: CGPoint(x: 18.627344, y: 1.729531),
        control2: CGPoint(x: 17.900620, y: 1.428511))
      p.addLine(to: CGPoint(x: 16.428572, y: 1.428511))
      p.addLine(to: CGPoint(x: 16.428572, y: 0.734312))
      p.addCurve(
        to: CGPoint(x: 15.748661, y: 0.000828), control1: CGPoint(x: 16.428572, y: 0.349936),
        control2: CGPoint(x: 16.133036, y: 0.020024))
      p.addCurve(
        to: CGPoint(x: 15.464957, y: 0.044929), control1: CGPoint(x: 15.652082, y: -0.003826),
        control2: CGPoint(x: 15.555566, y: 0.011178))
      p.addCurve(
        to: CGPoint(x: 15.221537, y: 0.197177), control1: CGPoint(x: 15.374349, y: 0.078679),
        control2: CGPoint(x: 15.291535, y: 0.130475))
      p.addCurve(
        to: CGPoint(x: 15.057729, y: 0.432974), control1: CGPoint(x: 15.151537, y: 0.263879),
        control2: CGPoint(x: 15.095809, y: 0.344098))
      p.addCurve(
        to: CGPoint(x: 15.000000, y: 0.714223), control1: CGPoint(x: 15.019649, y: 0.521850),
        control2: CGPoint(x: 15.000010, y: 0.617532))
      p.addLine(to: CGPoint(x: 15.000000, y: 1.428511))
      p.addLine(to: CGPoint(x: 5.000000, y: 1.428511))
      p.addLine(to: CGPoint(x: 5.000000, y: 0.734312))
      p.addCurve(
        to: CGPoint(x: 4.320090, y: 0.000828), control1: CGPoint(x: 5.000000, y: 0.349936),
        control2: CGPoint(x: 4.704464, y: 0.020024))
      p.addCurve(
        to: CGPoint(x: 4.036386, y: 0.044929), control1: CGPoint(x: 4.223511, y: -0.003826),
        control2: CGPoint(x: 4.126994, y: 0.011178))
      p.addCurve(
        to: CGPoint(x: 3.792965, y: 0.197177), control1: CGPoint(x: 3.945777, y: 0.078679),
        control2: CGPoint(x: 3.862964, y: 0.130475))
      p.addCurve(
        to: CGPoint(x: 3.629157, y: 0.432974), control1: CGPoint(x: 3.722966, y: 0.263879),
        control2: CGPoint(x: 3.667238, y: 0.344098))
      p.addCurve(
        to: CGPoint(x: 3.571429, y: 0.714223), control1: CGPoint(x: 3.591077, y: 0.521850),
        control2: CGPoint(x: 3.571438, y: 0.617532))
      p.addLine(to: CGPoint(x: 3.571429, y: 1.428511))
      p.addLine(to: CGPoint(x: 2.857143, y: 1.428511))
      p.addCurve(
        to: CGPoint(x: 0.836838, y: 2.265351), control1: CGPoint(x: 2.099381, y: 1.428511),
        control2: CGPoint(x: 1.372656, y: 1.729531))
      p.addCurve(
        to: CGPoint(x: 0.000000, y: 4.285663), control1: CGPoint(x: 0.301020, y: 2.801171),
        control2: CGPoint(x: 0.000000, y: 3.527899))
      p.addLine(to: CGPoint(x: 0.000000, y: 4.821379))
      p.addCurve(
        to: CGPoint(x: 0.052302, y: 4.947649), control1: CGPoint(x: -0.000000, y: 4.868740),
        control2: CGPoint(x: 0.018814, y: 4.914160))
      p.addCurve(
        to: CGPoint(x: 0.178571, y: 4.999951), control1: CGPoint(x: 0.085791, y: 4.981138),
        control2: CGPoint(x: 0.131211, y: 4.999951))
      p.addLine(to: CGPoint(x: 19.821428, y: 4.999951))
      p.addCurve(
        to: CGPoint(x: 19.947699, y: 4.947649), control1: CGPoint(x: 19.868790, y: 4.999951),
        control2: CGPoint(x: 19.914209, y: 4.981138))
      p.addCurve(
        to: CGPoint(x: 20.000000, y: 4.821379), control1: CGPoint(x: 19.981188, y: 4.914160),
        control2: CGPoint(x: 20.000000, y: 4.868740))
      p.addLine(to: CGPoint(x: 20.000000, y: 4.285663))
      p.closeSubpath()
      p.move(to: CGPoint(x: 0.000000, y: 17.142847))
      p.addCurve(
        to: CGPoint(x: 0.836838, y: 19.163158), control1: CGPoint(x: 0.000000, y: 17.900612),
        control2: CGPoint(x: 0.301020, y: 18.627338))
      p.addCurve(
        to: CGPoint(x: 2.857143, y: 20.000000), control1: CGPoint(x: 1.372656, y: 19.698978),
        control2: CGPoint(x: 2.099381, y: 20.000000))
      p.addLine(to: CGPoint(x: 17.142857, y: 20.000000))
      p.addCurve(
        to: CGPoint(x: 19.163162, y: 19.163158), control1: CGPoint(x: 17.900620, y: 20.000000),
        control2: CGPoint(x: 18.627344, y: 19.698978))
      p.addCurve(
        to: CGPoint(x: 20.000000, y: 17.142847), control1: CGPoint(x: 19.698980, y: 18.627338),
        control2: CGPoint(x: 20.000000, y: 17.900612))
      p.addLine(to: CGPoint(x: 20.000000, y: 6.607099))
      p.addCurve(
        to: CGPoint(x: 19.947699, y: 6.480830), control1: CGPoint(x: 20.000000, y: 6.559739),
        control2: CGPoint(x: 19.981188, y: 6.514318))
      p.addCurve(
        to: CGPoint(x: 19.821428, y: 6.428527), control1: CGPoint(x: 19.914209, y: 6.447341),
        control2: CGPoint(x: 19.868790, y: 6.428527))
      p.addLine(to: CGPoint(x: 0.178571, y: 6.428527))
      p.addCurve(
        to: CGPoint(x: 0.052302, y: 6.480830), control1: CGPoint(x: 0.131211, y: 6.428527),
        control2: CGPoint(x: 0.085791, y: 6.447341))
      p.addCurve(
        to: CGPoint(x: 0.000000, y: 6.607099), control1: CGPoint(x: 0.018814, y: 6.514318),
        control2: CGPoint(x: -0.000000, y: 6.559739))
      p.addLine(to: CGPoint(x: 0.000000, y: 17.142847))
      p.closeSubpath()
    case .chat:
      p.move(to: CGPoint(x: 17.012262, y: 6.631370))
      p.addLine(to: CGPoint(x: 16.788620, y: 7.157855))
      p.addCurve(
        to: CGPoint(x: 16.619158, y: 7.368331), control1: CGPoint(x: 16.753668, y: 7.243587),
        control2: CGPoint(x: 16.694706, y: 7.316819))
      p.addCurve(
        to: CGPoint(x: 16.364063, y: 7.447330), control1: CGPoint(x: 16.543608, y: 7.419842),
        control2: CGPoint(x: 16.454851, y: 7.447330))
      p.addCurve(
        to: CGPoint(x: 16.108971, y: 7.368331), control1: CGPoint(x: 16.273277, y: 7.447330),
        control2: CGPoint(x: 16.184519, y: 7.419842))
      p.addCurve(
        to: CGPoint(x: 15.939508, y: 7.157855), control1: CGPoint(x: 16.033421, y: 7.316819),
        control2: CGPoint(x: 15.974460, y: 7.243587))
      p.addLine(to: CGPoint(x: 15.715866, y: 6.631370))
      p.addCurve(
        to: CGPoint(x: 13.697630, y: 4.538452), control1: CGPoint(x: 15.322656, y: 5.699996),
        control2: CGPoint(x: 14.602547, y: 4.953240))
      p.addLine(to: CGPoint(x: 13.007613, y: 4.223119))
      p.addCurve(
        to: CGPoint(x: 12.803273, y: 4.041201), control1: CGPoint(x: 12.923901, y: 4.183719),
        control2: CGPoint(x: 12.852984, y: 4.120584))
      p.addCurve(
        to: CGPoint(x: 12.727141, y: 3.775234), control1: CGPoint(x: 12.753563, y: 3.961818),
        control2: CGPoint(x: 12.727141, y: 3.869514))
      p.addCurve(
        to: CGPoint(x: 12.803273, y: 3.509267), control1: CGPoint(x: 12.727141, y: 3.680954),
        control2: CGPoint(x: 12.753563, y: 3.588651))
      p.addCurve(
        to: CGPoint(x: 13.007613, y: 3.327350), control1: CGPoint(x: 12.852984, y: 3.429884),
        control2: CGPoint(x: 12.923901, y: 3.366750))
      p.addLine(to: CGPoint(x: 13.659448, y: 3.030621))
      p.addCurve(
        to: CGPoint(x: 15.705864, y: 0.867009), control1: CGPoint(x: 14.587111, y: 2.604018),
        control2: CGPoint(x: 15.319543, y: 1.829641))
      p.addLine(to: CGPoint(x: 15.935870, y: 0.298665))
      p.addCurve(
        to: CGPoint(x: 16.104952, y: 0.081769), control1: CGPoint(x: 15.969652, y: 0.210627),
        control2: CGPoint(x: 16.028574, y: 0.135044))
      p.addCurve(
        to: CGPoint(x: 16.364063, y: 0.000000), control1: CGPoint(x: 16.181332, y: 0.028495),
        control2: CGPoint(x: 16.271626, y: -0.000000))
      p.addCurve(
        to: CGPoint(x: 16.623175, y: 0.081769), control1: CGPoint(x: 16.456503, y: -0.000000),
        control2: CGPoint(x: 16.546797, y: 0.028495))
      p.addCurve(
        to: CGPoint(x: 16.792257, y: 0.298665), control1: CGPoint(x: 16.699554, y: 0.135044),
        control2: CGPoint(x: 16.758476, y: 0.210627))
      p.addLine(to: CGPoint(x: 17.022264, y: 0.866078))
      p.addCurve(
        to: CGPoint(x: 19.067772, y: 3.030621), control1: CGPoint(x: 17.408175, y: 1.828892),
        control2: CGPoint(x: 18.140282, y: 2.603603))
      p.addLine(to: CGPoint(x: 19.720514, y: 3.328280))
      p.addCurve(
        to: CGPoint(x: 19.924160, y: 3.510200), control1: CGPoint(x: 19.803972, y: 3.367794),
        control2: CGPoint(x: 19.874636, y: 3.430919))
      p.addCurve(
        to: CGPoint(x: 20.000000, y: 3.775700), control1: CGPoint(x: 19.973684, y: 3.589482),
        control2: CGPoint(x: 20.000000, y: 3.681608))
      p.addCurve(
        to: CGPoint(x: 19.924160, y: 4.041199), control1: CGPoint(x: 20.000000, y: 3.869791),
        control2: CGPoint(x: 19.973684, y: 3.961917))
      p.addCurve(
        to: CGPoint(x: 19.720514, y: 4.223119), control1: CGPoint(x: 19.874636, y: 4.120481),
        control2: CGPoint(x: 19.803972, y: 4.183605))
      p.addLine(to: CGPoint(x: 19.029587, y: 4.537521))
      p.addCurve(
        to: CGPoint(x: 17.012262, y: 6.631370), control1: CGPoint(x: 18.124849, y: 4.952724),
        control2: CGPoint(x: 17.405066, y: 5.699812))
      p.closeSubpath()
      p.move(to: CGPoint(x: 16.364063, y: 9.302864))
      p.addCurve(
        to: CGPoint(x: 18.175930, y: 8.987531), control1: CGPoint(x: 16.981104, y: 9.303365),
        control2: CGPoint(x: 17.593752, y: 9.196741))
      p.addCurve(
        to: CGPoint(x: 18.182293, y: 9.302864), control1: CGPoint(x: 18.180172, y: 9.092952),
        control2: CGPoint(x: 18.182293, y: 9.198063))
      p.addCurve(
        to: CGPoint(x: 16.052105, y: 14.564790), control1: CGPoint(x: 18.182293, y: 11.276469),
        control2: CGPoint(x: 17.416042, y: 13.169240))
      p.addCurve(
        to: CGPoint(x: 10.909376, y: 16.744350), control1: CGPoint(x: 14.688169, y: 15.960340),
        control2: CGPoint(x: 12.838274, y: 16.744350))
      p.addLine(to: CGPoint(x: 10.909376, y: 20.000000))
      p.addCurve(
        to: CGPoint(x: 0.000000, y: 9.302864), control1: CGPoint(x: 6.363802, y: 18.139629),
        control2: CGPoint(x: 0.000000, y: 15.349072))
      p.addCurve(
        to: CGPoint(x: 2.130188, y: 4.040938), control1: CGPoint(x: 0.000000, y: 7.329259),
        control2: CGPoint(x: 0.766252, y: 5.436488))
      p.addCurve(
        to: CGPoint(x: 7.272917, y: 1.861377), control1: CGPoint(x: 3.494125, y: 2.645389),
        control2: CGPoint(x: 5.344019, y: 1.861377))
      p.addLine(to: CGPoint(x: 10.909376, y: 1.861377))
      p.addCurve(
        to: CGPoint(x: 11.217566, y: 1.867888), control1: CGPoint(x: 11.012409, y: 1.861377),
        control2: CGPoint(x: 11.115139, y: 1.863548))
      p.addCurve(
        to: CGPoint(x: 10.960326, y: 4.494028), control1: CGPoint(x: 10.927849, y: 2.709636),
        control2: CGPoint(x: 10.839636, y: 3.610195))
      p.addCurve(
        to: CGPoint(x: 11.911196, y: 6.947461), control1: CGPoint(x: 11.081016, y: 5.377861),
        control2: CGPoint(x: 11.407089, y: 6.219196))
      p.addCurve(
        to: CGPoint(x: 13.857529, y: 8.679522), control1: CGPoint(x: 12.415301, y: 7.675727),
        control2: CGPoint(x: 13.082741, y: 8.269688))
      p.addCurve(
        to: CGPoint(x: 16.364063, y: 9.302864), control1: CGPoint(x: 14.632318, y: 9.089355),
        control2: CGPoint(x: 15.491861, y: 9.303113))
      p.closeSubpath()
    case .settings:
      p.move(to: CGPoint(x: 7.263682, y: 20.000000))
      p.addLine(to: CGPoint(x: 6.865673, y: 16.799999))
      p.addCurve(
        to: CGPoint(x: 6.256717, y: 16.500000), control1: CGPoint(x: 6.650084, y: 16.716665),
        control2: CGPoint(x: 6.447099, y: 16.616667))
      p.addCurve(
        to: CGPoint(x: 5.696518, y: 16.125000), control1: CGPoint(x: 6.066336, y: 16.383333),
        control2: CGPoint(x: 5.879603, y: 16.258333))
      p.addLine(to: CGPoint(x: 2.736318, y: 17.375000))
      p.addLine(to: CGPoint(x: 0.000000, y: 12.625000))
      p.addLine(to: CGPoint(x: 2.562189, y: 10.675000))
      p.addCurve(
        to: CGPoint(x: 2.537314, y: 10.338000), control1: CGPoint(x: 2.545606, y: 10.558333),
        control2: CGPoint(x: 2.537314, y: 10.446000))
      p.addLine(to: CGPoint(x: 2.537314, y: 9.663000))
      p.addCurve(
        to: CGPoint(x: 2.562189, y: 9.325000), control1: CGPoint(x: 2.537314, y: 9.554334),
        control2: CGPoint(x: 2.545606, y: 9.441667))
      p.addLine(to: CGPoint(x: 0.000000, y: 7.375000))
      p.addLine(to: CGPoint(x: 2.736318, y: 2.625000))
      p.addLine(to: CGPoint(x: 5.696518, y: 3.875000))
      p.addCurve(
        to: CGPoint(x: 6.268658, y: 3.500000), control1: CGPoint(x: 5.878940, y: 3.741667),
        control2: CGPoint(x: 6.069653, y: 3.616667))
      p.addCurve(
        to: CGPoint(x: 6.865673, y: 3.200000), control1: CGPoint(x: 6.467662, y: 3.383333),
        control2: CGPoint(x: 6.666668, y: 3.283333))
      p.addLine(to: CGPoint(x: 7.263682, y: 0.000000))
      p.addLine(to: CGPoint(x: 12.736320, y: 0.000000))
      p.addLine(to: CGPoint(x: 13.134330, y: 3.200000))
      p.addCurve(
        to: CGPoint(x: 13.744280, y: 3.500000), control1: CGPoint(x: 13.349918, y: 3.283333),
        control2: CGPoint(x: 13.553235, y: 3.383333))
      p.addCurve(
        to: CGPoint(x: 14.303485, y: 3.875000), control1: CGPoint(x: 13.935325, y: 3.616667),
        control2: CGPoint(x: 14.121727, y: 3.741667))
      p.addLine(to: CGPoint(x: 17.263681, y: 2.625000))
      p.addLine(to: CGPoint(x: 20.000000, y: 7.375000))
      p.addLine(to: CGPoint(x: 17.437813, y: 9.325000))
      p.addCurve(
        to: CGPoint(x: 17.462688, y: 9.663000), control1: CGPoint(x: 17.454395, y: 9.441667),
        control2: CGPoint(x: 17.462688, y: 9.554334))
      p.addLine(to: CGPoint(x: 17.462688, y: 10.337000))
      p.addCurve(
        to: CGPoint(x: 17.412937, y: 10.675000), control1: CGPoint(x: 17.462688, y: 10.445666),
        control2: CGPoint(x: 17.446104, y: 10.558333))
      p.addLine(to: CGPoint(x: 19.975126, y: 12.625000))
      p.addLine(to: CGPoint(x: 17.238806, y: 17.375000))
      p.addLine(to: CGPoint(x: 14.303485, y: 16.125000))
      p.addCurve(
        to: CGPoint(x: 13.731345, y: 16.500000), control1: CGPoint(x: 14.121064, y: 16.258333),
        control2: CGPoint(x: 13.930350, y: 16.383333))
      p.addCurve(
        to: CGPoint(x: 13.134330, y: 16.799999), control1: CGPoint(x: 13.532340, y: 16.616667),
        control2: CGPoint(x: 13.333335, y: 16.716665))
      p.addLine(to: CGPoint(x: 12.736320, y: 20.000000))
      p.addLine(to: CGPoint(x: 7.263682, y: 20.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 10.049752, y: 13.500000))
      p.addCurve(
        to: CGPoint(x: 12.512439, y: 12.475000), control1: CGPoint(x: 11.011610, y: 13.500000),
        control2: CGPoint(x: 11.832505, y: 13.158334))
      p.addCurve(
        to: CGPoint(x: 13.532340, y: 10.000000), control1: CGPoint(x: 13.192372, y: 11.791667),
        control2: CGPoint(x: 13.532340, y: 10.966666))
      p.addCurve(
        to: CGPoint(x: 12.512439, y: 7.525000), control1: CGPoint(x: 13.532340, y: 9.033334),
        control2: CGPoint(x: 13.192372, y: 8.208333))
      p.addCurve(
        to: CGPoint(x: 10.049752, y: 6.500000), control1: CGPoint(x: 11.832505, y: 6.841666),
        control2: CGPoint(x: 11.011610, y: 6.500000))
      p.addCurve(
        to: CGPoint(x: 7.574131, y: 7.525000), control1: CGPoint(x: 9.071311, y: 6.500000),
        control2: CGPoint(x: 8.246104, y: 6.841666))
      p.addCurve(
        to: CGPoint(x: 6.567165, y: 10.000000), control1: CGPoint(x: 6.902157, y: 8.208333),
        control2: CGPoint(x: 6.566502, y: 9.033334))
      p.addCurve(
        to: CGPoint(x: 7.575125, y: 12.475000), control1: CGPoint(x: 6.567829, y: 10.966666),
        control2: CGPoint(x: 6.903815, y: 11.791667))
      p.addCurve(
        to: CGPoint(x: 10.049752, y: 13.500000), control1: CGPoint(x: 8.246435, y: 13.158334),
        control2: CGPoint(x: 9.071311, y: 13.500000))
      p.closeSubpath()
    case .easy:
      p.move(to: CGPoint(x: 12.556518, y: 0.840000))
      p.addLine(to: CGPoint(x: 12.476518, y: 0.000000))
      p.addLine(to: CGPoint(x: 11.676518, y: 0.266667))
      p.addCurve(
        to: CGPoint(x: 7.403184, y: 0.693333), control1: CGPoint(x: 10.305462, y: 0.743030),
        control2: CGPoint(x: 8.841360, y: 0.889211))
      p.addCurve(
        to: CGPoint(x: 2.949851, y: 1.293333), control1: CGPoint(x: 5.891949, y: 0.458807),
        control2: CGPoint(x: 4.345131, y: 0.667211))
      p.addCurve(
        to: CGPoint(x: 1.061501, y: 2.733206), control1: CGPoint(x: 2.210170, y: 1.608298),
        control2: CGPoint(x: 1.561020, y: 2.103276))
      p.addCurve(
        to: CGPoint(x: 0.089851, y: 4.900000), control1: CGPoint(x: 0.561982, y: 3.363135),
        control2: CGPoint(x: 0.227962, y: 4.108006))
      p.addCurve(
        to: CGPoint(x: 0.349851, y: 7.953334), control1: CGPoint(x: -0.089229, y: 5.923126),
        control2: CGPoint(x: 0.000359, y: 6.975217))
      p.addCurve(
        to: CGPoint(x: 1.136518, y: 6.486667), control1: CGPoint(x: 0.574888, y: 7.445392),
        control2: CGPoint(x: 0.837853, y: 6.955117))
      p.addCurve(
        to: CGPoint(x: 3.849851, y: 4.200000), control1: CGPoint(x: 1.813985, y: 5.489892),
        control2: CGPoint(x: 2.752703, y: 4.698786))
      p.addCurve(
        to: CGPoint(x: 7.223184, y: 3.533333), control1: CGPoint(x: 4.906811, y: 3.717417),
        control2: CGPoint(x: 6.062109, y: 3.489097))
      p.addCurve(
        to: CGPoint(x: 4.116518, y: 4.700000), control1: CGPoint(x: 6.117964, y: 3.702711),
        control2: CGPoint(x: 5.060026, y: 4.100006))
      p.addCurve(
        to: CGPoint(x: 2.876518, y: 5.720000), control1: CGPoint(x: 3.661586, y: 4.986017),
        control2: CGPoint(x: 3.244905, y: 5.328771))
      p.addCurve(
        to: CGPoint(x: 1.949851, y: 6.993333), control1: CGPoint(x: 2.524368, y: 6.111210),
        control2: CGPoint(x: 2.213813, y: 6.537945))
      p.addCurve(
        to: CGPoint(x: 0.903185, y: 10.020000), control1: CGPoint(x: 1.454294, y: 7.945379),
        control2: CGPoint(x: 1.101622, y: 8.965206))
      p.addCurve(
        to: CGPoint(x: 0.556518, y: 13.233334), control1: CGPoint(x: 0.689319, y: 11.078213),
        control2: CGPoint(x: 0.573274, y: 12.153857))
      p.addLine(to: CGPoint(x: 1.889851, y: 13.233334))
      p.addCurve(
        to: CGPoint(x: 2.283185, y: 10.353334), control1: CGPoint(x: 1.953205, y: 12.265292),
        control2: CGPoint(x: 2.084641, y: 11.302913))
      p.addCurve(
        to: CGPoint(x: 5.296517, y: 11.093334), control1: CGPoint(x: 3.208140, y: 10.852801),
        control2: CGPoint(x: 4.245419, y: 11.107532))
      p.addCurve(
        to: CGPoint(x: 8.149851, y: 10.513334), control1: CGPoint(x: 6.276835, y: 11.092661),
        control2: CGPoint(x: 7.247067, y: 10.895440))
      p.addCurve(
        to: CGPoint(x: 12.556518, y: 0.840000), control1: CGPoint(x: 13.223185, y: 8.346667),
        control2: CGPoint(x: 12.556518, y: 1.140000))
      p.closeSubpath()
    case .medium:
      p.move(to: CGPoint(x: 7.949512, y: 0.000000))
      p.addCurve(
        to: CGPoint(x: 4.914845, y: 1.657333), control1: CGPoint(x: 6.674845, y: 0.000000),
        control2: CGPoint(x: 5.556178, y: 0.661333))
      p.addCurve(
        to: CGPoint(x: 3.265426, y: 1.582525), control1: CGPoint(x: 4.376601, y: 1.515475),
        control2: CGPoint(x: 3.814302, y: 1.489973))
      p.addCurve(
        to: CGPoint(x: 1.731743, y: 2.194073), control1: CGPoint(x: 2.716551, y: 1.675077),
        control2: CGPoint(x: 2.193707, y: 1.883558))
      p.addCurve(
        to: CGPoint(x: 0.586350, y: 3.383296), control1: CGPoint(x: 1.269778, y: 2.504587),
        control2: CGPoint(x: 0.879305, y: 2.910002))
      p.addCurve(
        to: CGPoint(x: 0.032799, y: 4.938853), control1: CGPoint(x: 0.293394, y: 3.856590),
        control2: CGPoint(x: 0.104685, y: 4.386890))
      p.addCurve(
        to: CGPoint(x: 0.169466, y: 6.584301), control1: CGPoint(x: -0.039086, y: 5.490816),
        control2: CGPoint(x: 0.007505, y: 6.051761))
      p.addCurve(
        to: CGPoint(x: 0.972060, y: 8.027221), control1: CGPoint(x: 0.331426, y: 7.116841),
        control2: CGPoint(x: 0.605036, y: 7.608743))
      p.addCurve(
        to: CGPoint(x: 2.297952, y: 9.011187), control1: CGPoint(x: 1.339084, y: 8.445699),
        control2: CGPoint(x: 1.791090, y: 8.781139))
      p.addCurve(
        to: CGPoint(x: 3.911511, y: 9.361334), control1: CGPoint(x: 2.804814, y: 9.241233),
        control2: CGPoint(x: 3.354888, y: 9.360600))
      p.addLine(to: CGPoint(x: 11.676846, y: 9.361334))
      p.addCurve(
        to: CGPoint(x: 12.838123, y: 9.131987), control1: CGPoint(x: 12.075366, y: 9.363163),
        control2: CGPoint(x: 12.470220, y: 9.285181))
      p.addCurve(
        to: CGPoint(x: 13.818980, y: 8.469352), control1: CGPoint(x: 13.206028, y: 8.978791),
        control2: CGPoint(x: 13.539535, y: 8.753485))
      p.addCurve(
        to: CGPoint(x: 14.465209, y: 7.477609), control1: CGPoint(x: 14.098427, y: 8.185218),
        control2: CGPoint(x: 14.318155, y: 7.848010))
      p.addCurve(
        to: CGPoint(x: 14.675209, y: 6.312677), control1: CGPoint(x: 14.612264, y: 7.107207),
        control2: CGPoint(x: 14.683667, y: 6.711112))
      p.addCurve(
        to: CGPoint(x: 14.415965, y: 5.157706), control1: CGPoint(x: 14.666752, y: 5.914242),
        control2: CGPoint(x: 14.578605, y: 5.521533))
      p.addCurve(
        to: CGPoint(x: 13.728235, y: 4.194278), control1: CGPoint(x: 14.253325, y: 4.793879),
        control2: CGPoint(x: 14.019486, y: 4.466298))
      p.addCurve(
        to: CGPoint(x: 12.720142, y: 3.573863), control1: CGPoint(x: 13.436983, y: 3.922259),
        control2: CGPoint(x: 13.094216, y: 3.711308))
      p.addCurve(
        to: CGPoint(x: 11.550179, y: 3.394000), control1: CGPoint(x: 12.346069, y: 3.436418),
        control2: CGPoint(x: 11.948263, y: 3.375261))
      p.addCurve(
        to: CGPoint(x: 10.423436, y: 0.982586), control1: CGPoint(x: 11.495781, y: 2.475939),
        control2: CGPoint(x: 11.092726, y: 1.613337))
      p.addCurve(
        to: CGPoint(x: 7.949512, y: 0.000000), control1: CGPoint(x: 9.754147, y: 0.351835),
        control2: CGPoint(x: 8.869184, y: -0.000080))
      p.closeSubpath()
    case .hard:
      p.move(to: CGPoint(x: 5.898329, y: 0.000951))
      p.addCurve(
        to: CGPoint(x: 6.251298, y: 0.881091), control1: CGPoint(x: 6.377360, y: -0.027049),
        control2: CGPoint(x: 6.616939, y: 0.570326))
      p.addCurve(
        to: CGPoint(x: 4.906250, y: 3.787544), control1: CGPoint(x: 5.403610, y: 1.601529),
        control2: CGPoint(x: 4.906250, y: 2.653529))
      p.addCurve(
        to: CGPoint(x: 8.718751, y: 7.600045), control1: CGPoint(x: 4.906250, y: 5.893123),
        control2: CGPoint(x: 6.613173, y: 7.600045))
      p.addCurve(
        to: CGPoint(x: 11.625219, y: 6.254982), control1: CGPoint(x: 9.852767, y: 7.600045),
        control2: CGPoint(x: 10.904766, y: 7.102670))
      p.addCurve(
        to: CGPoint(x: 12.505408, y: 6.607013), control1: CGPoint(x: 11.935658, y: 5.889716),
        control2: CGPoint(x: 12.532471, y: 6.128388))
      p.addCurve(
        to: CGPoint(x: 6.257813, y: 12.506294), control1: CGPoint(x: 12.318751, y: 9.909779),
        control2: CGPoint(x: 9.580329, y: 12.506294))
      p.addCurve(
        to: CGPoint(x: 0.000000, y: 6.248482), control1: CGPoint(x: 2.801719, y: 12.506294),
        control2: CGPoint(x: 0.000000, y: 9.704576))
      p.addCurve(
        to: CGPoint(x: 5.846844, y: 0.003966), control1: CGPoint(x: 0.000000, y: 2.945513),
        control2: CGPoint(x: 2.566985, y: 0.216857))
      p.addLine(to: CGPoint(x: 5.850063, y: 0.003763))
      p.addLine(to: CGPoint(x: 5.898329, y: 0.000951))
      p.closeSubpath()
    case .intensity:
      p.move(to: CGPoint(x: -0.750000, y: 11.000000))
      p.addCurve(
        to: CGPoint(x: 0.000000, y: 11.750000), control1: CGPoint(x: -0.750000, y: 11.414213),
        control2: CGPoint(x: -0.414214, y: 11.750000))
      p.addCurve(
        to: CGPoint(x: 0.750000, y: 11.000000), control1: CGPoint(x: 0.414214, y: 11.750000),
        control2: CGPoint(x: 0.750000, y: 11.414213))
      p.addLine(to: CGPoint(x: 0.000000, y: 11.000000))
      p.addLine(to: CGPoint(x: -0.750000, y: 11.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 1.500000, y: 5.000000))
      p.addLine(to: CGPoint(x: 1.500000, y: 4.250000))
      p.addLine(to: CGPoint(x: 1.500000, y: 5.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 3.000000, y: 6.500000))
      p.addLine(to: CGPoint(x: 3.750000, y: 6.500000))
      p.addLine(to: CGPoint(x: 3.000000, y: 6.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 6.000000, y: 13.500000))
      p.addLine(to: CGPoint(x: 6.750000, y: 13.500000))
      p.addLine(to: CGPoint(x: 6.000000, y: 13.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 7.500000, y: 0.000000))
      p.addLine(to: CGPoint(x: 7.500000, y: -0.750000))
      p.addLine(to: CGPoint(x: 7.500000, y: 0.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 9.000000, y: 16.500000))
      p.addLine(to: CGPoint(x: 8.250000, y: 16.500000))
      p.addLine(to: CGPoint(x: 9.000000, y: 16.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 12.000000, y: 16.500000))
      p.addLine(to: CGPoint(x: 12.750000, y: 16.500000))
      p.addLine(to: CGPoint(x: 12.000000, y: 16.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 13.500000, y: 4.000000))
      p.addLine(to: CGPoint(x: 13.500000, y: 3.250000))
      p.addLine(to: CGPoint(x: 13.500000, y: 4.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 18.750000, y: 9.000000))
      p.addCurve(
        to: CGPoint(x: 18.000000, y: 8.250000), control1: CGPoint(x: 18.750000, y: 8.585787),
        control2: CGPoint(x: 18.414213, y: 8.250000))
      p.addCurve(
        to: CGPoint(x: 17.250000, y: 9.000000), control1: CGPoint(x: 17.585787, y: 8.250000),
        control2: CGPoint(x: 17.250000, y: 8.585787))
      p.addLine(to: CGPoint(x: 18.000000, y: 9.000000))
      p.addLine(to: CGPoint(x: 18.750000, y: 9.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 0.000000, y: 11.000000))
      p.addLine(to: CGPoint(x: 0.750000, y: 11.000000))
      p.addLine(to: CGPoint(x: 0.750000, y: 6.500000))
      p.addLine(to: CGPoint(x: 0.000000, y: 6.500000))
      p.addLine(to: CGPoint(x: -0.750000, y: 6.500000))
      p.addLine(to: CGPoint(x: -0.750000, y: 11.000000))
      p.addLine(to: CGPoint(x: 0.000000, y: 11.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 0.000000, y: 6.500000))
      p.addLine(to: CGPoint(x: 0.750000, y: 6.500000))
      p.addCurve(
        to: CGPoint(x: 0.969670, y: 5.969670), control1: CGPoint(x: 0.750000, y: 6.301087),
        control2: CGPoint(x: 0.829018, y: 6.110322))
      p.addLine(to: CGPoint(x: 0.439340, y: 5.439340))
      p.addLine(to: CGPoint(x: -0.090990, y: 4.909009))
      p.addCurve(
        to: CGPoint(x: -0.750000, y: 6.500000), control1: CGPoint(x: -0.512947, y: 5.330966),
        control2: CGPoint(x: -0.750000, y: 5.903263))
      p.addLine(to: CGPoint(x: 0.000000, y: 6.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 0.439340, y: 5.439340))
      p.addLine(to: CGPoint(x: 0.969670, y: 5.969670))
      p.addCurve(
        to: CGPoint(x: 1.500000, y: 5.750000), control1: CGPoint(x: 1.110322, y: 5.829018),
        control2: CGPoint(x: 1.301087, y: 5.750000))
      p.addLine(to: CGPoint(x: 1.500000, y: 5.000000))
      p.addLine(to: CGPoint(x: 1.500000, y: 4.250000))
      p.addCurve(
        to: CGPoint(x: -0.090990, y: 4.909009), control1: CGPoint(x: 0.903263, y: 4.250000),
        control2: CGPoint(x: 0.330967, y: 4.487052))
      p.addLine(to: CGPoint(x: 0.439340, y: 5.439340))
      p.closeSubpath()
      p.move(to: CGPoint(x: 1.500000, y: 5.000000))
      p.addLine(to: CGPoint(x: 1.500000, y: 5.750000))
      p.addCurve(
        to: CGPoint(x: 2.030330, y: 5.969670), control1: CGPoint(x: 1.698913, y: 5.750000),
        control2: CGPoint(x: 1.889678, y: 5.829018))
      p.addLine(to: CGPoint(x: 2.560660, y: 5.439340))
      p.addLine(to: CGPoint(x: 3.090991, y: 4.909009))
      p.addCurve(
        to: CGPoint(x: 1.500000, y: 4.250000), control1: CGPoint(x: 2.669033, y: 4.487052),
        control2: CGPoint(x: 2.096737, y: 4.250000))
      p.addLine(to: CGPoint(x: 1.500000, y: 5.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 2.560660, y: 5.439340))
      p.addLine(to: CGPoint(x: 2.030330, y: 5.969670))
      p.addCurve(
        to: CGPoint(x: 2.250000, y: 6.500000), control1: CGPoint(x: 2.170982, y: 6.110322),
        control2: CGPoint(x: 2.250000, y: 6.301087))
      p.addLine(to: CGPoint(x: 3.000000, y: 6.500000))
      p.addLine(to: CGPoint(x: 3.750000, y: 6.500000))
      p.addCurve(
        to: CGPoint(x: 3.090991, y: 4.909009), control1: CGPoint(x: 3.750000, y: 5.903263),
        control2: CGPoint(x: 3.512948, y: 5.330966))
      p.addLine(to: CGPoint(x: 2.560660, y: 5.439340))
      p.closeSubpath()
      p.move(to: CGPoint(x: 3.000000, y: 6.500000))
      p.addLine(to: CGPoint(x: 2.250000, y: 6.500000))
      p.addLine(to: CGPoint(x: 2.250000, y: 13.500000))
      p.addLine(to: CGPoint(x: 3.000000, y: 13.500000))
      p.addLine(to: CGPoint(x: 3.750000, y: 13.500000))
      p.addLine(to: CGPoint(x: 3.750000, y: 6.500000))
      p.addLine(to: CGPoint(x: 3.000000, y: 6.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 3.000000, y: 13.500000))
      p.addLine(to: CGPoint(x: 2.250000, y: 13.500000))
      p.addCurve(
        to: CGPoint(x: 2.909009, y: 15.090989), control1: CGPoint(x: 2.250000, y: 14.096737),
        control2: CGPoint(x: 2.487053, y: 14.669033))
      p.addLine(to: CGPoint(x: 3.439340, y: 14.560659))
      p.addLine(to: CGPoint(x: 3.969670, y: 14.030330))
      p.addCurve(
        to: CGPoint(x: 3.750000, y: 13.500000), control1: CGPoint(x: 3.829017, y: 13.889677),
        control2: CGPoint(x: 3.750000, y: 13.698913))
      p.addLine(to: CGPoint(x: 3.000000, y: 13.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 3.439340, y: 14.560659))
      p.addLine(to: CGPoint(x: 2.909009, y: 15.090989))
      p.addCurve(
        to: CGPoint(x: 4.500000, y: 15.750000), control1: CGPoint(x: 3.330966, y: 15.512946),
        control2: CGPoint(x: 3.903262, y: 15.750000))
      p.addLine(to: CGPoint(x: 4.500000, y: 15.000000))
      p.addLine(to: CGPoint(x: 4.500000, y: 14.250000))
      p.addCurve(
        to: CGPoint(x: 3.969670, y: 14.030330), control1: CGPoint(x: 4.301088, y: 14.250000),
        control2: CGPoint(x: 4.110322, y: 14.170982))
      p.addLine(to: CGPoint(x: 3.439340, y: 14.560659))
      p.closeSubpath()
      p.move(to: CGPoint(x: 4.500000, y: 15.000000))
      p.addLine(to: CGPoint(x: 4.500000, y: 15.750000))
      p.addCurve(
        to: CGPoint(x: 6.090991, y: 15.090989), control1: CGPoint(x: 5.096738, y: 15.750000),
        control2: CGPoint(x: 5.669034, y: 15.512946))
      p.addLine(to: CGPoint(x: 5.560660, y: 14.560659))
      p.addLine(to: CGPoint(x: 5.030330, y: 14.030330))
      p.addCurve(
        to: CGPoint(x: 4.500000, y: 14.250000), control1: CGPoint(x: 4.889678, y: 14.170982),
        control2: CGPoint(x: 4.698912, y: 14.250000))
      p.addLine(to: CGPoint(x: 4.500000, y: 15.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 5.560660, y: 14.560659))
      p.addLine(to: CGPoint(x: 6.090991, y: 15.090989))
      p.addCurve(
        to: CGPoint(x: 6.750000, y: 13.500000), control1: CGPoint(x: 6.512947, y: 14.669033),
        control2: CGPoint(x: 6.750000, y: 14.096737))
      p.addLine(to: CGPoint(x: 6.000000, y: 13.500000))
      p.addLine(to: CGPoint(x: 5.250000, y: 13.500000))
      p.addCurve(
        to: CGPoint(x: 5.030330, y: 14.030330), control1: CGPoint(x: 5.250000, y: 13.698913),
        control2: CGPoint(x: 5.170983, y: 13.889677))
      p.addLine(to: CGPoint(x: 5.560660, y: 14.560659))
      p.closeSubpath()
      p.move(to: CGPoint(x: 6.000000, y: 13.500000))
      p.addLine(to: CGPoint(x: 6.750000, y: 13.500000))
      p.addLine(to: CGPoint(x: 6.750000, y: 1.500000))
      p.addLine(to: CGPoint(x: 6.000000, y: 1.500000))
      p.addLine(to: CGPoint(x: 5.250000, y: 1.500000))
      p.addLine(to: CGPoint(x: 5.250000, y: 13.500000))
      p.addLine(to: CGPoint(x: 6.000000, y: 13.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 6.000000, y: 1.500000))
      p.addLine(to: CGPoint(x: 6.750000, y: 1.500000))
      p.addCurve(
        to: CGPoint(x: 6.969670, y: 0.969670), control1: CGPoint(x: 6.750000, y: 1.301087),
        control2: CGPoint(x: 6.829018, y: 1.110322))
      p.addLine(to: CGPoint(x: 6.439340, y: 0.439340))
      p.addLine(to: CGPoint(x: 5.909009, y: -0.090990))
      p.addCurve(
        to: CGPoint(x: 5.250000, y: 1.500000), control1: CGPoint(x: 5.487052, y: 0.330967),
        control2: CGPoint(x: 5.250000, y: 0.903263))
      p.addLine(to: CGPoint(x: 6.000000, y: 1.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 6.439340, y: 0.439340))
      p.addLine(to: CGPoint(x: 6.969670, y: 0.969670))
      p.addCurve(
        to: CGPoint(x: 7.500000, y: 0.750000), control1: CGPoint(x: 7.110322, y: 0.829018),
        control2: CGPoint(x: 7.301087, y: 0.750000))
      p.addLine(to: CGPoint(x: 7.500000, y: 0.000000))
      p.addLine(to: CGPoint(x: 7.500000, y: -0.750000))
      p.addCurve(
        to: CGPoint(x: 5.909009, y: -0.090990), control1: CGPoint(x: 6.903263, y: -0.750000),
        control2: CGPoint(x: 6.330966, y: -0.512947))
      p.addLine(to: CGPoint(x: 6.439340, y: 0.439340))
      p.closeSubpath()
      p.move(to: CGPoint(x: 7.500000, y: 0.000000))
      p.addLine(to: CGPoint(x: 7.500000, y: 0.750000))
      p.addCurve(
        to: CGPoint(x: 8.030331, y: 0.969670), control1: CGPoint(x: 7.698913, y: 0.750000),
        control2: CGPoint(x: 7.889678, y: 0.829018))
      p.addLine(to: CGPoint(x: 8.560660, y: 0.439340))
      p.addLine(to: CGPoint(x: 9.090990, y: -0.090990))
      p.addCurve(
        to: CGPoint(x: 7.500000, y: -0.750000), control1: CGPoint(x: 8.669034, y: -0.512947),
        control2: CGPoint(x: 8.096737, y: -0.750000))
      p.addLine(to: CGPoint(x: 7.500000, y: 0.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 8.560660, y: 0.439340))
      p.addLine(to: CGPoint(x: 8.030331, y: 0.969670))
      p.addCurve(
        to: CGPoint(x: 8.250000, y: 1.500000), control1: CGPoint(x: 8.170982, y: 1.110322),
        control2: CGPoint(x: 8.250000, y: 1.301087))
      p.addLine(to: CGPoint(x: 9.000000, y: 1.500000))
      p.addLine(to: CGPoint(x: 9.750000, y: 1.500000))
      p.addCurve(
        to: CGPoint(x: 9.090990, y: -0.090990), control1: CGPoint(x: 9.750000, y: 0.903263),
        control2: CGPoint(x: 9.512947, y: 0.330967))
      p.addLine(to: CGPoint(x: 8.560660, y: 0.439340))
      p.closeSubpath()
      p.move(to: CGPoint(x: 9.000000, y: 1.500000))
      p.addLine(to: CGPoint(x: 8.250000, y: 1.500000))
      p.addLine(to: CGPoint(x: 8.250000, y: 16.500000))
      p.addLine(to: CGPoint(x: 9.000000, y: 16.500000))
      p.addLine(to: CGPoint(x: 9.750000, y: 16.500000))
      p.addLine(to: CGPoint(x: 9.750000, y: 1.500000))
      p.addLine(to: CGPoint(x: 9.000000, y: 1.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 9.000000, y: 16.500000))
      p.addLine(to: CGPoint(x: 8.250000, y: 16.500000))
      p.addCurve(
        to: CGPoint(x: 8.909010, y: 18.090990), control1: CGPoint(x: 8.250000, y: 17.096737),
        control2: CGPoint(x: 8.487053, y: 17.669033))
      p.addLine(to: CGPoint(x: 9.439340, y: 17.560659))
      p.addLine(to: CGPoint(x: 9.969669, y: 17.030329))
      p.addCurve(
        to: CGPoint(x: 9.750000, y: 16.500000), control1: CGPoint(x: 9.829018, y: 16.889677),
        control2: CGPoint(x: 9.750000, y: 16.698912))
      p.addLine(to: CGPoint(x: 9.000000, y: 16.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 9.439340, y: 17.560659))
      p.addLine(to: CGPoint(x: 8.909010, y: 18.090990))
      p.addCurve(
        to: CGPoint(x: 10.500000, y: 18.750000), control1: CGPoint(x: 9.330966, y: 18.512945),
        control2: CGPoint(x: 9.903262, y: 18.750000))
      p.addLine(to: CGPoint(x: 10.500000, y: 18.000000))
      p.addLine(to: CGPoint(x: 10.500000, y: 17.250000))
      p.addCurve(
        to: CGPoint(x: 9.969669, y: 17.030329), control1: CGPoint(x: 10.301088, y: 17.250000),
        control2: CGPoint(x: 10.110323, y: 17.170982))
      p.addLine(to: CGPoint(x: 9.439340, y: 17.560659))
      p.closeSubpath()
      p.move(to: CGPoint(x: 10.500000, y: 18.000000))
      p.addLine(to: CGPoint(x: 10.500000, y: 18.750000))
      p.addCurve(
        to: CGPoint(x: 12.090990, y: 18.090990), control1: CGPoint(x: 11.096738, y: 18.750000),
        control2: CGPoint(x: 11.669034, y: 18.512945))
      p.addLine(to: CGPoint(x: 11.560660, y: 17.560659))
      p.addLine(to: CGPoint(x: 11.030331, y: 17.030329))
      p.addCurve(
        to: CGPoint(x: 10.500000, y: 17.250000), control1: CGPoint(x: 10.889677, y: 17.170982),
        control2: CGPoint(x: 10.698912, y: 17.250000))
      p.addLine(to: CGPoint(x: 10.500000, y: 18.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 11.560660, y: 17.560659))
      p.addLine(to: CGPoint(x: 12.090990, y: 18.090990))
      p.addCurve(
        to: CGPoint(x: 12.750000, y: 16.500000), control1: CGPoint(x: 12.512947, y: 17.669033),
        control2: CGPoint(x: 12.750000, y: 17.096737))
      p.addLine(to: CGPoint(x: 12.000000, y: 16.500000))
      p.addLine(to: CGPoint(x: 11.250000, y: 16.500000))
      p.addCurve(
        to: CGPoint(x: 11.030331, y: 17.030329), control1: CGPoint(x: 11.250000, y: 16.698912),
        control2: CGPoint(x: 11.170982, y: 16.889677))
      p.addLine(to: CGPoint(x: 11.560660, y: 17.560659))
      p.closeSubpath()
      p.move(to: CGPoint(x: 12.000000, y: 16.500000))
      p.addLine(to: CGPoint(x: 12.750000, y: 16.500000))
      p.addLine(to: CGPoint(x: 12.750000, y: 5.500000))
      p.addLine(to: CGPoint(x: 12.000000, y: 5.500000))
      p.addLine(to: CGPoint(x: 11.250000, y: 5.500000))
      p.addLine(to: CGPoint(x: 11.250000, y: 16.500000))
      p.addLine(to: CGPoint(x: 12.000000, y: 16.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 12.000000, y: 5.500000))
      p.addLine(to: CGPoint(x: 12.750000, y: 5.500000))
      p.addCurve(
        to: CGPoint(x: 12.969669, y: 4.969670), control1: CGPoint(x: 12.750000, y: 5.301087),
        control2: CGPoint(x: 12.829018, y: 5.110322))
      p.addLine(to: CGPoint(x: 12.439340, y: 4.439340))
      p.addLine(to: CGPoint(x: 11.909010, y: 3.909009))
      p.addCurve(
        to: CGPoint(x: 11.250000, y: 5.500000), control1: CGPoint(x: 11.487053, y: 4.330966),
        control2: CGPoint(x: 11.250000, y: 4.903263))
      p.addLine(to: CGPoint(x: 12.000000, y: 5.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 12.439340, y: 4.439340))
      p.addLine(to: CGPoint(x: 12.969669, y: 4.969670))
      p.addCurve(
        to: CGPoint(x: 13.500000, y: 4.750000), control1: CGPoint(x: 13.110322, y: 4.829018),
        control2: CGPoint(x: 13.301087, y: 4.750000))
      p.addLine(to: CGPoint(x: 13.500000, y: 4.000000))
      p.addLine(to: CGPoint(x: 13.500000, y: 3.250000))
      p.addCurve(
        to: CGPoint(x: 11.909010, y: 3.909009), control1: CGPoint(x: 12.903263, y: 3.250000),
        control2: CGPoint(x: 12.330967, y: 3.487052))
      p.addLine(to: CGPoint(x: 12.439340, y: 4.439340))
      p.closeSubpath()
      p.move(to: CGPoint(x: 13.500000, y: 4.000000))
      p.addLine(to: CGPoint(x: 13.500000, y: 4.750000))
      p.addCurve(
        to: CGPoint(x: 14.030330, y: 4.969670), control1: CGPoint(x: 13.698913, y: 4.750000),
        control2: CGPoint(x: 13.889677, y: 4.829017))
      p.addLine(to: CGPoint(x: 14.560659, y: 4.439340))
      p.addLine(to: CGPoint(x: 15.090989, y: 3.909009))
      p.addCurve(
        to: CGPoint(x: 13.500000, y: 3.250000), control1: CGPoint(x: 14.669033, y: 3.487053),
        control2: CGPoint(x: 14.096737, y: 3.250000))
      p.addLine(to: CGPoint(x: 13.500000, y: 4.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 14.560659, y: 4.439340))
      p.addLine(to: CGPoint(x: 14.030330, y: 4.969670))
      p.addCurve(
        to: CGPoint(x: 14.250000, y: 5.500000), control1: CGPoint(x: 14.170982, y: 5.110322),
        control2: CGPoint(x: 14.250000, y: 5.301088))
      p.addLine(to: CGPoint(x: 15.000000, y: 5.500000))
      p.addLine(to: CGPoint(x: 15.750000, y: 5.500000))
      p.addCurve(
        to: CGPoint(x: 15.090989, y: 3.909009), control1: CGPoint(x: 15.750000, y: 4.903262),
        control2: CGPoint(x: 15.512946, y: 4.330966))
      p.addLine(to: CGPoint(x: 14.560659, y: 4.439340))
      p.closeSubpath()
      p.move(to: CGPoint(x: 15.000000, y: 5.500000))
      p.addLine(to: CGPoint(x: 14.250000, y: 5.500000))
      p.addLine(to: CGPoint(x: 14.250000, y: 12.500000))
      p.addLine(to: CGPoint(x: 15.000000, y: 12.500000))
      p.addLine(to: CGPoint(x: 15.750000, y: 12.500000))
      p.addLine(to: CGPoint(x: 15.750000, y: 5.500000))
      p.addLine(to: CGPoint(x: 15.000000, y: 5.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 15.000000, y: 12.500000))
      p.addLine(to: CGPoint(x: 14.250000, y: 12.500000))
      p.addCurve(
        to: CGPoint(x: 14.909011, y: 14.090989), control1: CGPoint(x: 14.250000, y: 13.096739),
        control2: CGPoint(x: 14.487055, y: 13.669034))
      p.addLine(to: CGPoint(x: 15.439341, y: 13.560659))
      p.addLine(to: CGPoint(x: 15.969670, y: 13.030330))
      p.addCurve(
        to: CGPoint(x: 15.750000, y: 12.500000), control1: CGPoint(x: 15.829018, y: 12.889676),
        control2: CGPoint(x: 15.750000, y: 12.698911))
      p.addLine(to: CGPoint(x: 15.000000, y: 12.500000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 15.439341, y: 13.560659))
      p.addLine(to: CGPoint(x: 14.909011, y: 14.090989))
      p.addCurve(
        to: CGPoint(x: 16.500000, y: 14.750000), control1: CGPoint(x: 15.330966, y: 14.512945),
        control2: CGPoint(x: 15.903261, y: 14.750000))
      p.addLine(to: CGPoint(x: 16.500000, y: 14.000000))
      p.addLine(to: CGPoint(x: 16.500000, y: 13.250000))
      p.addCurve(
        to: CGPoint(x: 15.969670, y: 13.030330), control1: CGPoint(x: 16.301088, y: 13.250000),
        control2: CGPoint(x: 16.110325, y: 13.170982))
      p.addLine(to: CGPoint(x: 15.439341, y: 13.560659))
      p.closeSubpath()
      p.move(to: CGPoint(x: 16.500000, y: 14.000000))
      p.addLine(to: CGPoint(x: 16.500000, y: 14.750000))
      p.addCurve(
        to: CGPoint(x: 18.090990, y: 14.090989), control1: CGPoint(x: 17.096739, y: 14.750000),
        control2: CGPoint(x: 17.669033, y: 14.512945))
      p.addLine(to: CGPoint(x: 17.560659, y: 13.560659))
      p.addLine(to: CGPoint(x: 17.030329, y: 13.030330))
      p.addCurve(
        to: CGPoint(x: 16.500000, y: 13.250000), control1: CGPoint(x: 16.889675, y: 13.170982),
        control2: CGPoint(x: 16.698912, y: 13.250000))
      p.addLine(to: CGPoint(x: 16.500000, y: 14.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 17.560659, y: 13.560659))
      p.addLine(to: CGPoint(x: 18.090990, y: 14.090989))
      p.addCurve(
        to: CGPoint(x: 18.750000, y: 12.500000), control1: CGPoint(x: 18.512945, y: 13.669034),
        control2: CGPoint(x: 18.750000, y: 13.096739))
      p.addLine(to: CGPoint(x: 18.000000, y: 12.500000))
      p.addLine(to: CGPoint(x: 17.250000, y: 12.500000))
      p.addCurve(
        to: CGPoint(x: 17.030329, y: 13.030330), control1: CGPoint(x: 17.250000, y: 12.698911),
        control2: CGPoint(x: 17.170982, y: 12.889676))
      p.addLine(to: CGPoint(x: 17.560659, y: 13.560659))
      p.closeSubpath()
      p.move(to: CGPoint(x: 18.000000, y: 12.500000))
      p.addLine(to: CGPoint(x: 18.750000, y: 12.500000))
      p.addLine(to: CGPoint(x: 18.750000, y: 9.000000))
      p.addLine(to: CGPoint(x: 18.000000, y: 9.000000))
      p.addLine(to: CGPoint(x: 17.250000, y: 9.000000))
      p.addLine(to: CGPoint(x: 17.250000, y: 12.500000))
      p.addLine(to: CGPoint(x: 18.000000, y: 12.500000))
      p.closeSubpath()
    case .companion:
      p.move(to: CGPoint(x: 13.500000, y: 0.000000))
      p.addCurve(
        to: CGPoint(x: 15.235625, y: 0.702944), control1: CGPoint(x: 14.150987, y: 0.000000),
        control2: CGPoint(x: 14.775309, y: 0.252856))
      p.addCurve(
        to: CGPoint(x: 15.954546, y: 2.400000), control1: CGPoint(x: 15.695942, y: 1.153031),
        control2: CGPoint(x: 15.954546, y: 1.763480))
      p.addCurve(
        to: CGPoint(x: 14.727273, y: 4.476000), control1: CGPoint(x: 15.954546, y: 3.288000),
        control2: CGPoint(x: 15.463636, y: 4.068000))
      p.addLine(to: CGPoint(x: 14.727273, y: 6.000000))
      p.addLine(to: CGPoint(x: 15.954546, y: 6.000000))
      p.addCurve(
        to: CGPoint(x: 22.029236, y: 8.460304), control1: CGPoint(x: 18.232996, y: 6.000000),
        control2: CGPoint(x: 20.418127, y: 6.884998))
      p.addCurve(
        to: CGPoint(x: 24.545456, y: 14.400001), control1: CGPoint(x: 23.640343, y: 10.035609),
        control2: CGPoint(x: 24.545456, y: 12.172182))
      p.addLine(to: CGPoint(x: 25.772728, y: 14.400001))
      p.addCurve(
        to: CGPoint(x: 26.640541, y: 14.751472), control1: CGPoint(x: 26.098221, y: 14.400001),
        control2: CGPoint(x: 26.410383, y: 14.526429))
      p.addCurve(
        to: CGPoint(x: 27.000000, y: 15.600000), control1: CGPoint(x: 26.870699, y: 14.976517),
        control2: CGPoint(x: 27.000000, y: 15.281741))
      p.addLine(to: CGPoint(x: 27.000000, y: 19.200001))
      p.addCurve(
        to: CGPoint(x: 26.640541, y: 20.048531), control1: CGPoint(x: 27.000000, y: 19.518261),
        control2: CGPoint(x: 26.870699, y: 19.823486))
      p.addCurve(
        to: CGPoint(x: 25.772728, y: 20.400002), control1: CGPoint(x: 26.410383, y: 20.273573),
        control2: CGPoint(x: 26.098221, y: 20.400002))
      p.addLine(to: CGPoint(x: 24.545456, y: 20.400002))
      p.addLine(to: CGPoint(x: 24.545456, y: 21.600000))
      p.addCurve(
        to: CGPoint(x: 23.826534, y: 23.297056), control1: CGPoint(x: 24.545456, y: 22.236521),
        control2: CGPoint(x: 24.286852, y: 22.846970))
      p.addCurve(
        to: CGPoint(x: 22.090910, y: 24.000000), control1: CGPoint(x: 23.366219, y: 23.747145),
        control2: CGPoint(x: 22.741896, y: 24.000000))
      p.addLine(to: CGPoint(x: 4.909091, y: 24.000000))
      p.addCurve(
        to: CGPoint(x: 3.173465, y: 23.297056), control1: CGPoint(x: 4.258105, y: 24.000000),
        control2: CGPoint(x: 3.633782, y: 23.747145))
      p.addCurve(
        to: CGPoint(x: 2.454545, y: 21.600000), control1: CGPoint(x: 2.713149, y: 22.846970),
        control2: CGPoint(x: 2.454545, y: 22.236521))
      p.addLine(to: CGPoint(x: 2.454545, y: 20.400002))
      p.addLine(to: CGPoint(x: 1.227273, y: 20.400002))
      p.addCurve(
        to: CGPoint(x: 0.359460, y: 20.048531), control1: CGPoint(x: 0.901780, y: 20.400002),
        control2: CGPoint(x: 0.589618, y: 20.273573))
      p.addCurve(
        to: CGPoint(x: 0.000000, y: 19.200001), control1: CGPoint(x: 0.129302, y: 19.823486),
        control2: CGPoint(x: 0.000000, y: 19.518261))
      p.addLine(to: CGPoint(x: 0.000000, y: 15.600000))
      p.addCurve(
        to: CGPoint(x: 0.359460, y: 14.751472), control1: CGPoint(x: -0.000000, y: 15.281741),
        control2: CGPoint(x: 0.129302, y: 14.976517))
      p.addCurve(
        to: CGPoint(x: 1.227273, y: 14.400001), control1: CGPoint(x: 0.589618, y: 14.526429),
        control2: CGPoint(x: 0.901780, y: 14.400001))
      p.addLine(to: CGPoint(x: 2.454545, y: 14.400001))
      p.addCurve(
        to: CGPoint(x: 4.970765, y: 8.460304), control1: CGPoint(x: 2.454545, y: 12.172182),
        control2: CGPoint(x: 3.359657, y: 10.035609))
      p.addCurve(
        to: CGPoint(x: 11.045455, y: 6.000000), control1: CGPoint(x: 6.581872, y: 6.884998),
        control2: CGPoint(x: 8.767004, y: 6.000000))
      p.addLine(to: CGPoint(x: 12.272728, y: 6.000000))
      p.addLine(to: CGPoint(x: 12.272728, y: 4.476000))
      p.addCurve(
        to: CGPoint(x: 11.045455, y: 2.400000), control1: CGPoint(x: 11.536364, y: 4.068000),
        control2: CGPoint(x: 11.045455, y: 3.288000))
      p.addCurve(
        to: CGPoint(x: 11.764375, y: 0.702944), control1: CGPoint(x: 11.045455, y: 1.763480),
        control2: CGPoint(x: 11.304058, y: 1.153031))
      p.addCurve(
        to: CGPoint(x: 13.500000, y: 0.000000), control1: CGPoint(x: 12.224691, y: 0.252856),
        control2: CGPoint(x: 12.849014, y: 0.000000))
      p.closeSubpath()
      p.move(to: CGPoint(x: 7.977273, y: 13.200001))
      p.addCurve(
        to: CGPoint(x: 5.807741, y: 14.078680), control1: CGPoint(x: 7.163540, y: 13.200001),
        control2: CGPoint(x: 6.383136, y: 13.516071))
      p.addCurve(
        to: CGPoint(x: 4.909091, y: 16.200001), control1: CGPoint(x: 5.232345, y: 14.641290),
        control2: CGPoint(x: 4.909091, y: 15.404351))
      p.addCurve(
        to: CGPoint(x: 5.807741, y: 18.321321), control1: CGPoint(x: 4.909091, y: 16.995649),
        control2: CGPoint(x: 5.232345, y: 17.758713))
      p.addCurve(
        to: CGPoint(x: 7.977273, y: 19.200001), control1: CGPoint(x: 6.383136, y: 18.883930),
        control2: CGPoint(x: 7.163540, y: 19.200001))
      p.addCurve(
        to: CGPoint(x: 10.146805, y: 18.321321), control1: CGPoint(x: 8.791005, y: 19.200001),
        control2: CGPoint(x: 9.571409, y: 18.883930))
      p.addCurve(
        to: CGPoint(x: 11.045455, y: 16.200001), control1: CGPoint(x: 10.722200, y: 17.758713),
        control2: CGPoint(x: 11.045455, y: 16.995649))
      p.addCurve(
        to: CGPoint(x: 10.146805, y: 14.078680), control1: CGPoint(x: 11.045455, y: 15.404351),
        control2: CGPoint(x: 10.722200, y: 14.641290))
      p.addCurve(
        to: CGPoint(x: 7.977273, y: 13.200001), control1: CGPoint(x: 9.571409, y: 13.516071),
        control2: CGPoint(x: 8.791005, y: 13.200001))
      p.closeSubpath()
      p.move(to: CGPoint(x: 19.022728, y: 13.200001))
      p.addCurve(
        to: CGPoint(x: 16.853195, y: 14.078680), control1: CGPoint(x: 18.208996, y: 13.200001),
        control2: CGPoint(x: 17.428591, y: 13.516071))
      p.addCurve(
        to: CGPoint(x: 15.954546, y: 16.200001), control1: CGPoint(x: 16.277800, y: 14.641290),
        control2: CGPoint(x: 15.954546, y: 15.404351))
      p.addCurve(
        to: CGPoint(x: 16.853195, y: 18.321321), control1: CGPoint(x: 15.954546, y: 16.995649),
        control2: CGPoint(x: 16.277800, y: 17.758713))
      p.addCurve(
        to: CGPoint(x: 19.022728, y: 19.200001), control1: CGPoint(x: 17.428591, y: 18.883930),
        control2: CGPoint(x: 18.208996, y: 19.200001))
      p.addCurve(
        to: CGPoint(x: 21.192261, y: 18.321321), control1: CGPoint(x: 19.836460, y: 19.200001),
        control2: CGPoint(x: 20.616863, y: 18.883930))
      p.addCurve(
        to: CGPoint(x: 22.090910, y: 16.200001), control1: CGPoint(x: 21.767656, y: 17.758713),
        control2: CGPoint(x: 22.090910, y: 16.995649))
      p.addCurve(
        to: CGPoint(x: 21.192261, y: 14.078680), control1: CGPoint(x: 22.090910, y: 15.404351),
        control2: CGPoint(x: 21.767656, y: 14.641290))
      p.addCurve(
        to: CGPoint(x: 19.022728, y: 13.200001), control1: CGPoint(x: 20.616863, y: 13.516071),
        control2: CGPoint(x: 19.836460, y: 13.200001))
      p.closeSubpath()
    case .composerAdd:
      p.move(to: CGPoint(x: 5.894737, y: 13.136906))
      p.addCurve(
        to: CGPoint(x: 6.218461, y: 13.933122), control1: CGPoint(x: 5.894737, y: 13.435545),
        control2: CGPoint(x: 6.011184, y: 13.721952))
      p.addCurve(
        to: CGPoint(x: 7.000000, y: 14.262926), control1: CGPoint(x: 6.425738, y: 14.144292),
        control2: CGPoint(x: 6.706866, y: 14.262926))
      p.addCurve(
        to: CGPoint(x: 7.781539, y: 13.933122), control1: CGPoint(x: 7.293134, y: 14.262926),
        control2: CGPoint(x: 7.574262, y: 14.144292))
      p.addCurve(
        to: CGPoint(x: 8.105263, y: 13.136906), control1: CGPoint(x: 7.988816, y: 13.721952),
        control2: CGPoint(x: 8.105263, y: 13.435545))
      p.addLine(to: CGPoint(x: 8.105263, y: 8.257483))
      p.addLine(to: CGPoint(x: 12.894736, y: 8.257483))
      p.addCurve(
        to: CGPoint(x: 13.676275, y: 7.927680), control1: CGPoint(x: 13.187871, y: 8.257483),
        control2: CGPoint(x: 13.468998, y: 8.138850))
      p.addCurve(
        to: CGPoint(x: 14.000000, y: 7.131463), control1: CGPoint(x: 13.883553, y: 7.716510),
        control2: CGPoint(x: 14.000000, y: 7.430102))
      p.addCurve(
        to: CGPoint(x: 13.676275, y: 6.335246), control1: CGPoint(x: 14.000000, y: 6.832824),
        control2: CGPoint(x: 13.883553, y: 6.546416))
      p.addCurve(
        to: CGPoint(x: 12.894736, y: 6.005443), control1: CGPoint(x: 13.468998, y: 6.124076),
        control2: CGPoint(x: 13.187871, y: 6.005443))
      p.addLine(to: CGPoint(x: 8.105263, y: 6.005443))
      p.addLine(to: CGPoint(x: 8.105263, y: 1.126020))
      p.addCurve(
        to: CGPoint(x: 7.781539, y: 0.329804), control1: CGPoint(x: 8.105263, y: 0.827381),
        control2: CGPoint(x: 7.988816, y: 0.540974))
      p.addCurve(
        to: CGPoint(x: 7.000000, y: 0.000000), control1: CGPoint(x: 7.574262, y: 0.118634),
        control2: CGPoint(x: 7.293134, y: 0.000000))
      p.addCurve(
        to: CGPoint(x: 6.218461, y: 0.329804), control1: CGPoint(x: 6.706866, y: 0.000000),
        control2: CGPoint(x: 6.425738, y: 0.118634))
      p.addCurve(
        to: CGPoint(x: 5.894737, y: 1.126020), control1: CGPoint(x: 6.011184, y: 0.540974),
        control2: CGPoint(x: 5.894737, y: 0.827381))
      p.addLine(to: CGPoint(x: 5.894737, y: 6.005443))
      p.addLine(to: CGPoint(x: 1.105263, y: 6.005443))
      p.addCurve(
        to: CGPoint(x: 0.323724, y: 6.335246), control1: CGPoint(x: 0.812129, y: 6.005443),
        control2: CGPoint(x: 0.531001, y: 6.124076))
      p.addCurve(
        to: CGPoint(x: 0.000000, y: 7.131463), control1: CGPoint(x: 0.116447, y: 6.546416),
        control2: CGPoint(x: 0.000000, y: 6.832824))
      p.addCurve(
        to: CGPoint(x: 0.323724, y: 7.927680), control1: CGPoint(x: 0.000000, y: 7.430102),
        control2: CGPoint(x: 0.116447, y: 7.716510))
      p.addCurve(
        to: CGPoint(x: 1.105263, y: 8.257483), control1: CGPoint(x: 0.531001, y: 8.138850),
        control2: CGPoint(x: 0.812129, y: 8.257483))
      p.addLine(to: CGPoint(x: 5.894737, y: 8.257483))
      p.addLine(to: CGPoint(x: 5.894737, y: 13.136906))
      p.closeSubpath()
    case .composerSend:
      p.move(to: CGPoint(x: 1.124821, y: 13.923566))
      p.addCurve(
        to: CGPoint(x: 0.361550, y: 13.841506), control1: CGPoint(x: 0.857006, y: 14.047898),
        control2: CGPoint(x: 0.602583, y: 14.020546))
      p.addCurve(
        to: CGPoint(x: 0.000000, y: 13.061007), control1: CGPoint(x: 0.120517, y: 13.662467),
        control2: CGPoint(x: 0.000000, y: 13.402300))
      p.addLine(to: CGPoint(x: 0.000000, y: 8.864769))
      p.addLine(to: CGPoint(x: 6.427547, y: 6.999774))
      p.addLine(to: CGPoint(x: 0.000000, y: 5.134780))
      p.addLine(to: CGPoint(x: 0.000000, y: 0.938543))
      p.addCurve(
        to: CGPoint(x: 0.361550, y: 0.158043), control1: CGPoint(x: 0.000000, y: 0.596628),
        control2: CGPoint(x: 0.120517, y: 0.336461))
      p.addCurve(
        to: CGPoint(x: 1.124821, y: 0.075983), control1: CGPoint(x: 0.602583, y: -0.020375),
        control2: CGPoint(x: 0.857006, y: -0.047728))
      p.addLine(to: CGPoint(x: 13.497849, y: 6.137215))
      p.addCurve(
        to: CGPoint(x: 14.000000, y: 6.999774), control1: CGPoint(x: 13.832616, y: 6.308172),
        control2: CGPoint(x: 14.000000, y: 6.595692))
      p.addCurve(
        to: CGPoint(x: 13.497849, y: 7.862335), control1: CGPoint(x: 14.000000, y: 7.403857),
        control2: CGPoint(x: 13.832616, y: 7.691377))
      p.addLine(to: CGPoint(x: 1.124821, y: 13.923566))
      p.closeSubpath()
    }
    return p
  }
}

struct AppIcon: View {
  let symbol: AppSymbol
  var body: some View {
    symbol.path.fill().frame(width: symbol.size.width, height: symbol.size.height)
      .accessibilityHidden(true)
  }
}
