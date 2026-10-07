import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color orange = Color(0xffee6600);
  static const Color lightOrange = Color(0xffFFA552);
  static const Color lightestOrange = Color.fromARGB(255, 255, 244, 230);
  static const Color brown = Color(0xff3E2308);
  static const Color grey = Color(0xff7a6757);
  static const Color scaffBackground =  Color(0xFFFCF9F3);
  static const Color border = Color.fromARGB(255, 190, 176, 161);
  static const textSecondary = Color(0xFF7A685D);
  static const cardBackground = Color(0xffF6EDE2);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    textTheme: GoogleFonts.googleSansFlexTextTheme(),
  );
  TextStyle brownText({double fSize = 18}) {
    return TextStyle(
      fontSize: fSize,
      color: brown,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle subHeading({double size = 18}) {
    return TextStyle(color: grey, fontSize: size);
  }
  TextStyle subHeadingBold({double size = 18}) {
    return TextStyle(color: grey, fontSize: size,fontWeight: FontWeight.bold);
  }
  InputDecoration textBoxDecoration (String hint){
    return  InputDecoration(
      fillColor: lightestOrange,
      filled: true,
                               
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: AppTheme.border,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: AppTheme.border,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: AppTheme.border,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: AppTheme.border,
                                  ),
                                ),
                                hintText: hint,
                                hintStyle: TextStyle(
                                  color: AppTheme.textSecondary,
                                ),
                              );
  }
}
