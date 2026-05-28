import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_colors.dart';
import 'package:tnyx_mobile/core/theme/app_dimens.dart';

sealed class TnyxShapes {
  TnyxShapes._();

  /* -------------------------------------------------------------------------- */
  /*                                    CARDS                                   */
  /* -------------------------------------------------------------------------- */

  static final RoundedRectangleBorder cardLight =
  RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
      TnyxDimens.radiusCard,
    ),
    side: BorderSide(
      color: TnyxColors.lightOutline.withValues(
        alpha: 0.35,
      ),
      width: TnyxDimens.borderThin,
    ),
  );

  static final RoundedRectangleBorder cardDark =
  RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
      TnyxDimens.radiusCard,
    ),
    side: BorderSide(
      color: TnyxColors.darkOutline.withValues(
        alpha: 0.35,
      ),
      width: TnyxDimens.borderThin,
    ),
  );

  /* -------------------------------------------------------------------------- */
  /*                                    INPUT                                   */
  /* -------------------------------------------------------------------------- */

  static final OutlineInputBorder inputLight =
  OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      TnyxDimens.radiusInput,
    ),
    borderSide: BorderSide.none,
  );

  static final OutlineInputBorder inputDark =
  OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      TnyxDimens.radiusInput,
    ),
    borderSide: BorderSide.none,
  );

  /* -------------------------------------------------------------------------- */
  /*                                    SHEET                                   */
  /* -------------------------------------------------------------------------- */

  static final RoundedRectangleBorder sheetLight =
  RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(
        TnyxDimens.radiusSheet,
      ),
    ),
  );

  static final RoundedRectangleBorder sheetDark =
  RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(
        TnyxDimens.radiusSheet,
      ),
    ),
  );

  /* -------------------------------------------------------------------------- */
  /*                                   DIALOG                                   */
  /* -------------------------------------------------------------------------- */

  static final RoundedRectangleBorder dialogLight =
  RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
      TnyxDimens.radiusDialog,
    ),
  );

  static final RoundedRectangleBorder dialogDark =
  RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
      TnyxDimens.radiusDialog,
    ),
  );

  /* -------------------------------------------------------------------------- */
  /*                                   BUTTON                                   */
  /* -------------------------------------------------------------------------- */

  static final RoundedRectangleBorder button =
  RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
      TnyxDimens.radiusButton,
    ),
  );

  /* -------------------------------------------------------------------------- */
  /*                                    CHIPS                                   */
  /* -------------------------------------------------------------------------- */

  static final StadiumBorder chip = StadiumBorder(
    side: BorderSide.none,
  );
}