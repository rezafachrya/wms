part of 'widgets.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({
    Key key,
    @required this.height,
  })  : assert(height != null, 'height must not be null'),
        assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/wms.png',
      color: Colors.white,
      height: height.h,
    );
  }
}
