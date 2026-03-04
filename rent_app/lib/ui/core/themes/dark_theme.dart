import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_app/utils/constants/colors.dart';

class DarkTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.darkBlue,
      onPrimary: AppColors.white,
      secondary: AppColors.mediumGold,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.darkBackground,
      onSurface: AppColors.white,
    ),
    
    scaffoldBackgroundColor: AppColors.darkBackground,

    // Text Field Theme
    inputDecorationTheme: InputDecorationTheme(
      // Text Field Background
      filled: true,
      fillColor: AppColors.darkBackground,

      // Text Field Content Padding
      contentPadding: const EdgeInsets.only(left: 35),
      
      // Text Field Border
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      
      // Text Field Enabled Border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.mediumGold, width: 2),
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
        backgroundColor: WidgetStatePropertyAll(AppColors.darkBackground),
        padding: const WidgetStatePropertyAll(EdgeInsets.only(right: 50, left: 5, top: 5, bottom: 5)),
        textStyle: WidgetStatePropertyAll(
          GoogleFonts.getFont(
            'Noto Serif',
            textStyle: TextStyle(color: AppColors.white, fontSize: 16)
          )
        )
      )
    ),

    // List Tile Theme
    listTileTheme: ListTileThemeData(
      iconColor: AppColors.darkBlue,
      titleTextStyle: GoogleFonts.getFont(
        'Noto Serif',
        textStyle: TextStyle(color: AppColors.white, fontSize: 14)
      )
    ),

    // Expansion Tile Theme
    expansionTileTheme: ExpansionTileThemeData(
      collapsedIconColor: AppColors.darkBlue,
      collapsedTextColor: AppColors.white,
      iconColor: AppColors.lightGold,
      textColor: AppColors.lightGold,
      childrenPadding: const EdgeInsets.only(left: 10),
      shape: Border.symmetric(horizontal: BorderSide(color: AppColors.lightGold))
    ),

    // Dropdown Menu Theme
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(backgroundColor: WidgetStatePropertyAll(AppColors.lightBackground)),
      inputDecorationTheme: const InputDecorationTheme(filled: true),
      textStyle: GoogleFonts.getFont(
        'Noto Serif',
        textStyle: TextStyle(color: AppColors.white, fontSize: 16)
      )
    ),

    // Text Theme
    textTheme: TextTheme(
      titleLarge: TextStyle(color: AppColors.white),
      titleSmall: TextStyle(color: AppColors.white),
      bodyMedium: TextStyle(color: AppColors.white)
    )
  );
}