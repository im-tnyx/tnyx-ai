import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/legal/presentation/legal_document_contract.dart';
import 'package:tnyx_mobile/core/legal/presentation/legal_document_screen.dart';
import 'package:tnyx_mobile/core/legal/presentation/legal_document_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LegalDocumentRoute extends StatefulWidget {
  const LegalDocumentRoute({
    required this.documentTitle,
    required this.documentUrl,
    required this.isRemoteEnabled,
    super.key,
  });

  final String documentTitle;
  final String documentUrl;
  final bool isRemoteEnabled;

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
      title: widget.documentTitle,
      documentUrl: widget.documentUrl,
      isRemoteEnabled: widget.isRemoteEnabled,
    );

    if (widget.isRemoteEnabled) {
      _webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (_) =>
                _viewModel.onAction(const LegalDocumentWebPageStarted()),
            onPageFinished: (_) =>
                _viewModel.onAction(const LegalDocumentWebPageFinished()),
          ),
        )
        ..loadRequest(Uri.parse(widget.documentUrl));
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
        Navigator.of(context).pop();
        return;
      case LegalDocumentWebPageStarted():
      case LegalDocumentWebPageFinished():
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return LegalDocumentScreen(
          uiState: _viewModel.uiState,
          onAction: _onAction,
          webViewController: _webViewController,
        );
      },
    );
  }
}
