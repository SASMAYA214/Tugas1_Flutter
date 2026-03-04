import 'package:flutter/material.dart';
import '../widgets/calculator_builder.dart';

class KubusScreen extends StatefulWidget {
  const KubusScreen({super.key});

  @override
  State<KubusScreen> createState() => _KubusScreenState();
}

class _KubusScreenState extends State<KubusScreen> {
  final TextEditingController _sController = TextEditingController();
  double _result = 0.0;

  void _calculate() {
    final s = double.tryParse(_sController.text);
    if (s != null) {
      setState(() {
        _result = s * s * s;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildCalculatorScreen(
      context: context,
      title: 'Kubus',
      formula: 'V = s³',
      gradientColors: const [Color(0xFFFF6EB4), Color(0xFFCC2277)],
      glowColor: const Color(0xFFFF6EB4),
      icon: Icons.crop_square_rounded,
      fields: [
        buildField(_sController, 'Sisi (s)', 'Masukkan panjang sisi'),
      ],
      result: _result,
      unit: 'cm³',
      onCalc: _calculate,
    );
  }
}