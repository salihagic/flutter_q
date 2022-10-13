part of 'themes.dart';

final _theme = ThemeData();
final primaryTheme = ThemeData(
  primaryColor: const Color(0xFF0e1324),
  colorScheme: ColorScheme.fromSwatch(accentColor: const Color(0xFF0e1324)),
  scaffoldBackgroundColor: const Color(0xFF0e1324),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0e1324),
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF010510),
    selectedItemColor: Color(0xFFEC9B3E),
    unselectedItemColor: Color(0xFFE4ECEF),
  ),
  textTheme: TextTheme(
    headline1: AppTextStyle.headline1.copyWith(
      fontSize: _textTheme.headline1!.fontSize!,
    ),
    headline2: AppTextStyle.headline2.copyWith(
      fontSize: _textTheme.headline2!.fontSize!,
    ),
    headline3: AppTextStyle.headline3.copyWith(
      fontSize: _textTheme.headline3!.fontSize!,
    ),
    headline4: AppTextStyle.headline4.copyWith(
      fontSize: _textTheme.headline4!.fontSize!,
    ),
    headline5: AppTextStyle.headline5.copyWith(
      fontSize: _textTheme.headline5!.fontSize!,
    ),
    headline6: AppTextStyle.headline6.copyWith(
      fontSize: _textTheme.headline6!.fontSize!,
    ),
    subtitle1: AppTextStyle.subtitle1.copyWith(
      fontSize: _textTheme.subtitle1!.fontSize!,
    ),
    subtitle2: AppTextStyle.subtitle2.copyWith(
      fontSize: _textTheme.subtitle2!.fontSize!,
    ),
    bodyText1: AppTextStyle.bodyText1.copyWith(
      fontSize: _textTheme.bodyText1!.fontSize!,
    ),
    bodyText2: AppTextStyle.bodyText2.copyWith(
      fontSize: _textTheme.bodyText2!.fontSize!,
    ),
    caption: AppTextStyle.caption.copyWith(
      fontSize: _textTheme.caption!.fontSize!,
    ),
    overline: AppTextStyle.overline.copyWith(
      fontSize: _textTheme.overline!.fontSize!,
    ),
    button: AppTextStyle.button.copyWith(
      fontSize: _textTheme.button!.fontSize!,
    ),
  ),
);

TextTheme get _textTheme {
  return TextTheme(
    headline1: AppTextStyle.headline1,
    headline2: AppTextStyle.headline2,
    headline3: AppTextStyle.headline3,
    headline4: AppTextStyle.headline4,
    headline5: AppTextStyle.headline5,
    headline6: AppTextStyle.headline6,
    subtitle1: AppTextStyle.subtitle1,
    subtitle2: AppTextStyle.subtitle2,
    bodyText1: AppTextStyle.bodyText1,
    bodyText2: AppTextStyle.bodyText2,
    caption: AppTextStyle.caption,
    overline: AppTextStyle.overline,
    button: AppTextStyle.button,
  );
}
