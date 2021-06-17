part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function? onBackButtonPressed;
  final Widget? child;
  final Color? backColor;

  GeneralPage(
      {this.title = "Title",
      this.subtitle = "subtitle",
      this.onBackButtonPressed,
      this.child,
      this.backColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_24.w),
                    width: double.infinity,
                    height: Sizes.dimen_48.h,
                    color: Colors.white,
                    child: Row(
                      children: [
                        onBackButtonPressed != null
                            ? GestureDetector(
                                onTap: () {
                                  if (onBackButtonPressed != null) {
                                    onBackButtonPressed!();
                                  }
                                },
                                child: Container(
                                  width: Sizes.dimen_24.w,
                                  height: Sizes.dimen_24.w,
                                  margin:
                                      EdgeInsets.only(right: Sizes.dimen_24.w),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/back_arrow.png'))),
                                ),
                              )
                            : SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: Theme.of(context).textTheme.blackHeadline6,
                            ),
                            Text(
                              subtitle,
                              style: Theme.of(context).textTheme.greySubtitle1,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  // Container(
                  //   height: Sizes.dimen_24.h,
                  //   width: double.infinity,
                  //   color: "FAFAFC".toColor(),
                  // ),
                  child ?? SizedBox()
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
