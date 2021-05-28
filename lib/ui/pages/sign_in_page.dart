part of 'pages.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Sizes.dimen_32.h),
              child: Logo(height: Sizes.dimen_12.h),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _userNameController, _passwordController;
  bool enableSignIn = false;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();

    _userNameController.addListener(() {
      setState(() {
        enableSignIn = _userNameController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        enableSignIn = _userNameController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty;
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
              controller: _userNameController,
            ),
            LabelFieldWidget(
              label: SharedString.password,
              hintText: SharedString.enterPassword,
              controller: _passwordController,
              isPasswordField: true,
            ),
            // BlocConsumer<LoginBloc, LoginState>(
            //   //jika builder membuat widget
            //   buildWhen: (previous, current) => current is LoginError,
            //   builder: (context, state) {
            //     if (state is LoginError)
            //       return Text(
            //         state.message.t(context),
            //         style: Theme.of(context).textTheme.orangeSubtitle1,
            //       );
            //     return const SizedBox.shrink();
            //   },
            //   //jika ada perubahan pada login state baru di jalankan
            //   listenWhen: (previous, current) => current is LoginSuccess,
            //   listener: (context, state) {
            //     Navigator.of(context).pushNamedAndRemoveUntil(
            //       RouteList.home,
            //       (route) => false,
            //     );
            //   },
            // ),
            Button(
              onPressed: enableSignIn
                  ? () {
                      // BlocProvider.of<LoginBloc>(context).add(
                      //   LoginInitiateEvent(
                      //     _userNameController.text,
                      //     _passwordController.text,
                      //   ),
                      // );
                      Get.to(HomePage());
                    }
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

class LabelFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPasswordField;
  final TextEditingController controller;
  final UnderlineInputBorder _enabledBorder = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );

  final UnderlineInputBorder _focusedBorder = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
  );

  const LabelFieldWidget({
    Key key,
    @required this.label,
    @required this.hintText,
    @required this.controller,
    this.isPasswordField = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.start,
          ),
          TextField(
            obscureText: isPasswordField,
            obscuringCharacter: '*',
            controller: controller,
            style: Theme.of(context).textTheme.headline6,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.greySubtitle1,
              focusedBorder: _focusedBorder,
              enabledBorder: _enabledBorder,
            ),
          ),
        ],
      ),
    );
  }
}
