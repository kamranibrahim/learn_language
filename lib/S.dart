

import 'package:c_s/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:my_widgets/my_widgets.dart';

class S{
  static BoxDecoration buildGradient() {
    return pBoxDecoration(
      radius: 10,
      gradient: LinearGradient(
        colors: [
          Clr.colorSecondary,
          Clr.colorPrimary,
        ],
      ),
    );
  }
}