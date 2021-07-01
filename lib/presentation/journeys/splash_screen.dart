part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  _startTime() async {
    // menggunakan ..
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    // tanpa ..
    // _controller = AnimationController(
    //   duration: const Duration(seconds: 3),
    //   vsync: this,
    // );
    // _controller.repeat(reverse: true);

    //ini buat splash Screennya
    await Future.delayed(Duration(seconds: 3));
    BlocProvider.of<AutologinCubit>(context).loadLocalUser();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AutologinCubit, AutologinState>(
          listener: (context, state) {
            if (state is AutologinSuccess) {
              if (state.userTables.isEmpty) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteList.initial, (route) => false);
              } else {
                BlocProvider.of<LoginCubit>(context).initiateLogin(
                  state.userTables.first.userid,
                  state.userTables.first.password,
                );
              }
            }
          },
        ),
        BlocListener<LoginCubit, LoginState>(
          // listenWhen: (previous, current) => current is LoginSuccess,
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteList.home,
                (route) => false,
              );
            } else if (state is LoginError) {
              BlocProvider.of<LoginCubit>(context).deleteUser();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(RouteList.initial, (route) => false);
            }
          },
        ),
      ],
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.8),
          ),
          child: Center(
            child: FadeTransition(
                opacity: _animation, child: Image.asset(SharedImage.logoImage)),
          ),
        ),
      ),
    );
  }
}
