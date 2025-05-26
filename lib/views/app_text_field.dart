//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_core/extensions/extensions.dart';
import 'package:my_core/theming/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.prefix,
    this.suffix,
    this.hasError = false,
    this.lostFocus,
    required this.hint,
    this.keyboardType,
    this.obscureText = false,
    this.textInputAction,
    this.readOnly = false,
    this.hasBackground = true,
  });

  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;
  final Function()? lostFocus;
  final Widget? prefix;
  final Widget? suffix;
  final bool hasError;
  final String? hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool hasBackground;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.bodyLarge;

    return Row(
      children: [
        prefix == null
            ? const SizedBox.shrink()
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  prefix!,
                  const SizedBox(width: 8),
                ],
              ),
        Expanded(
          child: Focus(
            onFocusChange: (value) {
              if (!value && lostFocus != null) {
                lostFocus!();
              }
            },
            child: TextField(
              controller: controller,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              keyboardType: keyboardType,
              obscureText: obscureText,
              textInputAction: textInputAction,
              autocorrect: false,
              enableSuggestions: false,
              readOnly: readOnly,
              style: style,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: style?.copyWith(
                  color: AppColors.greyText,
                ),
              ),
            ),
          ),
        ),
        suffix == null
            ? const SizedBox.shrink()
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 8),
                  suffix!,
                ],
              ),
      ],
    );

    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 16),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(5),
    //     color: readOnly && hasBackground ? AppColors.grey : null,
    //     border: Border.all(
    //       width: readOnly && hasBackground ? 1.5 : 1,
    //       color: hasError ? context.colorScheme.error : AppColors.purple,
    //     ),
    //   ),
    //   child: IntrinsicHeight(
    //     child: Row(
    //       children: [
    //         prefix == null
    //             ? const SizedBox.shrink()
    //             : Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   prefix!,
    //                   const SizedBox(width: 4),
    //                   VerticalDivider(
    //                     indent: 8,
    //                     endIndent: 8,
    //                     color: readOnly ? AppColors.purple : AppColors.grey,
    //                   ),
    //                   const SizedBox(width: 4),
    //                 ],
    //               ),

    //         suffix == null ? const SizedBox.shrink() : suffix!,
    //       ],
    //     ),
    //   ),
    // );
  }
}
