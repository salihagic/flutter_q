import 'package:flutter_q/_all.dart';

const _smallTextScaleFactor = 0.90;
const _mediumTextScaleFactor = 0.95;

class AppThemeData implements ThemeExtension<AppThemeData> {
  final Color successColor;
  final EdgeInsetsGeometry defaultButtonPadding;

  AppThemeData({
    required this.successColor,
    required this.defaultButtonPadding,
  });

  @override
  ThemeExtension<AppThemeData> copyWith({
    Color? successColor,
    EdgeInsetsGeometry? defaultButtonPadding,
  }) {
    return AppThemeData(
      successColor: successColor ?? this.successColor,
      defaultButtonPadding: defaultButtonPadding ?? this.defaultButtonPadding,
    );
  }

  @override
  ThemeExtension<AppThemeData> lerp(ThemeExtension<AppThemeData>? other, double t) {
    if (other is! AppThemeData) {
      return this;
    }

    return AppThemeData(
      successColor: other.successColor,
      defaultButtonPadding: other.defaultButtonPadding,
    );
  }

  @override
  Object get type => AppThemeData;
}

class AppTheme {
  static ThemeData get large {
    return ThemeData(
      extensions: [
        AppThemeData(
          successColor: Colors.green,
          defaultButtonPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
      ],
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
    );
  }

  static ThemeData get largeDark {
    return large.copyWith(
      brightness: Brightness.dark,
      extensions: [
        AppThemeData(
          successColor: Colors.green,
          defaultButtonPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
      ],
    );
  }

  static ThemeData get small {
    return large.copyWith(
      textTheme: _smallTextTheme,
      extensions: [
        AppThemeData(
          successColor: Colors.green,
          defaultButtonPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  static ThemeData get smallDark {
    return largeDark.copyWith(
      textTheme: _smallTextTheme,
      extensions: [
        AppThemeData(
          successColor: Colors.green,
          defaultButtonPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  static ThemeData get medium {
    return large.copyWith(
      textTheme: _mediumTextTheme,
      extensions: [
        AppThemeData(
          successColor: Colors.green,
          defaultButtonPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  static ThemeData get mediumDark {
    return largeDark.copyWith(
      textTheme: _mediumTextTheme,
      extensions: [
        AppThemeData(
          successColor: Colors.green,
          defaultButtonPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  static TextTheme get _textTheme {
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

  static TextTheme get _smallTextTheme {
    return TextTheme(
      headline1: AppTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _smallTextScaleFactor,
      ),
      headline2: AppTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _smallTextScaleFactor,
      ),
      headline3: AppTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _smallTextScaleFactor,
      ),
      headline4: AppTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _smallTextScaleFactor,
      ),
      headline5: AppTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _smallTextScaleFactor,
      ),
      headline6: AppTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle1: AppTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle2: AppTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText1: AppTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText2: AppTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyText2!.fontSize! * _smallTextScaleFactor,
      ),
      caption: AppTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _smallTextScaleFactor,
      ),
      overline: AppTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _smallTextScaleFactor,
      ),
      button: AppTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _smallTextScaleFactor,
      ),
    );
  }

  static TextTheme get _mediumTextTheme {
    return TextTheme(
      headline1: AppTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _mediumTextScaleFactor,
      ),
      headline2: AppTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _mediumTextScaleFactor,
      ),
      headline3: AppTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _mediumTextScaleFactor,
      ),
      headline4: AppTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _mediumTextScaleFactor,
      ),
      headline5: AppTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _mediumTextScaleFactor,
      ),
      headline6: AppTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _mediumTextScaleFactor,
      ),
      subtitle1: AppTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _mediumTextScaleFactor,
      ),
      subtitle2: AppTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _mediumTextScaleFactor,
      ),
      bodyText1: AppTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _mediumTextScaleFactor,
      ),
      bodyText2: AppTextStyle.bodyText2.copyWith(
        color: Colors.blue,
        fontSize: _textTheme.bodyText2!.fontSize! * _mediumTextScaleFactor,
      ),
      caption: AppTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _mediumTextScaleFactor,
      ),
      overline: AppTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _mediumTextScaleFactor,
      ),
      button: AppTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _mediumTextScaleFactor,
      ),
    );
  }
}
