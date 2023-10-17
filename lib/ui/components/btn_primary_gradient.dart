import 'package:flutter/material.dart';
import 'package:test_app/ui/components/app_text.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/extensions/string_ext.dart';
import 'package:test_app/utils/strings.dart';

class BtnPrimaryGradient extends StatelessWidget {
  const BtnPrimaryGradient({
    Key? key,
    required this.onTap,
    required this.text,
    this.family = inter600,
    this.fontSize = 14,
    this.textColor = colorWhite,
    this.padding,
    this.width,
    this.isBg = false,
    this.height = 48,
  }) : super(key: key);

  final void Function() onTap;
  final String text;
  final EdgeInsets? padding;
  final double? width, fontSize, height;
  final String? family;
  final Color textColor;
  final bool isBg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width,
          height: height!,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isBg ? Colors.black : primaryColor,
            gradient: isBg ? null : primaryGradient,
            borderRadius: BorderRadius.circular(8),
          ),
          child: AppText(text.upperFirst,
              family: family, color: textColor, size: fontSize)),
    );
  }
}
