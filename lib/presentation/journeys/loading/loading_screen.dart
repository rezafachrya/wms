import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrscan/common/constants/constants.dart';
import 'package:qrscan/common/themes/themes.dart';
import 'package:qrscan/presentation/cubits/loading/loading_cubit.dart';
import 'package:qrscan/common/extensions/extensions.dart';

import 'loading_circle.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;

  const LoadingScreen({Key key, this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, shouldShow) {
        return Stack(
          fit: StackFit.expand,
          children: [
            screen,
            if (shouldShow)
              Container(
                decoration:
                    BoxDecoration(color: ThemeColor.greyColor.withOpacity(0.8)),
                child: Center(
                  child: LoadingCircle(
                    size: Sizes.dimen_200.w,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
