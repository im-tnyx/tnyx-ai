import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
import 'package:tnyx_mobile/src/features/ai/presentation/state/ai_ui_state.dart';
import 'package:tnyx_mobile/src/features/ai/presentation/action/ai_action.dart';
import 'package:tnyx_mobile/src/features/ai_recent_chat/presentation/widgets/ai_recent_chat_drawer.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({
    required this.uiState,
    required this.onAction,
    super.key,
  });

  final AiUiState uiState;
  final ValueChanged<AiAction> onAction;

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode _focusNode = FocusNode();
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus != _isFocused) {
      _isFocused = _focusNode.hasFocus;
      if (_isFocused) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      setState(() {});
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _showModelSheet() {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    showModalBottomSheet(
      context: context,
      backgroundColor: colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(TnyxDimens.radiusSheet)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(TnyxDimens.paddingScreen * 1.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select AI Model', 
              style: textTheme.titleMedium?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: TnyxDimens.spaceM),
            _ModelTile(
              title: 'Fast', 
              subtitle: 'Optimized for speed', 
              isSelected: true, 
              onTap: () => Navigator.pop(context),
            ),
            _ModelTile(
              title: 'Pro', 
              subtitle: 'Highest reasoning capability', 
              isSelected: false, 
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const double barHeight = 52.0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: colors.surface,
        drawer: const AiRecentChatDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              _AiTopBar(
                onAction: (action) {
                  if (action is AiRecentChatClicked) {
                    _scaffoldKey.currentState?.openDrawer();
                  } else if (action is AiModelSelectionClicked) {
                    _showModelSheet();
                  } else {
                    widget.onAction(action);
                  }
                },
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Icon(
                        Icons.auto_awesome, 
                        color: colors.primary, 
                        size: 60,
                      ),
                    ),
                    const SizedBox(height: TnyxDimens.spaceL),
                    Text(
                      'What can I do for you?',
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colors.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: TnyxDimens.paddingScreen, 
                  vertical: TnyxDimens.spaceM,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Row(
                      children: [
                        _SuggestionChip(label: 'How have I been doing today?'),
                        SizedBox(width: TnyxDimens.spaceXS),
                        _SuggestionChip(label: 'What nutrients...'),
                      ],
                    ),
                    const SizedBox(height: TnyxDimens.spaceM),
                    
                    SizedBox(
                      height: barHeight,
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          final double offsetProgress = Curves.easeInOutCubic.transform(
                            (_animation.value - 0.2).clamp(0.0, 0.8) / 0.8,
                          );

                          return Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned.fill(
                                child: CustomPaint(
                                  painter: _LiquidSplitPainter(
                                    progress: _animation.value,
                                    color: colors.onSurface.withValues(alpha: 0.12),
                                    borderColor: colors.onSurface.withValues(alpha: 0.1),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: barHeight,
                                    height: barHeight,
                                    child: Center(
                                      child: Icon(
                                        Icons.add, 
                                        color: colors.onSurface.withValues(alpha: 0.7), 
                                        size: 26,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: offsetProgress * 14),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        const SizedBox(width: TnyxDimens.spaceS),
                                        Expanded(
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                              splashFactory: NoSplash.splashFactory,
                                              highlightColor: Colors.transparent,
                                            ),
                                            child: TextField(
                                              focusNode: _focusNode,
                                              style: TextStyle(
                                                color: colors.onSurface, 
                                                fontSize: 16,
                                              ),
                                              decoration: InputDecoration(
                                                hintText: 'Ask ChatGPT',
                                                hintStyle: TextStyle(
                                                  color: colors.onSurfaceVariant.withValues(alpha: 0.6),
                                                ),
                                                border: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                filled: false,
                                                fillColor: Colors.transparent,
                                                isDense: true,
                                                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.mic_none_rounded, 
                                          color: colors.onSurface.withValues(alpha: 0.5), 
                                          size: 24,
                                        ),
                                        const SizedBox(width: TnyxDimens.spaceXS),
                                        Container(
                                          width: 38,
                                          height: 38,
                                          margin: const EdgeInsets.only(right: 6),
                                          decoration: BoxDecoration(
                                            color: colors.onSurface,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.graphic_eq_rounded, 
                                            color: colors.surface, 
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModelTile extends StatelessWidget {
  const _ModelTile({required this.title, required this.subtitle, required this.isSelected, required this.onTap});
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      onTap: onTap,
      title: Text(title, style: textTheme.bodyLarge?.copyWith(color: colors.onSurface)),
      subtitle: Text(subtitle, style: textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant)),
      trailing: isSelected ? Icon(Icons.check_circle_rounded, color: colors.primary) : null,
    );
  }
}

class _LiquidSplitPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color borderColor;

  _LiquidSplitPainter({
    required this.progress, 
    required this.color,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()..color = color..style = PaintingStyle.fill..isAntiAlias = true;
    
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;

    final double radius = size.height / 2;
    final double buttonSize = size.height;
    final double roundingProgress = Curves.easeOut.transform((progress / 0.6).clamp(0.0, 1.0));
    final double offsetProgress = Curves.easeInOutCubic.transform((progress - 0.2).clamp(0.0, 0.8) / 0.8);
    final double gap = offsetProgress * 14.0;

    final Path leftPath = Path();
    leftPath.addRRect(RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, buttonSize, size.height),
      topLeft: Radius.circular(radius),
      bottomLeft: Radius.circular(radius),
      topRight: Radius.circular(roundingProgress * radius),
      bottomRight: Radius.circular(roundingProgress * radius),
    ));

    final Path rightPath = Path();
    rightPath.addRRect(RRect.fromRectAndCorners(
      Rect.fromLTWH(buttonSize + gap, 0, size.width - (buttonSize + gap), size.height),
      topRight: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
      topLeft: Radius.circular(roundingProgress * radius),
      bottomLeft: Radius.circular(roundingProgress * radius),
    ));

    Path finalPath = Path.combine(PathOperation.union, leftPath, rightPath);

    if (progress > 0.01 && progress < 0.95) {
      final double bridgeProgress = (progress / 0.95).clamp(0.0, 1.0);
      final double neckThickness = radius * math.pow(1.0 - bridgeProgress, 0.4) * 0.98;
      
      final double x1 = buttonSize;
      final double x2 = buttonSize + gap;
      final double midX = (x1 + x2) / 2;

      final bridgePath = Path();
      bridgePath.moveTo(x1, radius - neckThickness);
      bridgePath.quadraticBezierTo(midX, radius - (neckThickness * 0.3), x2, radius - neckThickness);
      bridgePath.lineTo(x2, radius + neckThickness);
      bridgePath.quadraticBezierTo(midX, radius + (neckThickness * 0.3), x1, radius + neckThickness);
      bridgePath.close();
      
      finalPath = Path.combine(PathOperation.union, finalPath, bridgePath);
    }

    canvas.drawPath(finalPath, fillPaint);
    canvas.drawPath(finalPath, borderPaint);
  }

  @override
  bool shouldRepaint(_LiquidSplitPainter oldDelegate) => oldDelegate.progress != progress;
}

class _AiTopBar extends StatelessWidget {
  const _AiTopBar({required this.onAction});
  final ValueChanged<AiAction> onAction;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
            onPressed: () => onAction(const AiBackClicked()),
          ),
          IconButton(
            icon: Icon(Icons.notes_rounded, color: colors.onSurface, size: 24), 
            onPressed: () => onAction(const AiRecentChatClicked()),
          ),
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => onAction(const AiModelSelectionClicked()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Fast', 
                      style: textTheme.labelLarge?.copyWith(
                        color: colors.onSurface.withValues(alpha: 0.7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_right_rounded, 
                      color: colors.onSurfaceVariant.withValues(alpha: 0.4), 
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(Icons.tune_rounded, color: colors.onSurface, size: 22), 
            onPressed: () => onAction(const AiPersonalizeClicked()),
          ),
          IconButton(
            icon: Icon(Icons.add_comment_outlined, color: colors.onSurface, size: 22), 
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  const _SuggestionChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: colors.onSurface.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(TnyxDimens.radiusL),
          border: Border.all(color: colors.onSurface.withValues(alpha: 0.1)),
        ),
        child: Text(
          label, 
          maxLines: 2, 
          overflow: TextOverflow.ellipsis, 
          style: textTheme.bodySmall?.copyWith(
            color: colors.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }
}
