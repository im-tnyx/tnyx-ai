import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';

class TnyxTimePicker {
  TnyxTimePicker._();

  static Future<TimeOfDay?> show({
    required BuildContext context,
    required String title,
    TimeOfDay initialTime = const TimeOfDay(hour: 12, minute: 0),
  }) async {
    return showDialog<TimeOfDay>(
      context: context,
      builder: (context) => _TnyxTimePickerDialog(
        title: title,
        initialTime: initialTime,
      ),
    );
  }
}

class _TnyxTimePickerDialog extends StatefulWidget {
  const _TnyxTimePickerDialog({
    required this.title,
    required this.initialTime,
  });

  final String title;
  final TimeOfDay initialTime;

  @override
  State<_TnyxTimePickerDialog> createState() => _TnyxTimePickerDialogState();
}

class _TnyxTimePickerDialogState extends State<_TnyxTimePickerDialog> {
  late TimeOfDay _selectedTime;
  TimePickerEntryMode _entryMode = TimePickerEntryMode.dial;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Dialog(
      backgroundColor: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TnyxDimens.radiusL),
      ),
      child: Padding(
        padding: const EdgeInsets.all(TnyxDimens.spaceL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: theme.textTheme.labelMedium?.copyWith(
                color: colors.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: TnyxDimens.spaceL),
            
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 450),
              child: Theme(
                data: theme.copyWith(
                  timePickerTheme: theme.timePickerTheme.copyWith(
                    dayPeriodColor: colors.primary.withValues(alpha: 0.3),
                    dayPeriodTextColor: colors.primary,
                    dialBackgroundColor: colors.onSurface.withValues(alpha: 0.08),
                    hourMinuteColor: colors.primary.withValues(alpha: 0.3),
                    hourMinuteTextColor: colors.primary,
                  ),
                ),
                child: TimePickerDialog(
                  initialTime: _selectedTime,
                  initialEntryMode: _entryMode,
                ),
              ),
            ),
            
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _entryMode = _entryMode == TimePickerEntryMode.dial
                          ? TimePickerEntryMode.input
                          : TimePickerEntryMode.dial;
                    });
                  },
                  icon: Icon(
                    _entryMode == TimePickerEntryMode.dial
                        ? Icons.keyboard_outlined
                        : Icons.schedule_outlined,
                    color: colors.onSurface.withValues(alpha: 0.8),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    "CANCEL",
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colors.onSurface,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(_selectedTime),
                  child: Text(
                    "OK",
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
