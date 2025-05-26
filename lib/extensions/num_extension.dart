//

import 'dart:math' as math;

extension NumExtension on num {
  double toRadian() {
    return this * math.pi / 180;
  }
}
