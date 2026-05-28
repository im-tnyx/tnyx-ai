import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_dimens.dart';
import 'package:tnyx_mobile/core/theme/app_typography.dart';

class LanguageSelectionSheet extends StatefulWidget {
  const LanguageSelectionSheet({
    required this.currentLocale,
    required this.onLanguageSelected,
    super.key,
  });

  final String currentLocale;
  final ValueChanged<String> onLanguageSelected;

  @override
  State<LanguageSelectionSheet> createState() => _LanguageSelectionSheetState();
}

class _LanguageSelectionSheetState extends State<LanguageSelectionSheet> {
  late String _selectedLang;

  @override
  void initState() {
    super.initState();
    _selectedLang = widget.currentLocale;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final languages = [
      {'code': 'EN', 'flag': '🇺🇸', 'name': 'English'},
      {'code': 'HI', 'flag': '🇮🇳', 'name': 'हिंदी'},
    ];

    return Container(
      padding: const EdgeInsets.all(TnyxDimens.paddingScreen),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(TnyxDimens.radiusCard),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle like Compose BottomSheet
          Center(
            child: Container(
              width: 32,
              height: 4,
              margin: const EdgeInsets.only(bottom: TnyxDimens.spaceM),
              decoration: BoxDecoration(
                color: theme.colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(TnyxDimens.radiusPill),
              ),
            ),
          ),
          
          Text(
            "Select Language",
            style: TnyxTypography.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: TnyxDimens.spaceM),

          ...languages.map((lang) {
            final isSelected = _selectedLang == lang['code'];

            return GestureDetector(
              onTap: () => setState(() => _selectedLang = lang['code']!),
              child: Container(
                margin: const EdgeInsets.only(bottom: TnyxDimens.spaceS),
                padding: const EdgeInsets.all(TnyxDimens.paddingCard),
                decoration: BoxDecoration(
                  color: isSelected
                      ? theme.colorScheme.primary.withValues(alpha: 0.1)
                      : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(TnyxDimens.radiusL),
                  border: Border.all(
                    width: isSelected ? 2.0 : 1.0,
                    color: isSelected 
                        ? theme.colorScheme.primary 
                        : theme.colorScheme.outline.withValues(alpha: 0.5),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      lang['flag']!, 
                      style: const TextStyle(fontSize: 24)
                    ),
                    const SizedBox(width: TnyxDimens.spaceM),
                    Expanded(
                      child: Text(
                        lang['name']!,
                        style: TnyxTypography.textTheme.titleMedium?.copyWith(
                          color: isSelected 
                              ? theme.colorScheme.primary 
                              : theme.colorScheme.onSurface,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    Icon(
                      isSelected 
                          ? Icons.check_circle_rounded 
                          : Icons.radio_button_unchecked_rounded,
                      color: isSelected 
                          ? theme.colorScheme.primary 
                          : theme.colorScheme.outline,
                    ),
                  ],
                ),
              ),
            );
          }),

          const SizedBox(height: TnyxDimens.spaceL),

          SizedBox(
            width: double.infinity,
            height: TnyxDimens.buttonHeightLarge,
            child: FilledButton(
              onPressed: () => widget.onLanguageSelected(_selectedLang),
              style: FilledButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(TnyxDimens.radiusL),
                ),
                elevation: 0,
              ),
              child: Text(
                "APPLY",
                style: TnyxTypography.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Bottom padding for system navigation bar
          SizedBox(height: MediaQuery.of(context).padding.bottom + TnyxDimens.spaceS),
        ],
      ),
    );
  }
}
