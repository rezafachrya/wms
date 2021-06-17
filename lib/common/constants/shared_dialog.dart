part of 'constants.dart';

class SharedDialog {
  SharedDialog._();

  static void successSnackBar(String title, String message) {
    return Get.snackbar(
      "",
      "",
      backgroundColor: "43f475".toColor(),
      icon: Icon(
        // MdiIcons.closeCircleOutline,
        MdiIcons.checkCircleOutline,
        color: Colors.white,
      ),
      titleText: Text(
        title,
        style: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w600),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    );
  }

  static void errorSnackBar(String title, String message) {
    return Get.snackbar(
      "",
      "",
      backgroundColor: "D9435E".toColor(),
      icon: Icon(
        MdiIcons.closeCircleOutline,
        color: Colors.white,
      ),
      titleText: Text(
        title,
        style: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w600),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    );
  }
}
