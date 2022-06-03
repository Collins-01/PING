import 'package:flutter/material.dart';
import 'package:ping/Utils/app_colors.dart';
// import 'package:raven_livestream/core/constants/textstyles.dart';
// import 'package:raven_livestream/core/theme/colors_utils.dart';

class AppThemeData {
  //creating an instance of the class
  AppThemeData._();

  static get lightThemeData {
    Color color = Colors.black;
    return ThemeData(
      dividerTheme: const DividerThemeData(color: Colors.grey),
      // tabBarTheme: TabBarTheme(
      //   labelStyle: bodyStyle1.copyWith(color: Colors.black),
      // ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColors.primaryColor,
      // primarySwatch: ,
      fontFamily: "Brown",
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(AppColors.primaryColor),
        // : Colors.amberAccent,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      // appBarTheme: AppBarTheme(
      //   color: Colors.white,
      //   titleTextStyle: headingStyle1.copyWith(color: Colors.black),
      //   iconTheme: const IconThemeData(
      //     color: Colors.white,
      //   ),
      // ),
      // s
      // textTheme: TextTheme(
      //   bodyText2: bodyStyle2.copyWith(color: color),
      //   bodyText1: bodyStyle1.copyWith(color: color),
      //   caption: captionStyle.copyWith(color: color),
      //   button: buttonStyle.copyWith(color: color),
      //   headline1: headingStyle1.copyWith(color: color),
      //   headline2: headingStyle2.copyWith(color: color),
      //   headline3: headingStyle3.copyWith(color: color),
      //   headline4: headingStyle4.copyWith(color: color),
      //   headline5: headingStyle5.copyWith(color: color),
      //   headline6: headingStyle6.copyWith(color: color),
      //   overline: small.copyWith(color: color),
      //   // subtitle1: ,
      //   // subtitle2: ,
      // ),
    );
  }
}
