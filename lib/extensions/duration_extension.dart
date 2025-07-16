//

extension DurationExtension on Duration {
  String asString() {
    String negativeSign = isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60).abs());
    return inHours > 0
        ? "$negativeSign${twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds"
        : "$negativeSign$twoDigitMinutes:$twoDigitSeconds";
  }

  String asStringNoSeconds() {
    String negativeSign = isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60).abs());
    return "$negativeSign${inHours.toString()}:$twoDigitMinutes";
  }
}
