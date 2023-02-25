import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    /// main colors
    primaryColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.background,

    primaryColorLight: ColorManager.background,
    // primaryColorDark: ColorManager.background,
    // disabledColor: ColorManager.grey1,
    // splashColor: ColorManager.lightPrimary  /*ripple effect color*/,

    /// fontFamily
    fontFamily: FontConstants.fontFamily,

    /// cardView Theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
      /* margin: ,
    shape: RoundedRectangleBorder(
      borderRadius: ,
      side: ,
    ),*/
    ),


    /// app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.white,
        elevation: AppSize.s4,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor:  ColorManager.statusBar,
        ),foregroundColor:ColorManager.textGray ,

        titleTextStyle: getRegularStyle(fontSize: FontSize.s16, color: ColorManager.textGray)),

    /// button theme

    buttonTheme: ButtonThemeData(

        /// ([RoundedRectangleBorder]), continuous rectangles
        /// ([ContinuousRectangleBorder]), or beveled rectangles
        /// ([BeveledRectangleBorder]).
        shape: const RoundedRectangleBorder(),
        // disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        // splashColor: ColorManager.lightPrimary
    ),

    ///

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s4),
        ),
      ),
    ),

    /// textTheme
    textTheme: TextTheme(



        displayLarge: getBoldStyle(color: ColorManager.secondary, fontSize: FontSize.s19),
        bodyLarge:getMediumStyle(color: ColorManager.white, fontSize: FontSize.s25),
        displaySmall:  getBoldStyle(color: ColorManager.secondary, fontSize: FontSize.s18),
        titleLarge: getMediumStyle(color: ColorManager.textGray, fontSize: FontSize.s14),
        // button
        labelLarge:  getBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
        displayMedium:   getMediumStyle(color: ColorManager.textGray, fontSize: FontSize.s16),
        titleMedium:  getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s18),
      bodyMedium:  getBoldStyle(color: ColorManager.textGray, fontSize: FontSize.s14),
      bodySmall:  getMediumStyle(color: ColorManager.textGray, fontSize: FontSize.s12),
        // headlineLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
        // titleMedium: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
        // bodyLarge: getRegularStyle(color: ColorManager.grey1),
        // bodySmall: getRegularStyle(color: ColorManager.grey)

    ),

    /// input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      fillColor: ColorManager.white,

      // hint style
      hintStyle: getRegularStyle(color: ColorManager.grey,
          fontSize: FontSize.s14),
      labelStyle: getMediumStyle(color: ColorManager.grey,
          fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error ,
          fontSize: FontSize.s14),

      // enabled border style
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.borderText,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s4),
        ),
      ),

      // focused border style
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s4),
        ),
      ),


      // error border style
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s4),
        ),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s4),
        ),
      ),

    ),


    // label style
  );
}

// class AppTheme {
//   ThemeData getApplicationThemeLight() {
//     return ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.light,
//
//       /// main colors
//       primaryColor: ColorManager.primary,
//       primaryColorLight: ColorManager.lightPrimary,
//       primaryColorDark: ColorManager.darkPrimary,
//       disabledColor: ColorManager.grey1,
//       splashColor: ColorManager.lightPrimary /*ripple effect color*/,
//
//       /// fontFamily
//       fontFamily: FontConstants.fontFamily,
//
//       /// cardView Theme
//       cardTheme: _getCardTheme(),
//
//       /// app bar theme
//       appBarTheme: _getAppBarTheme(),
//
//       /// button theme
//
//       buttonTheme: _getButtonThemeData(),
//       //
//       elevatedButtonTheme: _getElevatedButtonThemeData(),
//
//       /// textTheme
//       textTheme: _getTextTheme(),
//
//       /// input decoration theme (text form field)
//       inputDecorationTheme: _getInputDecorationTheme(),
//       // label style
//     );
//   }
//
//   ThemeData getApplicationThemeDark() {
//     return ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.dark,
//
//       /// main colors
//       primaryColor: ColorManager.primary,
//       primaryColorLight: ColorManager.lightPrimary,
//       primaryColorDark: ColorManager.darkPrimary,
//       disabledColor: ColorManager.grey1,
//       splashColor: ColorManager.lightPrimary /*ripple effect color*/,
//
//       /// fontFamily
//       fontFamily: FontConstants.fontFamily,
//
//       /// cardView Theme
//       cardTheme: _getCardTheme(),
//
//       /// app bar theme
//       appBarTheme: _getAppBarTheme(),
//
//       /// button theme
//
//       buttonTheme: _getButtonThemeData(),
//       //
//       elevatedButtonTheme: _getElevatedButtonThemeData(),
//
//       /// textTheme
//       textTheme: _getTextTheme(),
//
//       /// input decoration theme (text form field)
//       inputDecorationTheme: _getInputDecorationTheme(),
//       // label style
//     );
//   }
//
//   ///
//   TextTheme _getTextTheme() {
//     return TextTheme(
//         displayLarge:
//             getLightStyle(color: ColorManager.white, fontSize: FontSize.s22),
//         displayMedium: getSemiBoldStyle(
//             color: ColorManager.darkGrey, fontSize: FontSize.s16),
//         titleMedium: getMediumStyle(
//             color: ColorManager.lightGrey, fontSize: FontSize.s14),
//         bodySmall: getRegularStyle(color: ColorManager.grey1),
//         bodyLarge: getRegularStyle(color: ColorManager.grey));
//   }
//
//   CardTheme _getCardTheme() {
//     return CardTheme(
//       color: ColorManager.white,
//       shadowColor: ColorManager.grey,
//       elevation: AppSize.s4,
//       /* margin: ,
//     shape: RoundedRectangleBorder(
//       borderRadius: ,
//       side: ,
//     ),*/
//     );
//   }
//
//   AppBarTheme _getAppBarTheme() {
//     return AppBarTheme(
//         centerTitle: true,
//         color: ColorManager.primary,
//         elevation: AppSize.s4,
//         shadowColor: ColorManager.lightPrimary,
//         titleTextStyle:
//             getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white));
//   }
//
//   ButtonThemeData _getButtonThemeData() {
//     return ButtonThemeData(
//
//         /// ([RoundedRectangleBorder]), continuous rectangles
//         /// ([ContinuousRectangleBorder]), or beveled rectangles
//         /// ([BeveledRectangleBorder]).
//         shape: const StadiumBorder(),
//         disabledColor: ColorManager.grey1,
//         buttonColor: ColorManager.primary,
//         splashColor: ColorManager.lightPrimary);
//   }
//
//   ElevatedButtonThemeData _getElevatedButtonThemeData() {
//     return ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         textStyle:
//             getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17),
//         backgroundColor: ColorManager.primary,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppSize.s12),
//         ),
//       ),
//     );
//   }
//
//   InputDecorationTheme _getInputDecorationTheme() {
//     return InputDecorationTheme(
//       // content padding
//       contentPadding: const EdgeInsets.all(AppPadding.p8),
//       // hint style
//       hintStyle:
//           getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
//       labelStyle:
//           getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
//       errorStyle: getRegularStyle(color: ColorManager.error),
//
//       // enabled border style
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.primary,
//           width: AppSize.s1_5,
//         ),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//
//       // focused border style
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.grey,
//           width: AppSize.s1_5,
//         ),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//
//       // error border style
//       errorBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.error,
//           width: AppSize.s1_5,
//         ),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//       // focused border style
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.primary,
//           width: AppSize.s1_5,
//         ),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//     );
//   }
// }
