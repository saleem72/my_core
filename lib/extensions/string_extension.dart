//

extension StringSpecific on String {
  String onlyDigits() {
    final aStr = replaceAll(RegExp(r'[^0-9.]'), '');
    return aStr.trim();
  }

  String onlyCurrency() {
    final aStr = replaceAll(RegExp(r'[0-9.]'), '');
    return aStr.trim();
  }

  bool isValidCurrency() {
    final str = onlyCurrency();
    final number = double.tryParse(str);
    return number != null;
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
