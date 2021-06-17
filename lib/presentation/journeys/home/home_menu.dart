part of 'home.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  DateTime? _backbuttonpressedTime;

  @override
  Widget build(BuildContext context) {
    UserLocType userloctype =
        (BlocProvider.of<LoginCubit>(context).state as LoginSuccess)
            .userEntity
            .userloctype;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: Sizes.dimen_24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SharedString.menu,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //menu scan
              MainPageMenu(
                title: (userloctype == UserLocType.region)
                    ? SharedString.outboundWarehouse
                    : SharedString.inboundSubWarehouse,
                image: SharedImage.scanIcon,
                onTap: () {
                  Navigator.pushNamed(context, RouteList.scanScreen);
                },
              ),
              //menu manifest list
              MainPageMenu(
                title: SharedString.manifestList,
                image: SharedImage.manifestlistImage,
                onTap: () {
                  Navigator.pushNamed(context, RouteList.manifestListScreen);
                },
              ),
              //menu logout
              MainPageMenu(
                title: SharedString.logout,
                image: SharedImage.logoutIcon,
                onTap: onWillPop,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    bool backButton = _backbuttonpressedTime == null ||
        currentTime.difference(_backbuttonpressedTime!) > Duration(seconds: 3);
    if (backButton) {
      _backbuttonpressedTime = currentTime;
      Fluttertoast.showToast(
          msg: SharedString.backButtonMessage,
          backgroundColor: Colors.white,
          textColor: Colors.black);
      return false;
    }
    BlocProvider.of<LoginCubit>(context).deleteUser();
    // LoginState loginState = BlocProvider.of<LoginCubit>(context).state;
    // if (loginState is LogoutSuccess) {
    await Navigator.pushNamedAndRemoveUntil(
        context, RouteList.initial, (route) => false);
    // }
    // if (Platform.isAndroid) {
    //     SystemNavigator.pop();
    // } else if (Platform.isIOS) {
    //     exit(0);
    // }

    return true;
  }
}
