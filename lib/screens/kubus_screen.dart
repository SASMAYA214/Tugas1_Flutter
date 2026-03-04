import 'package:flutter/material.dart';
import '../widgets/calculator_builder.dart';

class KubusScreen extends StatefulWidget {
  @override
  _KubusScreenState createState() => _KubusScreenState();
}

class _KubusScreenState extends State<KubusScreen> {
  final TextEditingController _sController = TextEditingController();
  double? _result;

  void _calculate() {
    final s = double.tryParse(_sController.text);
    if (s != null) {
      setState(() => _result = s * s * s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildCalculatorScreen(
      context: context,
      title: 'Kubus',
      formula: 'V = s³',
      gradientColors: [Color(0xFFFF6EB4), Color(0xFFCC2277)],
      glowColor: Color(0xFFFF6EB4),
      icon: Icons.crop_square_rounded,
      fields: [
        buildField(_sController, 'Sisi (s)', 'Panjang sisi kubus'),
      ],
      result: _result,
      unit: 'satuan³',
      onCalc: _calculate,
    );
  }
}