import 'package:flutter/widgets.dart';

sealed class TnyxDimens {
  TnyxDimens._();

  /* -------------------------------------------------------------------------- */
  /*                                   SPACING                                  */
  /* -------------------------------------------------------------------------- */

  static const double spaceNone = 0;

  static const double spaceXXS = 2;
  static const double spaceXS = 4;
  static const double spaceS = 8;
  static const double spaceSM = 12;
  static const double spaceM = 16;
  static const double spaceL = 24;
  static const double spaceXL = 32;
  static const double spaceXXL = 40;
  static const double spaceXXXL = 48;

  /* -------------------------------------------------------------------------- */
  /*                                   PADDING                                  */
  /* -------------------------------------------------------------------------- */

  static const double paddingScreen = spaceM;
  static const double paddingScreenLarge = spaceL;

  static const double paddingCard = spaceM;
  static const double paddingContent = spaceSM;
  static const double paddingItem = spaceSM;

  static const double paddingButtonHorizontal = spaceM;
  static const double paddingButtonVertical = spaceS;

  static const double paddingInputHorizontal = spaceM;
  static const double paddingInputVertical = spaceS;

  /* -------------------------------------------------------------------------- */
  /*                                    RADIUS                                  */
  /* -------------------------------------------------------------------------- */

  static const double radiusNone = 0;

  static const double radiusXS = 6;
  static const double radiusS = 8;
  static const double radiusM = 12;
  static const double radiusL = 16;
  static const double radiusXL = 24;
  static const double radiusXXL = 32;

  static const double radiusPill = 999;

  /* -------------------------------------------------------------------------- */
  /*                               SEMANTIC RADIUS                              */
  /* -------------------------------------------------------------------------- */

  static const double radiusCard = radiusL;
  static const double radiusSheet = radiusXL;
  static const double radiusDialog = radiusXL;

  static const double radiusList = radiusS;
  static const double radiusItem = radiusM;

  static const double radiusButton = radiusM;
  static const double radiusInput = radiusM;

  static const double radiusChip = radiusPill;
  static const double radiusAvatar = radiusPill;

  /* -------------------------------------------------------------------------- */
  /*                                     SIZE                                   */
  /* -------------------------------------------------------------------------- */

  static const double buttonHeight = 52;
  static const double buttonHeightSmall = 42;
  static const double buttonHeightLarge = 56;

  static const double inputHeight = 54;
  static const double inputHeightSmall = 46;

  static const double chipHeight = 36;

  static const double avatarSize = 44;
  static const double avatarSizeSmall = 32;
  static const double avatarSizeLarge = 64;

  /* -------------------------------------------------------------------------- */
  /*                                     ICONS                                  */
  /* -------------------------------------------------------------------------- */

  static const double iconXS = 14;
  static const double iconS = 16;
  static const double iconM = 24;
  static const double iconL = 32;
  static const double iconXL = 48;
  static const double iconXXL = 64;

  /* -------------------------------------------------------------------------- */
  /*                                    BORDER                                  */
  /* -------------------------------------------------------------------------- */

  static const double borderHairline = 0.5;
  static const double borderThin = 1;
  static const double borderThick = 1.5;
  static const double borderBold = 2;

  /* -------------------------------------------------------------------------- */
  /*                                  ELEVATION                                 */
  /* -------------------------------------------------------------------------- */

  static const double elevationNone = 0;
  static const double elevationS = 1;
  static const double elevationM = 2;
  static const double elevationL = 4;
  static const double elevationXL = 8;

  static const double elevationCard = elevationS;
  static const double elevationButton = elevationNone;
  static const double elevationItem = elevationS;
  static const double elevationDialog = elevationXL;

  /* -------------------------------------------------------------------------- */
  /*                                   APP BARS                                 */
  /* -------------------------------------------------------------------------- */

  static const double topBarHeight = 56;
  static const double topBarIcon = iconM;
  static const double topBarPaddingHorizontal = spaceM;

  static const double bottomBarHeight = 56;
  static const double bottomBarItemHeight = 48;
  static const double bottomBarIcon = iconM;

  /* -------------------------------------------------------------------------- */
  /*                                  NAVIGATION                                */
  /* -------------------------------------------------------------------------- */

  static const double navRailWidth = 80;
  static const double bottomNavHeight = bottomBarHeight;

  /* -------------------------------------------------------------------------- */
  /*                                CARDS / LISTS                               */
  /* -------------------------------------------------------------------------- */

  static const double cardMinHeight = 88;

  static const double listItemMinHeight = 56;
  static const double listItemAvatar = avatarSize;

  static const double dividerHeight = borderHairline;

  /* -------------------------------------------------------------------------- */
  /*                              PROGRESS / HEALTH                             */
  /* -------------------------------------------------------------------------- */

  static const double progressBarHeight = 8;
  static const double progressBarHeightSmall = 4;

  static const double ringStrokeWidth = 8;
  static const double ringStrokeWidthSmall = 6;

  /* -------------------------------------------------------------------------- */
  /*                                   AI COACH                                 */
  /* -------------------------------------------------------------------------- */

  static const double aiChatInputHeight = 54;
  static const double aiChatSendButton = 46;

  static const double aiChatOuterRing = 56;

  static const double aiChatMessageMaxWidthFraction = 0.82;

  /* -------------------------------------------------------------------------- */
  /*                                DIALOG / SHEET                              */
  /* -------------------------------------------------------------------------- */

  static const double dialogMinWidth = 280;

  static const double dialogInputHeight = inputHeightSmall;

  static const double sheetHandleWidth = 40;
  static const double sheetHandleHeight = 4;

  /* -------------------------------------------------------------------------- */
  /*                                    SCREEN                                  */
  /* -------------------------------------------------------------------------- */

  static const double screenMaxContentWidth = 560;

  /* -------------------------------------------------------------------------- */
  /*                                EDGE INSETS                                 */
  /* -------------------------------------------------------------------------- */

  static const EdgeInsets screenPadding = EdgeInsets.all(
    paddingScreen,
  );

  static const EdgeInsets screenPaddingLarge = EdgeInsets.all(
    paddingScreenLarge,
  );

  static const EdgeInsets cardPadding = EdgeInsets.all(
    paddingCard,
  );

  static const EdgeInsets contentPadding = EdgeInsets.all(
    paddingContent,
  );

  static const EdgeInsets itemPadding = EdgeInsets.all(
    paddingItem,
  );

  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: paddingButtonHorizontal,
    vertical: paddingButtonVertical,
  );

  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: paddingInputHorizontal,
    vertical: paddingInputVertical,
  );
}