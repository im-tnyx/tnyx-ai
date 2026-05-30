import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/language/language_scope.dart';
import 'package:tnyx_mobile/src/core/legal/presentation/route/legal_document_route.dart';

class LegalDocumentSheet {
  static void show({
    required BuildContext context,
    required String title,
    required String url,
    bool isRemoteEnabled = false,
  }) {
    // Get current language from the provider
    final language = LanguageScope.read(context).currentLanguage;

    // Use showGeneralDialog for a more stable custom full-screen overlay
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'LegalDocument',
      barrierColor: Colors.black.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return LegalDocumentRoute(
          title: title,
          url: url,
          language: language,
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
    );
  }
}


