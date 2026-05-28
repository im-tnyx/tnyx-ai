import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/legal/presentation/legal_document_route.dart';

sealed class LegalDocumentSheet {
  LegalDocumentSheet._();

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String url,
    required bool isRemoteEnabled,
  }) {
    return showGeneralDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close legal document',
      barrierColor: Colors.black.withValues(alpha: 0.72),
      transitionDuration: const Duration(milliseconds: 220),
      pageBuilder: (_, __, ___) => LegalDocumentRoute(
        documentTitle: title,
        documentUrl: url,
        isRemoteEnabled: isRemoteEnabled,
      ),
      transitionBuilder: (_, animation, __, child) {
        final fade = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        return FadeTransition(
          opacity: fade,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.98, end: 1.0).animate(fade),
            child: child,
          ),
        );
      },
    );
  }
}
