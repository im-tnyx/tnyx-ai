import 'package:flutter/material.dart';

@immutable
class TnyxDimens extends ThemeExtension<TnyxDimens> {
  const TnyxDimens({
    // Spacing
    this.spaceXS = 4,
    this.spaceS = 8,
    this.spaceSM = 12,
    this.spaceM = 16,
    this.spaceL = 24,
    this.spaceXL = 32,

    // Padding
    this.paddingScreen = 16,
    this.paddingCard = 16,
    this.paddingContent = 12,
    this.paddingItem = 12,
    this.paddingButton = 8,
    this.paddingInput = 8,

    // Radius
    this.radiusS = 8,
    this.radiusM = 12,
    this.radiusL = 16,
    this.radiusXL = 24,
    this.radiusPill = 50,
    this.radiusCard = 16,
    this.radiusList = 8,
    this.radiusItem = 8,
    this.radiusButton = 8,

    // Elevation (legacy + semantic)
    this.elevationCard = 2,
    this.elevationButton = 0,
    this.elevationItem = 1,
    this.elevationS = 2,
    this.elevationM = 4,
    this.elevationL = 8,

    // Size
    this.buttonHeight = 50,
    this.iconS = 16,
    this.iconM = 24,
    this.iconL = 32,
    this.iconXL = 62,
    this.iconXXL = 70,

    // Border
    this.borderThin = 0.75,
    this.borderThick = 1.25,
    this.borderBold = 2,

    // Top bar / header
    this.topBarHeight = 54,
    this.topBarIcon = 24,
    this.topBarPadding = 16,

    // Special
    this.bottomBarHeight = 60,
    this.dialogInputHeight = 46,
    this.progressBarHeight = 8,
    this.aiChatInnerButton = 46,
    this.aiChatOuterRing = 55,
  });

  // Spacing
  final double spaceXS;
  final double spaceS;
  final double spaceSM;
  final double spaceM;
  final double spaceL;
  final double spaceXL;

  // Padding
  final double paddingScreen;
  final double paddingCard;
  final double paddingContent;
  final double paddingItem;
  final double paddingButton;
  final double paddingInput;

  // Radius
  final double radiusS;
  final double radiusM;
  final double radiusL;
  final double radiusXL;
  final double radiusPill;
  final double radiusCard;
  final double radiusList;
  final double radiusItem;
  final double radiusButton;

  // Elevation
  final double elevationCard;
  final double elevationButton;
  final double elevationItem;
  final double elevationS;
  final double elevationM;
  final double elevationL;

  // Size
  final double buttonHeight;
  final double iconS;
  final double iconM;
  final double iconL;
  final double iconXL;
  final double iconXXL;

  // Border
  final double borderThin;
  final double borderThick;
  final double borderBold;

  // Top bar
  final double topBarHeight;
  final double topBarIcon;
  final double topBarPadding;

  // Special
  final double bottomBarHeight;
  final double dialogInputHeight;
  final double progressBarHeight;
  final double aiChatInnerButton;
  final double aiChatOuterRing;

  // Backward-compat getters used by existing screens.
  double get spacing4 => spaceXS;
  double get spacing8 => spaceS;
  double get spacing12 => spaceSM;
  double get spacing16 => spaceM;
  double get spacing20 => 20;
  double get spacing24 => spaceL;
  double get spacing32 => spaceXL;
  double get spacing40 => 40;
  double get radius12 => radiusM;
  double get radius20 => 20;

  static const TnyxDimens defaults = TnyxDimens();

  @override
  ThemeExtension<TnyxDimens> copyWith({
    double? spaceXS,
    double? spaceS,
    double? spaceSM,
    double? spaceM,
    double? spaceL,
    double? spaceXL,
    double? paddingScreen,
    double? paddingCard,
    double? paddingContent,
    double? paddingItem,
    double? paddingButton,
    double? paddingInput,
    double? radiusS,
    double? radiusM,
    double? radiusL,
    double? radiusXL,
    double? radiusPill,
    double? radiusCard,
    double? radiusList,
    double? radiusItem,
    double? radiusButton,
    double? elevationCard,
    double? elevationButton,
    double? elevationItem,
    double? elevationS,
    double? elevationM,
    double? elevationL,
    double? buttonHeight,
    double? iconS,
    double? iconM,
    double? iconL,
    double? iconXL,
    double? iconXXL,
    double? borderThin,
    double? borderThick,
    double? borderBold,
    double? topBarHeight,
    double? topBarIcon,
    double? topBarPadding,
    double? bottomBarHeight,
    double? dialogInputHeight,
    double? progressBarHeight,
    double? aiChatInnerButton,
    double? aiChatOuterRing,
  }) {
    return TnyxDimens(
      spaceXS: spaceXS ?? this.spaceXS,
      spaceS: spaceS ?? this.spaceS,
      spaceSM: spaceSM ?? this.spaceSM,
      spaceM: spaceM ?? this.spaceM,
      spaceL: spaceL ?? this.spaceL,
      spaceXL: spaceXL ?? this.spaceXL,
      paddingScreen: paddingScreen ?? this.paddingScreen,
      paddingCard: paddingCard ?? this.paddingCard,
      paddingContent: paddingContent ?? this.paddingContent,
      paddingItem: paddingItem ?? this.paddingItem,
      paddingButton: paddingButton ?? this.paddingButton,
      paddingInput: paddingInput ?? this.paddingInput,
      radiusS: radiusS ?? this.radiusS,
      radiusM: radiusM ?? this.radiusM,
      radiusL: radiusL ?? this.radiusL,
      radiusXL: radiusXL ?? this.radiusXL,
      radiusPill: radiusPill ?? this.radiusPill,
      radiusCard: radiusCard ?? this.radiusCard,
      radiusList: radiusList ?? this.radiusList,
      radiusItem: radiusItem ?? this.radiusItem,
      radiusButton: radiusButton ?? this.radiusButton,
      elevationCard: elevationCard ?? this.elevationCard,
      elevationButton: elevationButton ?? this.elevationButton,
      elevationItem: elevationItem ?? this.elevationItem,
      elevationS: elevationS ?? this.elevationS,
      elevationM: elevationM ?? this.elevationM,
      elevationL: elevationL ?? this.elevationL,
      buttonHeight: buttonHeight ?? this.buttonHeight,
      iconS: iconS ?? this.iconS,
      iconM: iconM ?? this.iconM,
      iconL: iconL ?? this.iconL,
      iconXL: iconXL ?? this.iconXL,
      iconXXL: iconXXL ?? this.iconXXL,
      borderThin: borderThin ?? this.borderThin,
      borderThick: borderThick ?? this.borderThick,
      borderBold: borderBold ?? this.borderBold,
      topBarHeight: topBarHeight ?? this.topBarHeight,
      topBarIcon: topBarIcon ?? this.topBarIcon,
      topBarPadding: topBarPadding ?? this.topBarPadding,
      bottomBarHeight: bottomBarHeight ?? this.bottomBarHeight,
      dialogInputHeight: dialogInputHeight ?? this.dialogInputHeight,
      progressBarHeight: progressBarHeight ?? this.progressBarHeight,
      aiChatInnerButton: aiChatInnerButton ?? this.aiChatInnerButton,
      aiChatOuterRing: aiChatOuterRing ?? this.aiChatOuterRing,
    );
  }

  @override
  ThemeExtension<TnyxDimens> lerp(
    covariant ThemeExtension<TnyxDimens>? other,
    double t,
  ) {
    if (other is! TnyxDimens) return this;
    return TnyxDimens(
      spaceXS: _lerp(spaceXS, other.spaceXS, t),
      spaceS: _lerp(spaceS, other.spaceS, t),
      spaceSM: _lerp(spaceSM, other.spaceSM, t),
      spaceM: _lerp(spaceM, other.spaceM, t),
      spaceL: _lerp(spaceL, other.spaceL, t),
      spaceXL: _lerp(spaceXL, other.spaceXL, t),
      paddingScreen: _lerp(paddingScreen, other.paddingScreen, t),
      paddingCard: _lerp(paddingCard, other.paddingCard, t),
      paddingContent: _lerp(paddingContent, other.paddingContent, t),
      paddingItem: _lerp(paddingItem, other.paddingItem, t),
      paddingButton: _lerp(paddingButton, other.paddingButton, t),
      paddingInput: _lerp(paddingInput, other.paddingInput, t),
      radiusS: _lerp(radiusS, other.radiusS, t),
      radiusM: _lerp(radiusM, other.radiusM, t),
      radiusL: _lerp(radiusL, other.radiusL, t),
      radiusXL: _lerp(radiusXL, other.radiusXL, t),
      radiusPill: _lerp(radiusPill, other.radiusPill, t),
      radiusCard: _lerp(radiusCard, other.radiusCard, t),
      radiusList: _lerp(radiusList, other.radiusList, t),
      radiusItem: _lerp(radiusItem, other.radiusItem, t),
      radiusButton: _lerp(radiusButton, other.radiusButton, t),
      elevationCard: _lerp(elevationCard, other.elevationCard, t),
      elevationButton: _lerp(elevationButton, other.elevationButton, t),
      elevationItem: _lerp(elevationItem, other.elevationItem, t),
      elevationS: _lerp(elevationS, other.elevationS, t),
      elevationM: _lerp(elevationM, other.elevationM, t),
      elevationL: _lerp(elevationL, other.elevationL, t),
      buttonHeight: _lerp(buttonHeight, other.buttonHeight, t),
      iconS: _lerp(iconS, other.iconS, t),
      iconM: _lerp(iconM, other.iconM, t),
      iconL: _lerp(iconL, other.iconL, t),
      iconXL: _lerp(iconXL, other.iconXL, t),
      iconXXL: _lerp(iconXXL, other.iconXXL, t),
      borderThin: _lerp(borderThin, other.borderThin, t),
      borderThick: _lerp(borderThick, other.borderThick, t),
      borderBold: _lerp(borderBold, other.borderBold, t),
      topBarHeight: _lerp(topBarHeight, other.topBarHeight, t),
      topBarIcon: _lerp(topBarIcon, other.topBarIcon, t),
      topBarPadding: _lerp(topBarPadding, other.topBarPadding, t),
      bottomBarHeight: _lerp(bottomBarHeight, other.bottomBarHeight, t),
      dialogInputHeight: _lerp(dialogInputHeight, other.dialogInputHeight, t),
      progressBarHeight: _lerp(progressBarHeight, other.progressBarHeight, t),
      aiChatInnerButton: _lerp(aiChatInnerButton, other.aiChatInnerButton, t),
      aiChatOuterRing: _lerp(aiChatOuterRing, other.aiChatOuterRing, t),
    );
  }

  static double _lerp(double a, double b, double t) => a + (b - a) * t;
}

extension ThemeDimensX on BuildContext {
  TnyxDimens get dimens =>
      Theme.of(this).extension<TnyxDimens>() ?? TnyxDimens.defaults;
}
