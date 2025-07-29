import 'package:flutter/material.dart';
import '../../../domain/constants/appcolors.dart';

class Uihelper {
  static Widget CustomImage({
    required String imgurl,
    double? height,
    double? width,
  }) {
    return Image.asset(
      "assets/images/$imgurl",
      height: 500,
      width: width,
      fit: BoxFit.contain,
    );
  }

  static Widget CustomImage2({
    required String imgurl,
    double? height,
    double? width,
  }) {
    return Image.asset(
      "assets/images/$imgurl",
      height: 200,
      width: 200,
      fit: BoxFit.contain,
    );
  }

  static Widget CustomImage1({
    required String imgurl,
    double? height,
    double? width,
  }) {
    return Image.asset(
      "assets/images/$imgurl",
      height: 170,
      width: 300,
      fit: BoxFit.contain,
    );
  }

  static Widget CustomText({
    required String text,
    required double fontsize,
    String? fontfamily,
    FontWeight? fontweight,
    Color? color,
    required BuildContext context,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: fontfamily ?? "regular",
        fontWeight: fontweight ?? FontWeight.normal,
        color: color ??
            (Theme.of(context).brightness == Brightness.dark
                ? AppColors.numberTextDark
                : AppColors.numberTextLight),
      ),
    );
  }

  static Widget CustomButton({
    required String buttonnname,
    required VoidCallback callback,
    Color? buttoncolor,
  }) {
    return SizedBox(
      height: 50,
      width: 320,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttoncolor ?? AppColors.buttonLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          buttonnname,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "bold",
          ),
        ),
      ),
    );
  }

  static Widget CustomButton1({
    required String buttonnname,
    required VoidCallback callback,
    Color? buttoncolor,
  }) {
    return SizedBox(
      height: 50,
      width: 320,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttoncolor ?? AppColors.buttonLight1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          buttonnname,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "bold",
          ),
        ),
      ),
    );
  }

  static Widget createbtn({
    required String buttonnname,
    required VoidCallback callback,
    Color? buttoncolor,
  }) {
    return SizedBox(
      height: 50,
      width: 220,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttoncolor ?? AppColors.buttonLight1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          buttonnname,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "bold",
          ),
        ),
      ),
    );
  }

  static Widget joinbtn({
    required String buttonnname,
    required VoidCallback callback,
    Color? buttoncolor,
  }) {
    return SizedBox(
      height: 50,
      width: 220,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttoncolor ?? AppColors.buttonLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          buttonnname,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "bold",
          ),
        ),
      ),
    );
  }

  static Widget CustomTextField({
    required TextEditingController controller,
    required String text,
    required TextInputType textinputtype,
    required BuildContext context,
    required IconData icondata,
    required Function(String) onChanged,
    IconButton? suffixIcon,
  }) {
    return Container(
      height: 50,
      width: 320,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.textFieldDark
            : AppColors.textFieldLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: textinputtype,
        onChanged: onChanged,
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.numberTextDark
              : AppColors.numberTextLight,
        ),
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(
            icondata,
            color: AppColors.iconLight,
          ),
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.hintDark
                : AppColors.hintLight,
            fontSize: 14,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
