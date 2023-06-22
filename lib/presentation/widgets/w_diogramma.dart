import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';

class CircularChart extends StatelessWidget {
  const CircularChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Stack(
          children: [
            ChartShadow(
              data: [
                ChartData(
                  const Color(0xFF973F34),
                  50,
                ),
                ChartData(
                  const Color(0xFF105B58),
                  50,
                )
              ],
              radius: 60,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            PieChart(
              data: [
                PieChartData(
                    const Color(0xFFFF725F),
                    50,
                    ui.Gradient.radial(
                      const Offset(0.1, 0.1),
                      500,
                      [
                        const Color(0xFFFF725F),
                        const Color(0xFFFE9A7B),
                      ],
                    )),
                PieChartData(
                    const Color(0xFF1CD8D2),
                    50,
                    ui.Gradient.radial(
                      const Offset(0.1, 0.1),
                      500,
                      [
                        const Color(0xFF1CD8D2),
                        const Color(0xFF93EDC7),
                      ],
                    )),
              ],
              radius: 60,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Xarajatlar',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "2 226 000 so'm",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartData {
  PieChartData(this.color, this.percent, this.gradient);

  final Color color;
  final double percent;
  final Shader gradient;
}

class PieChart extends StatelessWidget {
  PieChart({
    required this.data,
    required this.radius,
    this.strokeWidth = 24,
    this.child,
    Key? key,
  })  : assert(data.fold<double>(0, (sum, data) => sum + data.percent) <= 100),
        super(key: key);

  final List<PieChartData> data;
  final double radius;
  final double strokeWidth;
  final Widget? child;

  @override
  Widget build(context) {
    return CustomPaint(
      painter: _Painter(strokeWidth, data),
      size: Size.square(radius),
      child: SizedBox.square(
        dimension: radius * 4,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

class _PainterData {
  const _PainterData(this.paint, this.radians);

  final Paint paint;
  final double radians;
}

class _Painter extends CustomPainter {
  _Painter(double strokeWidth, List<PieChartData> data) {
    dataList = data
        .map((e) => _PainterData(
      Paint()
        ..shader = e.gradient
        ..color = e.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
      (e.percent - _padding) * _percentInRadians,
    ))
        .toList();
  }

  static const _percentInRadians = 0.062831853071796;
  static const _padding = 5;
  static const _paddingInRadians = _percentInRadians * _padding;
  static const _startAngle = -1.570796 + _paddingInRadians / 2;

  late final List<_PainterData> dataList;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    double startAngle = _startAngle;

    for (final data in dataList) {
      final path = Path()..addArc(rect, startAngle, data.radians);

      startAngle += data.radians + _paddingInRadians;

      canvas.drawPath(path, data.paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class ChartData {
  ChartData(
      this.color,
      this.percent,
      );

  final Color color;
  final double percent;
}

class ChartShadow extends StatelessWidget {
  ChartShadow({
    required this.data,
    required this.radius,
    this.strokeWidth = 30,
    this.child,
    Key? key,
  })  : assert(data.fold<double>(0, (sum, data) => sum + data.percent) <= 100),
        super(key: key);

  final List<ChartData> data;
  final double radius;
  final double strokeWidth;
  final Widget? child;

  @override
  Widget build(context) {
    return CustomPaint(
      painter: _PainterShadow(strokeWidth, data),
      size: Size.square(radius),
      child: SizedBox.square(
        dimension: radius * 4,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

class _PainterDataShadow {
  const _PainterDataShadow(this.paint, this.radians);

  final Paint paint;
  final double radians;
}

class _PainterShadow extends CustomPainter {
  _PainterShadow(double strokeWidth, List<ChartData> data) {
    dataList = data
        .map((e) => _PainterData(
      Paint()
        ..color = e.color
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
      (e.percent) * _percentInRadians,
    ))
        .toList();
  }

  static const _percentInRadians = 0.062831853071796;
  static const _paddingInRadians = _percentInRadians;
  static const _startAngle = -1.570796 + _paddingInRadians / 2;

  late final List<_PainterData> dataList;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    double startAngle = _startAngle;

    for (final data in dataList) {
      final path = Path()..addArc(rect, startAngle, data.radians);

      startAngle += data.radians + _paddingInRadians;

      canvas.drawPath(path, data.paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}