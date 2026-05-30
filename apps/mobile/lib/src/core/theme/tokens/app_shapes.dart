import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';

class TnyxShapes {
  static const RoundedRectangleBorder button = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(TnyxDimens.radiusL)),
  );

  static const RoundedRectangleBorder card = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(TnyxDimens.radiusM)),
  );
  
  static const RoundedRectangleBorder cardLight = card;
  static const RoundedRectangleBorder cardDark = card;

  static const RoundedRectangleBorder input = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(TnyxDimens.radiusInput)),
  );
  
  static const RoundedRectangleBorder inputLight = input;
  static const RoundedRectangleBorder inputDark = input;
  
  static const RoundedRectangleBorder sheet = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(TnyxDimens.radiusSheet)),
  );
  
  static const RoundedRectangleBorder sheetLight = sheet;
  static const RoundedRectangleBorder sheetDark = sheet;
}
