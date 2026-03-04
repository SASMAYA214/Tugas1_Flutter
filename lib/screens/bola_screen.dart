import 'package:flutter/material.dart';
import 'dart:math';
import '../widgets/calculator_builder.dart';

class BolaScreen extends StatefulWidget {
  const BolaScreen({super.key});

  @override
  State<BolaScreen> createState() => _BolaScreenState();
}

class _BolaScreenState extends State<BolaScreen> {
  final TextEditingController _rController = TextEditingController();
  double _result = 0.0;

  void _calculate() {
    final r = double.tryParse(_rController.text);
    if (r != null) {
      setState(() {
        _result = (4 / 3) * pi * r * r * r;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildCalculatorScreen(
      context: context,
      title: 'Bola',
      formula: 'V = ⁴⁄₃πr³',
      gradientColors: const [Color(0xFFFF3D8A), Color(0xFFAA1155)],
      glowColor: const Color(0xFFFF3D8A),
      icon: Icons.circle_rounded,
      fields: [
        buildField(_rController, 'Jari-jari (r)', 'Masukkan jari-jari'),
      ],
      result: _result,
      unit: 'cm³',
      onCalc: _calculate,
    );
  }
}