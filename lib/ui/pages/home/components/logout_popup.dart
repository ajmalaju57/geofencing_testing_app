import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/ui/components/app_text.dart';
import 'package:test_app/ui/components/btn_primary_gradient.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/extensions/margin_ext.dart';
import 'package:test_app/utils/shared/helper_dialog.dart';
import 'package:test_app/utils/shared/page_navigator.dart';
import 'package:test_app/utils/strings.dart';

void showPopUp(BuildContext ctx) {
  showPopup(
    ctx,
    barrierDismissible: true,
    content: Container(
      height: 250,
      width: 328,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: colorWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppText(
            "Do you want to exit?",
            size: 16,
            family: inter600,
            align: TextAlign.center,
            color: primaryColor,
          ),
          10.hBox,
          BtnPrimaryGradient(
              isBg: true,
              onTap: () {
                Screen.closeDialog(ctx);
              },
              text: "Cancel"),
          10.hBox,
          BtnPrimaryGradient(
              onTap: () {
                SystemNavigator.pop();
              },
              text: "Yes"),
        ],
      ),
    ),
  );
}
