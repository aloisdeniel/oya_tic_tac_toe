import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/glitch.dart';

class GlitchingAppLogo extends StatelessWidget {
  const GlitchingAppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return FadeIn(
      child: AnimatedGlitch(
        scanLineJitter: 0.3,
        verticalJump: 0,
        horizontalShake: 0.02,
        colorDrift: 0.1,
        child: AppLogo(color: theme.color.main.foreground),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: CustomPaint(size: Size(360, 182), painter: _CustomPainter(color)),
    );
  }
}

class _CustomPainter extends CustomPainter {
  _CustomPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final path_0 = Path();
    path_0.moveTo(164.712, 113.437);
    path_0.cubicTo(161.08, 113.437, 157.854, 112.488, 155.035, 110.591);
    path_0.cubicTo(152.216, 108.639, 149.994, 105.983, 148.367, 102.622);
    path_0.cubicTo(146.741, 99.2068, 145.928, 95.3037, 145.928, 90.9127);
    path_0.cubicTo(145.928, 86.4675, 146.714, 82.5644, 148.286, 79.2034);
    path_0.cubicTo(149.912, 75.7882, 152.135, 73.132, 154.954, 71.2346);
    path_0.cubicTo(157.827, 69.2831, 161.134, 68.3073, 164.874, 68.3073);
    path_0.cubicTo(166.826, 68.3073, 168.615, 68.5784, 170.241, 69.1205);
    path_0.cubicTo(171.867, 69.6626, 173.304, 70.4215, 174.551, 71.3973);
    path_0.cubicTo(175.798, 72.373, 176.882, 73.5114, 177.803, 74.8125);
    path_0.cubicTo(178.725, 76.0593, 179.511, 77.4145, 180.161, 78.8782);
    path_0.lineTo(176.828, 78.7969);
    path_0.lineTo(176.828, 69.2018);
    path_0.lineTo(193.009, 69.2018);
    path_0.lineTo(193.009, 112.705);
    path_0.lineTo(176.421, 112.705);
    path_0.lineTo(176.421, 102.053);
    path_0.lineTo(180.08, 102.378);
    path_0.cubicTo(179.538, 103.95, 178.779, 105.414, 177.803, 106.769);
    path_0.cubicTo(176.882, 108.124, 175.77, 109.29, 174.469, 110.266);
    path_0.cubicTo(173.168, 111.241, 171.705, 112.027, 170.078, 112.624);
    path_0.cubicTo(168.452, 113.166, 166.663, 113.437, 164.712, 113.437);
    path_0.close();
    path_0.moveTo(169.428, 100.02);
    path_0.cubicTo(171, 100.02, 172.328, 99.6676, 173.412, 98.9629);
    path_0.cubicTo(174.551, 98.2581, 175.391, 97.2281, 175.933, 95.8729);
    path_0.cubicTo(176.529, 94.5177, 176.828, 92.8643, 176.828, 90.9127);
    path_0.cubicTo(176.828, 88.9612, 176.529, 87.3078, 175.933, 85.9525);
    path_0.cubicTo(175.391, 84.5431, 174.551, 83.486, 173.412, 82.7813);
    path_0.cubicTo(172.328, 82.0766, 171, 81.7242, 169.428, 81.7242);
    path_0.cubicTo(167.856, 81.7242, 166.528, 82.0766, 165.443, 82.7813);
    path_0.cubicTo(164.359, 83.486, 163.519, 84.5431, 162.923, 85.9525);
    path_0.cubicTo(162.381, 87.3078, 162.11, 88.9612, 162.11, 90.9127);
    path_0.cubicTo(162.11, 92.8643, 162.381, 94.5177, 162.923, 95.8729);
    path_0.cubicTo(163.519, 97.2281, 164.359, 98.2581, 165.443, 98.9629);
    path_0.cubicTo(166.528, 99.6676, 167.856, 100.02, 169.428, 100.02);
    path_0.close();

    final path_1 = Path();
    path_1.moveTo(105.379, 131.407);
    path_1.lineTo(116.194, 105.875);
    path_1.lineTo(116.357, 112.542);
    path_1.lineTo(95.947, 69.2018);
    path_1.lineTo(114.324, 69.2018);
    path_1.lineTo(120.341, 83.6757);
    path_1.cubicTo(120.992, 85.1936, 121.534, 86.6302, 121.968, 87.9854);
    path_1.cubicTo(122.456, 89.3407, 122.808, 90.6146, 123.025, 91.8072);
    path_1.lineTo(121.398, 93.2709);
    path_1.cubicTo(121.615, 92.6746, 121.941, 91.753, 122.374, 90.5062);
    path_1.cubicTo(122.808, 89.2051, 123.296, 87.7144, 123.838, 86.0339);
    path_1.lineTo(129.53, 69.2018);
    path_1.lineTo(147.907, 69.2018);
    path_1.lineTo(128.961, 112.705);
    path_1.lineTo(121.317, 131.407);
    path_1.lineTo(105.379, 131.407);
    path_1.close();

    final path_2 = Path();
    path_2.moveTo(65.7811, 113.519);
    path_2.cubicTo(61.2817, 113.519, 57.1618, 112.787, 53.4213, 111.323);
    path_2.cubicTo(49.6808, 109.86, 46.4283, 107.8, 43.6636, 105.143);
    path_2.cubicTo(40.8989, 102.487, 38.7576, 99.343, 37.2397, 95.7109);
    path_2.cubicTo(35.7761, 92.0789, 35.0443, 88.1216, 35.0443, 83.839);
    path_2.cubicTo(35.0443, 79.5022, 35.7761, 75.5449, 37.2397, 71.9671);
    path_2.cubicTo(38.7576, 68.335, 40.8989, 65.1909, 43.6636, 62.5346);
    path_2.cubicTo(46.4283, 59.8783, 49.6808, 57.8184, 53.4213, 56.3547);
    path_2.cubicTo(57.1618, 54.8911, 61.2546, 54.1592, 65.6998, 54.1592);
    path_2.cubicTo(70.1992, 54.1592, 74.292, 54.8911, 77.9783, 56.3547);
    path_2.cubicTo(81.7187, 57.8184, 84.9713, 59.8783, 87.736, 62.5346);
    path_2.cubicTo(90.5007, 65.1909, 92.6149, 68.335, 94.0785, 71.9671);
    path_2.cubicTo(95.5964, 75.5449, 96.3553, 79.4751, 96.3553, 83.7577);
    path_2.cubicTo(96.3553, 88.0945, 95.5964, 92.0789, 94.0785, 95.7109);
    path_2.cubicTo(92.6149, 99.343, 90.5007, 102.487, 87.736, 105.143);
    path_2.cubicTo(84.9713, 107.8, 81.7187, 109.86, 77.9783, 111.323);
    path_2.cubicTo(74.292, 112.787, 70.2263, 113.519, 65.7811, 113.519);
    path_2.close();
    path_2.moveTo(65.6998, 97.2559);
    path_2.cubicTo(67.5429, 97.2559, 69.2234, 96.9306, 70.7413, 96.2801);
    path_2.cubicTo(72.3134, 95.6296, 73.6686, 94.708, 74.807, 93.5154);
    path_2.cubicTo(75.9996, 92.2686, 76.8941, 90.832, 77.4904, 89.2058);
    path_2.cubicTo(78.1409, 87.5795, 78.4662, 85.7905, 78.4662, 83.839);
    path_2.cubicTo(78.4662, 81.8875, 78.1409, 80.0985, 77.4904, 78.4722);
    path_2.cubicTo(76.8941, 76.846, 75.9996, 75.4365, 74.807, 74.2439);
    path_2.cubicTo(73.6686, 72.9971, 72.3134, 72.0484, 70.7413, 71.3979);
    path_2.cubicTo(69.2234, 70.7474, 67.5429, 70.4221, 65.6998, 70.4221);
    path_2.cubicTo(63.8567, 70.4221, 62.1491, 70.7474, 60.577, 71.3979);
    path_2.cubicTo(59.0591, 72.0484, 57.7039, 72.9971, 56.5113, 74.2439);
    path_2.cubicTo(55.3729, 75.4365, 54.4784, 76.846, 53.8279, 78.4722);
    path_2.cubicTo(53.2316, 80.0985, 52.9334, 81.8875, 52.9334, 83.839);
    path_2.cubicTo(52.9334, 85.7905, 53.2316, 87.5795, 53.8279, 89.2058);
    path_2.cubicTo(54.4784, 90.832, 55.3729, 92.2686, 56.5113, 93.5154);
    path_2.cubicTo(57.7039, 94.708, 59.0591, 95.6296, 60.577, 96.2801);
    path_2.cubicTo(62.1491, 96.9306, 63.8567, 97.2559, 65.6998, 97.2559);
    path_2.close();

    final path_3 = Path();
    path_3.moveTo(299.945, 113.601);
    path_3.lineTo(286.043, 113.601);
    path_3.lineTo(286.043, 57.9937);
    path_3.lineTo(299.945, 57.9937);
    path_3.lineTo(299.945, 71.8956);
    path_3.lineTo(313.846, 71.8956);
    path_3.lineTo(313.846, 85.7974);
    path_3.lineTo(299.945, 85.7974);
    path_3.lineTo(299.945, 113.601);
    path_3.close();
    path_3.moveTo(299.945, 127.503);
    path_3.lineTo(299.945, 113.601);
    path_3.lineTo(313.846, 113.601);
    path_3.lineTo(313.846, 127.503);
    path_3.lineTo(299.945, 127.503);
    path_3.close();

    final path_4 = Path();
    path_4.moveTo(260.462, 113.601);
    path_4.lineTo(246.56, 113.601);
    path_4.lineTo(246.56, 57.9937);
    path_4.lineTo(260.462, 57.9937);
    path_4.lineTo(260.462, 71.8956);
    path_4.lineTo(274.364, 71.8956);
    path_4.lineTo(274.364, 85.7974);
    path_4.lineTo(260.462, 85.7974);
    path_4.lineTo(260.462, 113.601);
    path_4.close();
    path_4.moveTo(260.462, 127.503);
    path_4.lineTo(260.462, 113.601);
    path_4.lineTo(274.364, 113.601);
    path_4.lineTo(274.364, 127.503);
    path_4.lineTo(260.462, 127.503);
    path_4.close();

    final path_5 = Path();
    path_5.moveTo(220.981, 113.601);
    path_5.lineTo(207.079, 113.601);
    path_5.lineTo(207.079, 57.9938);
    path_5.lineTo(220.981, 57.9938);
    path_5.lineTo(220.981, 71.8956);
    path_5.lineTo(234.883, 71.8956);
    path_5.lineTo(234.883, 85.7975);
    path_5.lineTo(220.981, 85.7975);
    path_5.lineTo(220.981, 113.601);
    path_5.close();
    path_5.moveTo(220.981, 127.503);
    path_5.lineTo(220.981, 113.601);
    path_5.lineTo(234.883, 113.601);
    path_5.lineTo(234.883, 127.503);
    path_5.lineTo(220.981, 127.503);
    path_5.close();

    canvas.drawPath(path_0, fill);
    canvas.drawPath(path_1, fill);
    canvas.drawPath(path_2, fill);
    canvas.drawPath(path_3, fill);
    canvas.drawPath(path_4, fill);
    canvas.drawPath(path_5, fill);
  }

  @override
  bool shouldRepaint(covariant _CustomPainter oldDelegate) =>
      color != oldDelegate.color;
}
