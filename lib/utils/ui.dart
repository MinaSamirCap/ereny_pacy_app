import 'package:ereny_pacy_app/style/colors.dart';
import 'package:flutter/material.dart';

import 'lang/app_localization.dart';

Future sheetSuccess(
    AppLocalizations appLocal, BuildContext context, Size screenSize,Widget child) async {
  await showModalBottomSheet(
      elevation: 50,
      backgroundColor: Colors.white.withOpacity(0),
      context: context,
      isScrollControlled: true,
      builder: (builder) {
        return Container(
            height: screenSize.height * 0.32,
            color: Coolor.WHITE_BG_SHEET,
            child: child);
      });
}
