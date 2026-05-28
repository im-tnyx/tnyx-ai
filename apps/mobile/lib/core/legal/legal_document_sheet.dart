import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/config/app_config.dart';
import 'package:tnyx_mobile/core/legal/presentation/legal_document_contract.dart';
import 'package:tnyx_mobile/core/legal/presentation/legal_document_route.dart';

export 'package:tnyx_mobile/core/legal/presentation/legal_document_contract.dart'
    show LegalDocumentType;

Future<void> showLegalDocumentSheet({
  required BuildContext context,
  required LegalDocumentType type,
  required String termsUrl,
  required String privacyUrl,
}) {
  final url = switch (type) {
    LegalDocumentType.terms => termsUrl,
    LegalDocumentType.privacy => privacyUrl,
  };
  final title = switch (type) {
    LegalDocumentType.terms => 'Terms & Conditions',
    LegalDocumentType.privacy => 'Privacy Policy',
  };

  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close legal document',
    barrierColor: Colors.black.withValues(alpha: 0.72),
    transitionDuration: const Duration(milliseconds: 220),
    pageBuilder: (_, __, ___) => LegalDocumentRoute(
      documentTitle: title,
      documentUrl: url,
      isRemoteEnabled: AppConfig.remoteLegalDocsEnabled,
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
