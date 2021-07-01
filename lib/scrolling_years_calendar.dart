library scrolling_years_calendar;

import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/utils/screen_sizes.dart';
import 'package:scrolling_years_calendar/year_view.dart';

class ScrollingYearsCalendar extends StatefulWidget {
  ScrollingYearsCalendar({
    @required this.context,
    @required this.initialDate,
    @required this.firstDate,
    @required this.lastDate,
    @required this.currentDateColor,
    this.highlightedDates,
    this.highlightedDateColor,
    this.monthNames,
    this.onMonthTap,
    this.monthTitleStyle,
    this.isLongMonthName=true,
    this.lang='en',
    this.yearEpochal='CE',
  })  : assert(context != null),
        assert(initialDate != null),
        assert(firstDate != null),
        assert(lastDate != null),
        assert(!initialDate.isBefore(firstDate),
            'initialDate must be on or after firstDate'),
        assert(!initialDate.isAfter(lastDate),
            'initialDate must be on or before lastDate'),
        assert(!firstDate.isAfter(lastDate),
            'lastDate must be on or after firstDate'),
        assert(currentDateColor != null),
        assert(highlightedDates == null || highlightedDateColor != null,
            'highlightedDateColor is required if highlightedDates is not null'),
        assert(
            monthNames == null || monthNames.length == DateTime.monthsPerYear,
            'monthNames must contain all months of the year'),
        assert(
          lang.toLowerCase() == 'th' || lang.toLowerCase() == 'en',
            'unsupported year epochal'),
        assert(
          yearEpochal.toUpperCase() == 'BE' || yearEpochal.toUpperCase() == 'CE',
            'unsupported year epochal');

  final BuildContext context;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Color currentDateColor;
  final List<DateTime> highlightedDates;
  final Color highlightedDateColor;
  final List<String> monthNames;
  final Function onMonthTap;
  final TextStyle monthTitleStyle;
  final String lang;
  final bool isLongMonthName;
  final String yearEpochal;

  @override
  _ScrollingYearsCalendarState createState() => _ScrollingYearsCalendarState();
}

/// Modified: 2021-07-01
/// By: Narong Chanthapho
/// - Add new options:
///     -> lang: 'th', 'en' - default: 'en'
///     -> isLongMonthName: display month in short (false) or long name (true) - default: true
///     -> yearEpochal: display year in 'BE' or 'CE' - default: 'CE'

class _ScrollingYearsCalendarState extends State<ScrollingYearsCalendar> {
  /// Gets a widget with the view of the given year.
  YearView _getYearView(int year) {
    return YearView(
      context: context,
      year: year,
      currentDateColor: widget.currentDateColor,
      highlightedDates: widget.highlightedDates,
      highlightedDateColor: widget.highlightedDateColor,
      monthNames: widget.monthNames,
      onMonthTap: widget.onMonthTap,
      monthTitleStyle: widget.monthTitleStyle,
      lang: widget.lang,
      isLongMonthName: widget.isLongMonthName,
      yearEpochal: widget.yearEpochal,
    );
  }

  @override
  Widget build(BuildContext context) {
    final int _itemCount = widget.lastDate.year - widget.firstDate.year + 1;

    // Makes sure the right initial offset is calculated so the listview
    // jumps to the initial year.
    final double _initialOffset =
        (widget.initialDate.year - widget.firstDate.year) *
            getYearViewHeight(context);
    final ScrollController _scrollController =
        ScrollController(initialScrollOffset: _initialOffset);

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 16.0),
      controller: _scrollController,
      itemCount: _itemCount,
      itemBuilder: (BuildContext context, int index) {
        final int year = index + widget.firstDate.year;
        return _getYearView(year);
      },
    );
  }
}
