part of 'widgets.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  //named constructor
  // : -> initializer is executed before the constructor body
  const ShimmerWidget.rectangular({
    Key? key,
    this.width = 20,
    required this.height,
  })  : this.shapeBorder = const RoundedRectangleBorder(),
        super(key: key);

  //named constructor
  const ShimmerWidget.circular({
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.grey[400],
          shape: shapeBorder,
        ),
      ),
    );
  }
}
