//

import 'package:flutter/material.dart';

class PickDate {
  PickDate._internal();

  static pick(
    BuildContext context, {
    required Function(DateTime date) onSelection,
    DateTime? initialValue,
    ThemeData? theme,
  }) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 30),
      ),
      initialDate: initialValue,
      builder: (_, child) {
        return Theme(
          data: theme ?? Theme.of(context),
          child: child!,
        );
      },
    );
    if (date == null) {
      return;
    }
    onSelection(date);
  }
}
