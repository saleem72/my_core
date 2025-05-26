//

import 'package:my_core/extensions/string_extension.dart';

double? maybeDouble(dynamic value) {
  if (value is num) {
    return value.toDouble();
  }
  if (value is String) {
    return double.tryParse(value);
  }
  return null;
}

int? maybeInt(dynamic value) {
  if (value is num) {
    return value.toInt();
  }
  if (value is String) {
    final integer = int.tryParse(value);

    if (integer == null) {
      return double.tryParse(value)?.toInt();
    }
    return integer;
  }

  return null;
}

extension DynamicDetails on dynamic {
  String get enumDescription => toString().split('.').last.capitalize();

  double? maybeDouble() {
    if (this is num) {
      return this.toDouble();
    }
    if (this is String) {
      return double.tryParse(this);
    }
    return null;
  }

  int? maybeInt() {
    if (this is num) {
      return this.toInt();
    }

    if (this is String) {
      final integer = int.tryParse(this);

      if (integer == null) {
        return double.tryParse(this)?.toInt();
      }
      return integer;
    }

    if (this is bool) {
      if (this) {
        return 1;
      } else {
        return 0;
      }
    }

    return null;
  }
}
