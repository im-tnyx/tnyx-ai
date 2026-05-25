import 'package:flutter/widgets.dart';
import 'package:tnyx_mobile/core/language/language_manager.dart';

class LanguageScope extends InheritedNotifier<LanguageManager> {
  const LanguageScope({
    required super.notifier,
    required super.child,
    super.key,
  });

  static LanguageManager watch(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LanguageScope>();
    assert(scope?.notifier != null, 'LanguageScope not found in widget tree.');
    return scope!.notifier!;
  }

  static LanguageManager read(BuildContext context) {
    final element =
        context.getElementForInheritedWidgetOfExactType<LanguageScope>();
    final scope = element?.widget as LanguageScope?;
    assert(scope?.notifier != null, 'LanguageScope not found in widget tree.');
    return scope!.notifier!;
  }
}
