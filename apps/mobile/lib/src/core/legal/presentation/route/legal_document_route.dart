import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/language/app_language.dart';
import 'package:tnyx_mobile/src/core/legal/presentation/action/legal_document_action.dart';
import 'package:tnyx_mobile/src/core/legal/presentation/screen/legal_document_screen.dart';
import 'package:tnyx_mobile/src/core/legal/presentation/view_model/legal_document_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LegalDocumentRoute extends StatefulWidget {
  const LegalDocumentRoute({
    required this.title,
    required this.url,
    required this.language, // रिसीव लैंग्वेज डायरेक्टली
    super.key,
  });

  final String title;
  final String url;
  final AppLanguage language;

  @override
  State<LegalDocumentRoute> createState() => _LegalDocumentRouteState();
}

class _LegalDocumentRouteState extends State<LegalDocumentRoute> {
  late final LegalDocumentViewModel _viewModel;
  WebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    
    _viewModel = LegalDocumentViewModel(
      title: widget.title, 
      url: widget.url,
      language: widget.language,
    );
    
    if (_viewModel.uiState.isRemoteEnabled) {
      _webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (_) => _onAction(const LegalDocumentWebPageStarted()),
            onPageFinished: (_) => _onAction(const LegalDocumentWebPageFinished()),
          ),
        )
        ..loadRequest(Uri.parse(widget.url));
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _onAction(LegalDocumentAction action) {
    _viewModel.onAction(action);
    switch (action) {
      case LegalDocumentCloseTapped():
      case LegalDocumentBackdropTapped():
        Navigator.pop(context);
        break;
      case LegalDocumentWebPageStarted():
      case LegalDocumentWebPageFinished():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return LegalDocumentScreen(
          state: _viewModel.uiState,
          onAction: _onAction,
          webViewController: _webViewController,
        );
      },
    );
  }
}
