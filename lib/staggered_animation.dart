import 'package:flutter/material.dart';

const duration = Duration(milliseconds: 2000);

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({super.key});

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: duration, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_controller.isCompleted) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            });
          },
          child: const Icon(Icons.play_arrow),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              child: StaggerAnimation(controller: _controller),
            ),
          ),
        ),
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  const StaggerAnimation({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return CustomPaint(
            painter: MyPainter(controller),
            size: const Size(300, 300),
          );
        });
  }
}

class MyPainter extends CustomPainter {
  final AnimationController controller;

  late final Animation<double> dotGrow;
  late final Animation<double> lineGrow;
  late final Animation<double> linesMove;

  MyPainter(this.controller) {
    dotGrow = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.25, curve: Curves.easeOut)));
    lineGrow = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.3, 0.55, curve: Curves.easeIn)));
    linesMove = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.6, 1.0, curve: Curves.bounceOut)));
  }

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final dotPainter = Paint()
      ..color = Colors.deepOrange
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    final linePainter = Paint()
      ..color = Colors.deepOrange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 40;

    canvas.drawCircle(Offset(centerX, centerY), 20 * dotGrow.value, dotPainter);

    if (dotGrow.value < 1) return;

    canvas.drawLine(
        Offset(
          centerX - centerX * linesMove.value,
          centerX - centerY * lineGrow.value,
        ),
        Offset(
          centerX + centerX * linesMove.value,
          centerX + centerY * lineGrow.value,
        ),
        linePainter);

    canvas.drawLine(
        Offset(
          centerX + centerX * linesMove.value,
          centerX - centerY * lineGrow.value,
        ),
        Offset(
          centerX - centerX * linesMove.value,
          centerX + centerY * lineGrow.value,
        ),
        linePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
