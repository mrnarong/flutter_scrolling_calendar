import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/utils/screen_sizes.dart';

/// Modified: 2021-07-01
/// By: Narong Chanthapho
/// - Add BE year option

class YearTitle extends StatelessWidget {
  const YearTitle(
    this.year,
    this.yearEpochal,
  );

  final int year;
  final String yearEpochal;

  @override
  Widget build(BuildContext context) {
    return Text(
      (year+(yearEpochal == 'BE' ? 543 : 0)).toString(),
      style: TextStyle(
        fontSize: screenSize(context) == ScreenSizes.small ? 22.0 : 26.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
