//

import 'package:flutter/material.dart';
import 'package:my_core/extensions/extensions.dart';

class AppDialog {
  static show(
    BuildContext context, {
    required Widget child,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: context.colorScheme.surface,
              elevation: 4,
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
