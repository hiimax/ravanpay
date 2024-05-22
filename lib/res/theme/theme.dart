// ignore_for_file: deprecated_member_use

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../import/import.dart';

class ThemeHelper {
  static ThemeData lightTheme = ThemeData(
    fontFamily: ravenFontFamily,
    extensions: [
      RavenDesignSystem(
        cardStrokeColor: cardStrokeColor,
        greyColor: greyColor,
        ravenBackgroundColor: ravenBackgroundColor,
        ravenTextColor: ravenTextColor,
        ravenSecondaryTextColor: ravenSecondaryTextColor,
        ravenBuyColor: ravenBuyColor,
        ravenSellColor: ravenSellColor,
        ravenVoltColor: ravenVoltColor,
        ravenFountainblueColor: ravenFountainblueColor,
        containerBg: Colors.white,
      )
    ],
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: ravenBackgroundColor,
    backgroundColor: ravenBackgroundColor,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    // accentColor: Colors.orange,
    canvasColor: Colors.white,
    cardColor: Colors.white,
    dividerColor: Colors.grey,
    focusColor: Colors.blue,
    hoverColor: Colors.grey[200],
    errorColor: Colors.red,
    bottomAppBarTheme: const BottomAppBarTheme(
      surfaceTintColor: Colors.white,
    ),
    tabBarTheme: TabBarTheme(
      indicator: const BoxDecoration(
          // color: greyDarkColor.withOpacity(0.5),
          // borderRadius: BorderRadius.circular(8),
          // boxShadow: const [
          //   BoxShadow(
          //     color: greyDarkColor,
          //     blurRadius: 2,
          //   ),
          // ],
          ),
      labelPadding: const EdgeInsets.symmetric(vertical: 8),
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      labelColor: ravenBlack,
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontStyle: FontStyle.normal,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: ravenWhite,
      surfaceTintColor: Colors.white,
      // brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontSize: 16.0, color: ravenTextColor, fontWeight: FontWeight.w500),
      headline3: TextStyle(
          fontSize: 16.0, color: ravenBuyColor, fontWeight: FontWeight.w500),
      bodyText1: TextStyle(
          fontSize: 12.0,
          color: ravenSecondaryTextColor,
          fontWeight: FontWeight.w500),
      bodyText2: TextStyle(
        fontSize: 14.0,
        color: ravenSecondaryTextColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: TextStyle(
        fontSize: 10.0,
        color: ravenSecondaryTextColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: TextStyle(
        fontSize: 10.0,
        color: ravenBuyColor,
        fontWeight: FontWeight.w500,
      ),
      headline4: TextStyle(
        fontSize: 10.0,
        color: ravenVoltColor,
        fontWeight: FontWeight.w500,
      ),
      headline5: TextStyle(
        fontSize: 12.0,
        color: ravenVoltColor,
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        fontSize: 12.0,
        color: ravenTextColor,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: TextStyle(
        fontSize: 12.0,
        color: ravenBuyColor,
        fontWeight: FontWeight.w500,
      ),
      button: TextStyle(fontSize: 16.0, color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      color: ravenBlack,
      size: 24.0,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    extensions: [
      RavenDesignSystem(
        cardStrokeColor: cardStrokeDarkColor,
        greyColor: greyDarkColor,
        ravenBackgroundColor: ravenDarkBackgroundColor,
        ravenTextColor: ravenDarkTextColor,
        ravenSecondaryTextColor: ravenDarkSecondaryTextColor,
        ravenBuyColor: ravenDarkBuyColor,
        ravenSellColor: ravenDarkSellColor,
        ravenVoltColor: ravenDarkVoltColor,
        ravenFountainblueColor: ravenDarkFountainblueColor,
        containerBg: raveneDarkColor,
      )
    ],
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: ravenDarkBackgroundColor,
    backgroundColor: ravenDarkBackgroundColor,
    brightness: Brightness.dark,
    tabBarTheme: const TabBarTheme(
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: cardStrokeDarkColor,
    ),
    primaryColor: Colors.blue,
    // accentColor: Colors.orange,
    canvasColor: Colors.black,
    cardColor: Colors.black,
    dividerColor: Colors.grey,
    focusColor: Colors.blue,
    hoverColor: Colors.grey[200],
    errorColor: Colors.red,
    appBarTheme: const AppBarTheme(
      color: raveneDarkColor,
      // brightness: Brightness.dark,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontSize: 16.0,
          color: ravenDarkTextColor,
          fontWeight: FontWeight.w500),
      headline3: TextStyle(
          fontSize: 16.0,
          color: ravenDarkBuyColor,
          fontWeight: FontWeight.w500),
      bodyText1: TextStyle(
        fontSize: 12.0,
        color: ravenDarkSecondaryTextColor,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
        color: ravenDarkSecondaryTextColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: TextStyle(
        fontSize: 10.0,
        color: ravenDarkSecondaryTextColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: TextStyle(
        fontSize: 10.0,
        color: ravenDarkBuyColor,
        fontWeight: FontWeight.w500,
      ),
      headline4: TextStyle(
        fontSize: 10.0,
        color: ravenDarkVoltColor,
        fontWeight: FontWeight.w500,
      ),
      headline5: TextStyle(
        fontSize: 12.0,
        color: ravenDarkVoltColor,
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        fontSize: 12.0,
        color: ravenDarkTextColor,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: TextStyle(
        fontSize: 12.0,
        color: ravenDarkBuyColor,
        fontWeight: FontWeight.w500,
      ),
      button: TextStyle(fontSize: 16.0, color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      color: ravenWhite,
      size: 24.0,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
    ),
  );
}

class RavenDesignSystem extends ThemeExtension<RavenDesignSystem> {
  Color? cardStrokeColor;
  Color? greyColor;
  Color? ravenBackgroundColor;
  Color? ravenTextColor;
  Color? ravenSecondaryTextColor;
  Color? ravenBuyColor;
  Color? ravenSellColor;
  Color? ravenVoltColor;
  Color? ravenFountainblueColor;
  Color? containerBg;

  RavenDesignSystem({
    this.cardStrokeColor,
    this.greyColor,
    this.ravenBackgroundColor,
    this.ravenTextColor,
    this.ravenSecondaryTextColor,
    this.ravenBuyColor,
    this.ravenSellColor,
    this.ravenVoltColor,
    this.ravenFountainblueColor,
    this.containerBg,
  });

  @override
  ThemeExtension<RavenDesignSystem> copyWith({
    Color? cardStrokeColor,
    Color? greyColor,
    Color? ravenBackgroundColor,
    Color? ravenTextColor,
    Color? ravenSecondaryTextColor,
    Color? ravenBuyColor,
    Color? ravenSellColor,
    Color? ravenVoltColor,
    Color? ravenFountainblueColor,
    Color? containerBg,
  }) {
    return RavenDesignSystem()
      ..cardStrokeColor = cardStrokeColor ?? this.cardStrokeColor
      ..greyColor = greyColor ?? this.greyColor
      ..ravenBackgroundColor = ravenBackgroundColor ?? this.ravenBackgroundColor
      ..ravenTextColor = ravenTextColor ?? this.ravenTextColor
      ..ravenSecondaryTextColor =
          ravenSecondaryTextColor ?? this.ravenSecondaryTextColor
      ..ravenBuyColor = ravenBuyColor ?? this.ravenBuyColor
      ..ravenSellColor = ravenSellColor ?? this.ravenSellColor
      ..ravenVoltColor = ravenVoltColor ?? this.ravenVoltColor
      ..ravenFountainblueColor =
          ravenFountainblueColor ?? this.ravenFountainblueColor
      ..containerBg = containerBg ?? this.containerBg;
  }

  @override
  ThemeExtension<RavenDesignSystem> lerp(
      covariant ThemeExtension<RavenDesignSystem>? other, double t) {
    if (other == null) {
      return this;
    }
    final RavenDesignSystem otherDesignSystem = other as RavenDesignSystem;
    return RavenDesignSystem(
      cardStrokeColor:
          Color.lerp(cardStrokeColor, otherDesignSystem.cardStrokeColor, t),
      greyColor: Color.lerp(greyColor, otherDesignSystem.greyColor, t),
      ravenBackgroundColor: Color.lerp(
          ravenBackgroundColor, otherDesignSystem.ravenBackgroundColor, t),
      ravenTextColor:
          Color.lerp(ravenTextColor, otherDesignSystem.ravenTextColor, t),
      ravenSecondaryTextColor: Color.lerp(ravenSecondaryTextColor,
          otherDesignSystem.ravenSecondaryTextColor, t),
      ravenBuyColor:
          Color.lerp(ravenBuyColor, otherDesignSystem.ravenBuyColor, t),
      ravenSellColor:
          Color.lerp(ravenSellColor, otherDesignSystem.ravenSellColor, t),
      ravenVoltColor:
          Color.lerp(ravenVoltColor, otherDesignSystem.ravenVoltColor, t),
      ravenFountainblueColor: Color.lerp(
          ravenFountainblueColor, otherDesignSystem.ravenFountainblueColor, t),
      containerBg: Color.lerp(containerBg, otherDesignSystem.containerBg, t),
    );
  }
}

extension ThemeDataExtension on BuildContext {
  RavenDesignSystem? get designSystem =>
      Theme.of(this).extension<RavenDesignSystem>();
}
