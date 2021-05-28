part of 'home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeHeader(),
                SizedBox(
                  height: 30,
                ),
                HomeMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
