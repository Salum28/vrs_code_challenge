import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_app/utils/constants/colors.dart';

// Light Theme
class LightTheme {
  // Color Scheme
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.darkBlue,
      onPrimary: AppColors.white,
      secondary: AppColors.mediumGold,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.lightBackground,
      onSurface: AppColors.black,
    ),
    
    // Background Color
    scaffoldBackgroundColor: AppColors.lightBackground,

    // Text Field Theme
    inputDecorationTheme: InputDecorationTheme(
      // Text Field Background
      filled: true,
      fillColor: AppColors.lightBackground,

      // Text Field Content Padding
      contentPadding: const EdgeInsets.only(left: 35),
      
      // Text Field Border
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      
      // Text Field Enabled Border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkGold, width: 2),
        borderRadius: BorderRadius.circular(50)
      ),
      
      // Text Field Focused Border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkBlue, width: 2),
        borderRadius: BorderRadius.circular(50)
      ),
      
      // Text Field Error Border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.red, width: 2),
        borderRadius: BorderRadius.circular(50)
      )
    ),

    // Drawer Theme
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.lightBackground),

    // Menu Item Button and Submenu Button Theme
    menuButtonTheme: MenuButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.lightBackground),
        padding: const WidgetStatePropertyAll(EdgeInsets.only(right: 50, left: 5, top: 5, bottom: 5)),
        textStyle: WidgetStatePropertyAll(
          GoogleFonts.getFont(
            'Noto Serif',
            textStyle: TextStyle(color: AppColors.black, fontSize: 16)
          )
        )
      )
    ),

    // List Tile Theme
    listTileTheme: ListTileThemeData(
      iconColor: AppColors.darkBlue,
      titleTextStyle: GoogleFonts.getFont(
        'Noto Serif',
        textStyle: TextStyle(color: AppColors.black, fontSize: 14)
      )
    ),

    // Expansion Tile Theme
    expansionTileTheme: ExpansionTileThemeData(
      collapsedIconColor: AppColors.darkBlue,
      collapsedTextColor: AppColors.black,
      iconColor: AppColors.darkGold,
      textColor: AppColors.darkGold,
      childrenPadding: const EdgeInsets.only(left: 10),
      shape: Border.symmetric(horizontal: BorderSide(color: AppColors.darkGold))
    ),

    // Dropdown Menu Theme
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(backgroundColor: WidgetStatePropertyAll(AppColors.lightBackground)),
      inputDecorationTheme: const InputDecorationTheme(filled: true),
      textStyle: GoogleFonts.getFont(
        'Noto Serif',
        textStyle: TextStyle(color: AppColors.black, fontSize: 16)
      )
    ),

    // Text Theme
    textTheme: TextTheme(
      titleLarge: TextStyle(color: AppColors.black),
      titleSmall: TextStyle(color: AppColors.black),
      bodyMedium: TextStyle(color: AppColors.black)
    )
  );
}