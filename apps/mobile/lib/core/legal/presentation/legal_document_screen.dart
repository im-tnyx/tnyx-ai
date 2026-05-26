import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/legal/presentation/legal_document_contract.dart';
import 'package:tnyx_mobile/core/theme/app_status_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LegalDocumentScreen extends StatelessWidget {
  const LegalDocumentScreen({
    required this.uiState,
    required this.onAction,
    required this.webViewController,
    super.key,
  });

  final LegalDocumentUiState uiState;
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

    return SafeArea(
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
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onAction(const LegalDocumentBackdropTapped()),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.translate(
                offset: Offset(0, cardBottomOverlap),
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
                                    if (uiState.isRemoteEnabled &&
                                        webViewController != null)
                                      _LegalWebScrollableContent(
                                        title: uiState.title,
                                        controller: webViewController!,
                                      )
                                    else
                                      _LegalPlaceholderContent(
                                        title: uiState.title,
                                      ),
                                    if (uiState.isLoading)
                                      const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const demoSections = <Map<String, String>>[
      {
        'title': '1. Data We Collect',
        'body':
            'We may process account profile details, device metadata, language preference, and feature usage telemetry to improve the app experience and reliability.',
      },
      {
        'title': '2. Why We Use It',
        'body':
            'Data is used for core app operations, security checks, personalization, analytics, and issue diagnosis. We avoid unrelated processing in UI-only mode.',
      },
      {
        'title': '3. Storage & Retention',
        'body':
            'Data retention depends on account lifecycle and legal obligations. Temporary caches are removed automatically over time to maintain performance.',
      },
      {
        'title': '4. Third-party Services',
        'body':
            'When backend mode is enabled later, infrastructure vendors may be used for hosting, notifications, and authentication, following contractual safeguards.',
      },
      {
        'title': '5. User Controls',
        'body':
            'You can update preferences, request export, and request account deletion according to policy. Additional controls appear after backend integration.',
      },
      {
        'title': '6. Security Measures',
        'body':
            'We apply secure transport, least-privilege access, and monitoring practices. Sensitive operations are intended to run only on trusted backend paths.',
      },
      {
        'title': '7. Policy Updates',
        'body':
            'Legal text can evolve with product updates and regulatory changes. Material updates should be communicated in-app before new processing begins.',
      },
      {
        'title': '8. Contact',
        'body':
            'For policy-related concerns, support channels will be listed in production settings. This placeholder exists to validate modal scrolling behavior.',
      },
    ];

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
            'UI-only mode is active',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.onSurface,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '$title content will render from remote legal source once network-backed mode is enabled.',
            style: textTheme.bodyLarge?.copyWith(
              color: colors.onSurface,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          ...demoSections.map(
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
            'To enable remote legal docs, run with:\n'
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
              color: colors.surfaceContainerHighest.withValues(alpha: 0.22),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colors.outline.withValues(alpha: 0.25),
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
                    'Your privacy and consent choices matter. Review this document carefully before proceeding.',
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
