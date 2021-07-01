part of 'widgets.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late Animation<double> animation1;

  late AnimationController controller2;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();
    controller1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation1 = Tween<double>(begin: -pi, end: pi).animate(controller1)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation2 = Tween<double>(begin: -1, end: -4)
        .animate(CurvedAnimation(parent: controller2, curve: Curves.easeInOut))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller2.reverse();
            } else if (status == AnimationStatus.dismissed) {
              controller2.forward();
            }
          });
    controller1.forward();
    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //jika ingin hilangkan backgroundnya hapus scaffold
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: CustomPaint(
            painter: MyPainter(animation1.value, animation2.value),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;

  MyPainter(this.startAngle, this.sweepAngle);

  @override
  void paint(Canvas canvas, Size size) {
    //otomatis stack
    Paint myCircle = Paint()
      ..color = Color(0xFFCFCDF6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(
        Offset(size.width * .5, size.height * .5), size.width * .5, myCircle);

    Paint myArc = Paint()
      ..color = Color(0xFF420097)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(Rect.fromLTRB(0, 0, size.width, size.height), startAngle,
        sweepAngle, false, myArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
