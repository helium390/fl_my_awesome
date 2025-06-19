// Equivalent Dart implementation of the Kotlin utility functions
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:crypto/crypto.dart';

class StringUtils {
  static bool isValidEmail(String email) {
    const ePattern =
        "r'^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@([a-zA-Z0-9-]+.)+[a-zA-Z]{2,}\$'";
    return RegExp(ePattern).hasMatch(email);
  }

  static bool isValidPassword(String password) {
    const ePattern =
        r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*~`()_+=\[{\]};:<>|./?,-])[A-Za-z\d!@#\$%^&*~`()_+=\[{\]};:<>|./?,-]{8,}\$';
    return RegExp(ePattern).hasMatch(password);
  }

  static int pxIntoDp(int px) {
    return (px *
            WidgetsBinding
                .instance.platformDispatcher.views.first.devicePixelRatio)
        .toInt();
  }

  static String sha(String text) {
    const String hexChars = "0123456789ABCDEF";
    final List<int> bytes = sha256.convert(utf8.encode(text)).bytes;
    final StringBuffer result = StringBuffer();

    for (var byte in bytes) {
      result.write(hexChars[(byte >> 4) & 0x0f]);
      result.write(hexChars[byte & 0x0f]);
    }

    return result.toString();
  }

  static String getSha(List<String> strings) {
    final allString = StringBuffer();

    for (var string in strings) {
      allString.write(string);
    }

    print('TAG: ${allString.toString()}');
    return sha(allString.toString());
  }

  static String getShaString(String text) {
    var bytes = utf8.encode(text); // Convert string to bytes
    var hash = sha256.convert(bytes); // Compute SHA-256 hash

    String shaString = hash.toString(); // Convert hash to string
    return shaString;
  }

  static String? toCamelCase(String? input) {
    if (input == null || input.isEmpty) return null;
    const delimiters = " '-/";
    final buffer = StringBuffer();
    var capitalizeNext = true;

    for (final char in input.split('')) {
      if (capitalizeNext) {
        buffer.write(char.toUpperCase());
      } else {
        buffer.write(char.toLowerCase());
      }
      capitalizeNext = delimiters.contains(char);
    }
    return buffer.toString();
  }

  static String parseDate(String dateString) {
    final format = DateFormat("MM/dd/yyyy hh:mm:ss a");
    try {
      final date = format.parse(dateString);
      return DateFormat("dd MMM, yyyy").format(date);
    } catch (e) {
      print("Error parsing date: \$e");
      return dateString;
    }
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static bool isValidAlphaNumeric(String s) {
    const ePattern = r'^[a-zA-Z0-9 ]*\$';
    return RegExp(ePattern).hasMatch(s);
  }

  static double convertToDouble(String? str) {
    try {
      return double.parse(str?.replaceAll(',', '') ?? '0');
    } catch (e) {
      print("Error converting to double: \$e");
      return 0.0;
    }
  }

  // static void setMargins(EdgeInsets margin, Widget child) {
  //   return Padding(padding: margin, child: child);
  // }

  static bool isAppInstalled(String packageName) {
    // Note: Requires platform channels for accurate implementation on Flutter
    // Placeholder implementation
    return false;
  }

  static bool isNetworkConnected() {
    // Requires connectivity_plus package for network checks
    return true; // Placeholder for actual connectivity logic
  }

  static String? getCurrencySymbol(String currencyISO) {
    try {
      final format = NumberFormat.simpleCurrency(name: currencyISO);
      return format.currencySymbol;
    } catch (e) {
      print("Error fetching currency symbol: \$e");
      return currencyISO;
    }
  }

  static void checkNetworkConnection(BuildContext context) {
    if (!isNetworkConnected()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("No Connection!"),
          content: const Text("Please check your internet connection."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close"),
            )
          ],
        ),
      );
    }
  }
}
