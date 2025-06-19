import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: h.toDouble());

  SizedBox get pw => SizedBox(width: w.toDouble());
}

extension StringExt on String {
  String toThousandsSeparator() {
    double num = double.parse(this);
    var formatter = NumberFormat('#,###');
    return formatter.format(num);
  }
}
