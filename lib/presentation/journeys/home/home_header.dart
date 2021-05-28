part of 'home.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
    this.username,
  }) : super(key: key);

  final String username;
  @override
  Widget build(BuildContext context) {
    String username =
        (BlocProvider.of<LoginCubit>(context).state as LoginSuccess)
            .userEntity
            .username;

    String userlocname =
        (BlocProvider.of<LoginCubit>(context).state as LoginSuccess)
            .userEntity
            .userlocname;

    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.3 - Sizes.dimen_48.w,
            color: ThemeColor.homeBackground,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      Sizes.dimen_24.w, 0, Sizes.dimen_24.w, Sizes.dimen_32.w),
                  width: size.width * 0.4,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(SharedImage.logoImage),
                  )),
                )
              ],
            ),
          ),
          //Profile
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Sizes.dimen_24.w),
              padding: EdgeInsets.fromLTRB(Sizes.dimen_24.w, Sizes.dimen_20.w,
                  Sizes.dimen_24.w, Sizes.dimen_20.w),
              height: Sizes.dimen_96.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.5),
                  )
                ],
              ),
              child: Row(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        // SpinKitFadingCircle(
                        //   color: mainColor,
                        //   size: 56,
                        // ),
                        // ((context.bloc<UserCubit>().state as UserLoaded)
                        //             .user
                        //             .imageurl
                        //             .trim() ==
                        //         "")
                        //     ?
                        Container(
                          width: Sizes.dimen_58.w,
                          height: Sizes.dimen_58.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(SharedImage.profileImage),
                                fit: BoxFit.cover),
                          ),
                        )
                        // : Container(
                        //     width: 56,
                        //     height: 56,
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       image: DecorationImage(
                        //           image: NetworkImage((context
                        //                   .bloc<UserCubit>()
                        //                   .state as UserLoaded)
                        //               .user
                        //               .imageurl
                        //               .trim()),
                        //           fit: BoxFit.cover),
                        //     ),
                        //   )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Sizes.dimen_10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width -
                            2 * Sizes.dimen_24.w -
                            Sizes.dimen_120.w,
                        child: Text(
                          username,
                          style: Theme.of(context).textTheme.blackSubtitle1,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      SizedBox(
                        width: size.width -
                            2 * Sizes.dimen_24.w -
                            Sizes.dimen_120.w,
                        child: Text(
                          // (context.bloc<UserCubit>().state as UserLoaded)
                          //     .user
                          //     .deptname,
                          userlocname,
                          style: Theme.of(context).textTheme.greySubtitle1,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
