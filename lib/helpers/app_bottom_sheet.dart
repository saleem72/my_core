//

import 'package:flutter/material.dart';
import 'package:my_core/extensions/extensions.dart';

class AppBottomSheet {
  AppBottomSheet._internal();

  static Future<void> show(
    BuildContext context, {
    Function()? onComplete,
    required Widget child,
    bool isDismissible = true,
    double horizontalPadding = 16,
    double verticalPadding = 16,
  }) async {
    final result = await showModalBottomSheet(
        isDismissible: isDismissible,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return Container(
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              border: Border(
                top: BorderSide(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: child,
            ),
          );
        });

    if (onComplete != null) {
      onComplete();
    }
    return result;
  }
}
