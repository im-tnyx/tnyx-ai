import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/language/app_language.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';

Future<AppLanguage?> showLanguageBottomSheet({
  required BuildContext context,
  required AppLanguage selectedLanguage,
  required String title,
  required String subtitle,
  required String searchHint,
  required String noResultsText,
}) {
  return showModalBottomSheet<AppLanguage>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
    builder: (context) {
      return _LanguageBottomSheet(
        selectedLanguage: selectedLanguage,
        title: title,
        subtitle: subtitle,
        searchHint: searchHint,
        noResultsText: noResultsText,
      );
    },
  );
}

class _LanguageBottomSheet extends StatefulWidget {
  const _LanguageBottomSheet({
    required this.selectedLanguage,
    required this.title,
    required this.subtitle,
    required this.searchHint,
    required this.noResultsText,
  });

  final AppLanguage selectedLanguage;
  final String title;
  final String subtitle;
  final String searchHint;
  final String noResultsText;

  @override
  State<_LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<_LanguageBottomSheet> {
  late AppLanguage _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = widget.selectedLanguage;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const languages = AppLanguage.values;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: textTheme.titleLarge?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              widget.subtitle,
              style: textTheme.bodyLarge?.copyWith(
                color: colors.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 16),
            ...List<Widget>.generate(
              languages.length,
              (index) {
                final language = languages[index];
                final isSelected = language == _selectedLanguage;
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == languages.length - 1 ? 0 : 10,
                  ),
                  child: _LanguageOptionTile(
                    language: language,
                    isSelected: isSelected,
                    onTap: () => setState(() => _selectedLanguage = language),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: TnyxDimens.buttonHeightLarge,
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(_selectedLanguage),
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TnyxDimens.radiusButton),
                  ),
                ),
                child: const Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageOptionTile extends StatelessWidget {
  const _LanguageOptionTile({
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  final AppLanguage language;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? colors.primary : colors.outlineVariant,
            width: isSelected ? 1.5 : 1,
          ),
          color: isSelected
              ? colors.primaryContainer.withValues(alpha: 0.05)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Text(
              language.flag,
              style: textTheme.titleMedium,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                language.optionLabel,
                style: textTheme.titleMedium?.copyWith(
                  color: isSelected ? colors.primary : colors.onSurface,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            Icon(
              isSelected
                  ? Icons.check_circle_rounded
                  : Icons.radio_button_unchecked_rounded,
              color: isSelected ? colors.primary : colors.outline,
            ),
          ],
        ),
      ),
    );
  }
}
