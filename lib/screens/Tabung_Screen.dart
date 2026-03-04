import 'package:flutter/material.dart';
import 'dart:math';
import '../widgets/calculator_builder.dart';

class TabungScreen extends StatefulWidget {
  const TabungScreen({super.key});

  @override
  State<TabungScreen> createState() => _TabungScreenState();
}

class _TabungScreenState extends State<TabungScreen> {
  final TextEditingController _rController = TextEditingController();
  final TextEditingController _tController = TextEditingController();
  double _result = 0.0;

  void _calculate() {
    final r = double.tryParse(_rController.text);
    final t = double.tryParse(_tController.text);

    if (r != null && t != null) {
      setState(() {
        _result = pi * r * r * t;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildCalculatorScreen(
      context: context,
      title: 'Tabung',
      formula: 'V = πr²t',
      gradientColors: const [Color(0xFFFF9EC4), Color(0xFFE0558A)],
      glowColor: const Color(0xFFFF9EC4),
      icon: Icons.album_rounded,
      fields: [
        buildField(_rController, 'Jari-jari (r)', 'Masukkan jari-jari'),
        buildField(_tController, 'Tinggi (t)', 'Masukkan tinggi'),
      ],
      result: _result,
      unit: 'cm³',
      onCalc: _calculate,
    );
  }
}