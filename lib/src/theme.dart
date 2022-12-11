import 'package:sokyo/src/colors.dart';
import 'package:sokyo/src/typography/typography.dart';
import 'package:flutter/material.dart';

const _smallTextScaleFactor = 0.80;
const _largeTextScaleFactor = 1.20;

/// Namespace for the Sokyo [ThemeData].
class SokyoTheme {
  /// Standard `ThemeData` for Sokyo UI.
  static ThemeData get standard {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        accentColor: SokyoColors.primary,
        backgroundColor: SokyoColors.secondary,
      ),
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textTheme: _textTheme,
      dialogBackgroundColor: SokyoColors.whiteBackground,
      dialogTheme: _dialogTheme,
      tooltipTheme: _tooltipTheme,
      bottomSheetTheme: _bottomSheetTheme,
      tabBarTheme: _tabBarTheme,
      dividerTheme: _dividerTheme,
    );
  }

  /// `ThemeData` for Sokyo UI for small screens.
  static ThemeData get small {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for Sokyo UI for medium screens.
  static ThemeData get medium {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for Sokyo UI for large screens.
  static ThemeData get large {
    return standard.copyWith(textTheme: _largeTextTheme);
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headline1: SokyoTextStyle.headline1,
      headline2: SokyoTextStyle.headline2,
      headline3: SokyoTextStyle.headline3,
      headline4: SokyoTextStyle.headline4,
      headline5: SokyoTextStyle.headline5,
      headline6: SokyoTextStyle.headline6,
      subtitle1: SokyoTextStyle.subtitle1,
      subtitle2: SokyoTextStyle.subtitle2,
      bodyText1: SokyoTextStyle.bodyText1,
      bodyText2: SokyoTextStyle.bodyText2,
      caption: SokyoTextStyle.caption,
      overline: SokyoTextStyle.overline,
      button: SokyoTextStyle.button,
    );
  }

  static TextTheme get _smallTextTheme {
    return TextTheme(
      headline1: SokyoTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _smallTextScaleFactor,
      ),
      headline2: SokyoTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _smallTextScaleFactor,
      ),
      headline3: SokyoTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _smallTextScaleFactor,
      ),
      headline4: SokyoTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _smallTextScaleFactor,
      ),
      headline5: SokyoTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _smallTextScaleFactor,
      ),
      headline6: SokyoTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle1: SokyoTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle2: SokyoTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText1: SokyoTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText2: SokyoTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyText2!.fontSize! * _smallTextScaleFactor,
      ),
      caption: SokyoTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _smallTextScaleFactor,
      ),
      overline: SokyoTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _smallTextScaleFactor,
      ),
      button: SokyoTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _smallTextScaleFactor,
      ),
    );
  }

  static TextTheme get _largeTextTheme {
    return TextTheme(
      headline1: SokyoTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _largeTextScaleFactor,
      ),
      headline2: SokyoTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _largeTextScaleFactor,
      ),
      headline3: SokyoTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _largeTextScaleFactor,
      ),
      headline4: SokyoTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _largeTextScaleFactor,
      ),
      headline5: SokyoTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _largeTextScaleFactor,
      ),
      headline6: SokyoTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _largeTextScaleFactor,
      ),
      subtitle1: SokyoTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _largeTextScaleFactor,
      ),
      subtitle2: SokyoTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _largeTextScaleFactor,
      ),
      bodyText1: SokyoTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _largeTextScaleFactor,
      ),
      bodyText2: SokyoTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyText2!.fontSize! * _largeTextScaleFactor,
      ),
      caption: SokyoTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _largeTextScaleFactor,
      ),
      overline: SokyoTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _largeTextScaleFactor,
      ),
      button: SokyoTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _largeTextScaleFactor,
      ),
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(color: SokyoColors.primary);
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        primary: SokyoColors.button,
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        side: const BorderSide(color: SokyoColors.button, width: 2),
        primary: SokyoColors.button,
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static TooltipThemeData get _tooltipTheme {
    return const TooltipThemeData(
      decoration: BoxDecoration(
        color: SokyoColors.charcoal,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(10),
      textStyle: TextStyle(color: SokyoColors.white),
    );
  }

  static DialogTheme get _dialogTheme {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: SokyoColors.whiteBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  static TabBarTheme get _tabBarTheme {
    return const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2,
          color: SokyoColors.primary,
        ),
      ),
      labelColor: SokyoColors.primary,
      unselectedLabelColor: SokyoColors.black25,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  static DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      space: 0,
      thickness: 1,
      color: SokyoColors.black25,
    );
  }
}
