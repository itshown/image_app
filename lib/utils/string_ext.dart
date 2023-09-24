import 'dart:ui';

extension StringExt on String {

  /// hexColor to Color
  Color get hexToColor {
    String hexColor;
    // Remove the leading '#' character if it exists
    hexColor = replaceAll('#', '');

    // Handle short hex color codes
    if (hexColor.length == 3) {
      hexColor = '${hexColor[0]}${hexColor[0]}${hexColor[1]}${hexColor[1]}${hexColor[2]}${hexColor[2]}';
    }

    // Parse the hexadecimal color code
    final int parsedColor = int.parse('0xFF$hexColor');

    // Create and return a Color object
    return Color(parsedColor);
  }

}