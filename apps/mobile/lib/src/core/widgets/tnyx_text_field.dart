import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';

class TnyxTextField extends StatefulWidget {
  const TnyxTextField({
    required this.onChanged,
    this.value,
    this.controller,
    this.label,
    this.placeholder,
    this.leadingIcon,
    this.trailingIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    this.enabled = true,
    this.isError = false,
    this.errorMessage,
    this.focusNode,
    super.key,
  });

  final String? value;
  final TextEditingController? controller;
  final ValueChanged<String> onChanged;
  final String? label;
  final String? placeholder;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;
  final bool isError;
  final String? errorMessage;
  final FocusNode? focusNode;

  @override
  State<TnyxTextField> createState() => _TnyxTextFieldState();
}

class _TnyxTextFieldState extends State<TnyxTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_handleFocusChange);
    }
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    final Color labelColor = widget.isError
        ? colors.error
        : (_isFocused ? colors.primary : colors.onSurfaceVariant);

    final Color textColor = widget.isError
        ? colors.error
        : (_isFocused ? colors.onSurface : colors.onSurfaceVariant);

    final borderSide = BorderSide(
      color: widget.isError
          ? colors.error
          : (_isFocused ? colors.primary : colors.outline),
      width: _isFocused ? TnyxDimens.borderThick : TnyxDimens.borderThin,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: widget.controller,
          initialValue: widget.controller == null ? widget.value : null,
          onChanged: widget.onChanged,
          focusNode: _focusNode,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onSubmitted,
          enabled: widget.enabled,
          style: textTheme.bodyLarge?.copyWith(color: textColor),
          cursorColor: widget.isError ? colors.error : colors.primary,
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.placeholder,
            prefixIcon: widget.leadingIcon,
            suffixIcon: widget.trailingIcon,
            // Styling based on Compose DecorationBox logic
            labelStyle: textTheme.bodyMedium?.copyWith(color: labelColor),
            hintStyle: textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant.withOpacity(0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TnyxDimens.radiusInput),
              borderSide: borderSide,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TnyxDimens.radiusInput),
              borderSide: borderSide,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TnyxDimens.radiusInput),
              borderSide: borderSide,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TnyxDimens.radiusInput),
              borderSide: borderSide,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TnyxDimens.radiusInput),
              borderSide: borderSide.copyWith(color: colors.outline.withOpacity(0.3)),
            ),
            contentPadding: TnyxDimens.inputPadding,
            filled: false,
          ),
        ),
        
        // Animated Error Message Section
        SizedBox(
          height: TnyxDimens.spaceM,
          child: Padding(
            padding: const EdgeInsets.only(
              left: TnyxDimens.spaceS,
              top: TnyxDimens.spaceXS,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: (widget.isError && widget.errorMessage != null)
                  ? Text(
                      widget.errorMessage!,
                      key: ValueKey(widget.errorMessage),
                      style: textTheme.labelSmall?.copyWith(color: colors.error),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ],
    );
  }
}
