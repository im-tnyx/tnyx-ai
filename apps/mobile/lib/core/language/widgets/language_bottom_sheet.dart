import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/language/app_language.dart';

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
    backgroundColor: Theme.of(context).colorScheme.surface,
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
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  late AppLanguage _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = widget.selectedLanguage;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<AppLanguage> get _filteredLanguages {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) return AppLanguage.values;

    return AppLanguage.values.where((language) {
      final searchable = <String>[
        language.code,
        language.shortLabel,
        language.displayName,
        language.nativeName,
        language.optionLabel,
      ].join(' ').toLowerCase();
      return searchable.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final filteredLanguages = _filteredLanguages;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          8,
          20,
          MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: textTheme.headlineSmall?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.subtitle,
              style: textTheme.bodyLarge?.copyWith(
                color: colors.onSurface.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _query = value),
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: widget.searchHint,
                prefixIcon: const Icon(Icons.search_rounded),
                isDense: true,
                filled: true,
                fillColor: colors.surfaceVariant.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: colors.outlineVariant),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: colors.outlineVariant),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: colors.primary, width: 1.4),
                ),
              ),
            ),
            const SizedBox(height: 14),
            if (filteredLanguages.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    widget.noResultsText,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colors.onSurface.withOpacity(0.75),
                    ),
                  ),
                ),
              )
            else
              ...List<Widget>.generate(
                filteredLanguages.length,
                (index) {
                  final language = filteredLanguages[index];
                  final isSelected = language == _selectedLanguage;
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index == filteredLanguages.length - 1 ? 0 : 10,
                    ),
                    child: _LanguageOptionTile(
                      language: language,
                      isSelected: isSelected,
                      onTap: () => setState(() => _selectedLanguage = language),
                    ),
                  );
                },
              ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(_selectedLanguage),
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
              ? colors.primaryContainer.withOpacity(0.35)
              : colors.surfaceVariant.withOpacity(0.25),
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
                  fontWeight: FontWeight.w700,
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
