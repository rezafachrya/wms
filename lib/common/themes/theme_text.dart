part of 'themes.dart';

class ThemeText {
  /*
    Ukuran bawaan material design text
    Name      Size  Weight  Spacing
    headline1 96.0  light   -1.5
    headline2 60.0  light   -0.5
    headline3 48.0  regular 0.0
    headline4 34.0  regular 0.25
    headline5 24.0  regular 0.0
    headline6 20.0  medium  0.15
    subtitle1 16.0  regular 0.15
    subtitle2 14.0  medium  0.1
    body1     16.0  regular 0.5
    body2     14.0  regular 0.25
    button    14.0  medium  1.25
    caption   12.0  regular 0.4
    overline   10.0  regular 1.5  
  */

  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle? get _whiteHeadLine6 => _poppinsTextTheme.headline6
      ?.copyWith(fontSize: Sizes.dimen_20.sp, color: Colors.white);

  static TextStyle? get _whiteHeadline5 =>
      _poppinsTextTheme.headline5?.copyWith(
        fontSize: Sizes.dimen_24.sp,
        color: Colors.white,
      );

  static TextStyle? get _whiteHeadline4 => _poppinsTextTheme.headline6
      ?.copyWith(fontSize: Sizes.dimen_32.sp, color: Colors.white);

  static TextStyle? get whiteSubtitle1 => _poppinsTextTheme.subtitle1?.copyWith(
        fontSize: Sizes.dimen_16.sp,
        color: Colors.white,
      );

  static TextStyle? get whiteSubtitle2 => _poppinsTextTheme.subtitle2?.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: Colors.white,
      );

  static TextStyle? get whiteBodyText2 => _poppinsTextTheme.bodyText2?.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: Colors.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get whiteCaptionText => _poppinsTextTheme.caption?.copyWith(
        fontSize: Sizes.dimen_12.sp,
        color: Colors.white,
      );

  static TextStyle? get _whiteButton => _poppinsTextTheme.button?.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: Colors.white,
      );

  static getTextTheme() => TextTheme(
        headline4: _whiteHeadline4,
        headline5: _whiteHeadline5,
        headline6: _whiteHeadLine6,
        subtitle1: whiteSubtitle1,
        subtitle2: whiteSubtitle2,
        bodyText2: whiteBodyText2,
        caption: whiteCaptionText,
        button: _whiteButton,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle? get royalBlueSubtitle1 => subtitle1?.copyWith(
        color: ThemeColor.royalBlue,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get greySubtitle1 => subtitle1?.copyWith(
        color: Colors.grey,
      );

  TextStyle? get violetHeadline6 => headline6?.copyWith(
        color: ThemeColor.violet,
      );

  TextStyle? get vulcanBodyText2 => bodyText2?.copyWith(
        color: ThemeColor.vulcan,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get greyCaption => caption?.copyWith(
        color: Colors.grey,
      );

  TextStyle? get orangeSubtitle1 => subtitle1?.copyWith(
        color: Colors.orangeAccent,
      );

  TextStyle? get blackSubtitle1 => subtitle1?.copyWith(
        color: Colors.black,
      );

  TextStyle? get blackHeadline6 => headline6?.copyWith(
        color: Colors.black,
      );

  TextStyle? get greenHeadline6 => headline6?.copyWith(
        color: Colors.green[400],
      );
}
