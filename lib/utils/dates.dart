/// Checks if the given date is equal to the current date.
bool isCurrentDate(DateTime date) {
  final DateTime now = DateTime.now();
  return date.isAtSameMomentAs(DateTime(now.year, now.month, now.day));
}

/// Checks if the given date is a highlighted date.
bool isHighlightedDate(DateTime date, List<DateTime> highlightedDates) {
  return highlightedDates.any((DateTime highlightedDate) =>
      date.isAtSameMomentAs(DateTime(
          highlightedDate.year, highlightedDate.month, highlightedDate.day)));
}

/// Gets the number of days for the given month,
/// by taking the next month on day 0 and getting the number of days.
int getDaysInMonth(int year, int month) {
  return month < DateTime.monthsPerYear
      ? DateTime(year, month + 1, 0).day
      : DateTime(year + 1, 1, 0).day;
}

/// Gets the name of the given month by its number,
/// using either the supplied or default name.
/// Modified: 2021-07-01
/// By: Narong Chanthapho
/// - Add Thai month name
String getMonthName(int month, {String lang, bool isLongMonthName, List<String> monthNames}) {
  final Map<String, Map<String, List<String>>> months =  <String, Map<String, List<String>>>{
    'en': <String, List<String>>{
      'short': <String>[
        'Jan', 'Feb', 'Mar', 'Apr',
        'May', 'Jun', 'Jul', 'Aug',
        'Sep', 'Oct', 'Nov', 'Dec',
      ],
      'long': <String>[
        'January', 'February', 'March', 'April',
        'May', 'June', 'July', 'August',
        'September', 'October', 'November', 'December',
      ]
    },
    'th': <String, List<String>>{
      'short': <String>[
        'ม.ค.', 'ก.พ', 'มี.ค.', 'เม.ย.',
        'พ.ค.', 'มิ.ย.', 'ก.ค.', 'ส.ค.',
        'ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.',
      ],
      'long': <String>[
        'มกราคม', 'กุมภาพันธ์', 'มีนาคม', 'เมษายน',
        'พฤษภาคม', 'มิถุนายน', 'กรกฎาคม', 'สิงหาคม',
        'กันยายน', 'ตุลาคม', 'พฤศจิกายน', 'ธันวาคม',
      ]
    }

  };
  final List<String> names = monthNames ?? months[lang][isLongMonthName?'long':'short'];
  return names[month - 1];
}
