import 'package:flutter/material.dart';

const Color _customColor = Color(0XFF49149F);
const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.pink,
  Colors.teal,
  Colors.orange,
  Colors.green,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor > 0 && selectedColor < _colorTheme.length,
            'Color indice debe ser entre 0 y ${_colorTheme.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorTheme[selectedColor]);
  }
}
