import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qrscan/common/themes/themes.dart';

class LoadingCircle extends StatelessWidget {
  final double size;

  const LoadingCircle({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        height: size,
        child: SpinKitFadingCircle(
          color: ThemeColor.royalBlue,
        ));
  }
}
