import 'package:intl/intl.dart';

/// Utility class for date/time formatting
class DateFormatter {
  /// Formats current time as: 2025-12-04 15:21:21.706+05
  static String getFormattedTime() {
    final now = DateTime.now();
    // Format the main part
    final baseFormat = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(now);

    // Get timezone offset (e.g., 5.0)
    final offset = now.timeZoneOffset.inHours;
    // Format offset to "+05" or "-05"
    final offsetString = offset >= 0 ? "+${offset.toString().padLeft(2, '0')}" : "-${offset.abs().toString().padLeft(2, '0')}";

    return "$baseFormat$offsetString";
  }

  /// Formats current time as HH:mm:ss for notifications
  static String getTimeOnly() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }
}
