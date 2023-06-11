import 'package:flutter/material.dart';
import 'package:gluon_flutter_tech_test/resources/dimens.dart';

class CommonWidgets {
  /// Returns a vertical spacer with a height of [height].
  static Widget verticalSpacer({double height = Dimens.unit8}) =>
      SizedBox(height: height);
}
