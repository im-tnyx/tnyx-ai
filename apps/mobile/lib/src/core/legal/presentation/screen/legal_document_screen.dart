import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/legal/presentation/state/legal_document_ui_state.dart';
import 'package:tnyx_mobile/src/core/legal/presentation/action/legal_document_action.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_status_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LegalDocumentScreen extends StatelessWidget {
  const LegalDocumentScreen({
    required this.state,
    required this.onAction,
    required this.webViewController,
    super.key,
  });

  final LegalDocumentUiState state;
  final ValueChanged<LegalDocumentAction> onAction;
  final WebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final statusColors = context.statusColors;
    final media = MediaQuery.sizeOf(context);
    final viewPadding = MediaQuery.viewPaddingOf(context);
    
    const horizontalPadding = 12.0;
    const cardHeightFactor = 1.0;
    const topPadding = 0.0;
    final bottomPadding = math.max(8.0, viewPadding.bottom);
    const minTopClearance = 8.0;
    const cardBottomOverlap = 0.0;
    
    final availableHeight = media.height - topPadding - bottomPadding;
    final cardHeightByFactor = availableHeight * cardHeightFactor;
    final cardHeightByTopClearance = math.max(0.0, availableHeight - minTopClearance);
    final cardMaxHeight = math.min(cardHeightByFactor, cardHeightByTopClearance);

    return Material(
      color: Colors.transparent, // Let the dialog barrier or Backdrop handle the dimming
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            topPadding,
            horizontalPadding,
            bottomPadding,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // 1. Backdrop Gesture Detector
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onAction(const LegalDocumentBackdropTapped()),
                ),
              ),
              
              // 2. Main Card Content
              Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                  offset: const Offset(0, cardBottomOverlap),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 620,
                      maxHeight: cardMaxHeight,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: cardMaxHeight,
                      child: Stack(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: colors.surface,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: colors.outline.withValues(alpha: 0.22),
                              ),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      if (state.isRemoteEnabled &&
                                          webViewController != null)
                                        _LegalWebScrollableContent(
                                          title: state.title,
                                          controller: webViewController!,
                                        )
                                      else
                                        _LegalPlaceholderContent(
                                          title: state.title,
                                          state: state,
                                        ),
                                      if (state.isLoading)
                                        const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // 3. Close Button
                          Positioned(
                            top: 5,
                            right: 5,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () =>
                                    onAction(const LegalDocumentCloseTapped()),
                                child: Ink(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: statusColors.error,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: colors.outline.withValues(alpha: 0.35),
                                      width: 1.5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: statusColors.error.withValues(
                                          alpha: 0.35,
                                        ),
                                        blurRadius: 10,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.close_rounded,
                                    color: Colors.white,
                                    size: 19,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LegalWebScrollableContent extends StatelessWidget {
  const _LegalWebScrollableContent({
    required this.title,
    required this.controller,
  });

  final String title;
  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final viewportHeight = MediaQuery.sizeOf(context).height;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 56),
            child: Text(
              title,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 27,
                height: 1.1,
                color: colors.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: viewportHeight * 0.68,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: WebViewWidget(controller: controller),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegalPlaceholderContent extends StatelessWidget {
  const _LegalPlaceholderContent({
    required this.title,
    required this.state,
  });

  final String title;
  final LegalDocumentUiState state;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final strings = state.strings;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 56),
            child: Text(
              title,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 27,
                height: 1.1,
                color: colors.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            strings.uiOnlyModeTitle,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.onSurface,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${state.title} ${strings.uiOnlyModeSubtitle}',
            style: textTheme.bodyLarge?.copyWith(
              color: colors.onSurface,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          ...strings.legalPlaceholderSections.map(
            (section) => Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    section['title']!,
                    style: textTheme.titleMedium?.copyWith(
                      color: colors.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    section['body']!,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.onSurface,
                      height: 1.55,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${strings.enableRemoteDocsText}\n'
            '--dart-define=ALLOW_NETWORK_CALLS=true\n'
            '--dart-define=ENABLE_REMOTE_LEGAL_DOCS=true',
            style: textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.surfaceContainer.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colors.outline.withValues(alpha: 0.35),
                width: 1.2,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: colors.onSurfaceVariant,
                  size: 18,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    strings.legalInfoText,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      height: 1.35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


