part of 'login.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController? _userNameController, _passwordController;
  bool enableSignIn = false;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();

    _userNameController?.addListener(() {
      setState(() {
        enableSignIn = (_userNameController?.text.isNotEmpty ?? false) &&
            (_passwordController?.text.isNotEmpty ?? false);
      });
    });
    _passwordController?.addListener(() {
      setState(() {
        enableSignIn = (_userNameController?.text.isNotEmpty ?? false) &&
            (_passwordController?.text.isNotEmpty ?? false);
      });
    });
  }

  @override
  void dispose() {
    _userNameController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_32.w,
          vertical: Sizes.dimen_24.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: Sizes.dimen_8.h),
              child: Text(
                SharedString.loginToQrApp,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            LabelFieldWidget(
              label: SharedString.username,
              hintText: SharedString.enterUsername,
              controller: _userNameController!,
            ),
            LabelFieldWidget(
              label: SharedString.password,
              hintText: SharedString.enterPassword,
              controller: _passwordController!,
              isPasswordField: true,
            ),
            BlocConsumer<LoginCubit, LoginState>(
              //jika builder membuat widget
              buildWhen: (previous, current) => current is LoginError,
              builder: (context, state) {
                if (state is LoginError)
                  return Text(
                    state.message,
                    style: Theme.of(context).textTheme.orangeSubtitle1,
                  );
                return const SizedBox.shrink();
              },
              //jika ada perubahan pada login state baru di jalankan
              listenWhen: (previous, current) => current is LoginSuccess,
              listener: (context, state) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteList.home,
                  (route) => false,
                );
              },
            ),
            Button(
              onPressed: () => enableSignIn
                  ? BlocProvider.of<LoginCubit>(context).initiateLogin(
                      _userNameController?.text ?? '',
                      _passwordController?.text ?? '',
                    )
                  : null,
              text: SharedString.signIn,
              isEnabled: enableSignIn,
            ),
          ],
        ),
      ),
    );
  }
}
