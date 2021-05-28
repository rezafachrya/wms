part of 'login.dart';

class LoginScreen extends StatelessWidget {
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
