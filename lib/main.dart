import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Volume Bangun Ruang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Georgia',
        scaffoldBackgroundColor: const Color(0xFF1A0A10),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A0A10),
              Color(0xFF2E0D1A),
              Color(0xFF1A0A14),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF6EB4), Color(0xFFCC3377)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF6EB4).withOpacity(0.4),
                            blurRadius: 16,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.view_in_ar_rounded, color: Colors.white, size: 22),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Aplikasi Volume',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          'Bangun Ruang',
                          style: TextStyle(
                            color: Color(0xFFFF6EB4),
                            fontSize: 13,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Subtitle
                const Text(
                  'Pilih bentuk\nyang ingin dihitung',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Kalkulator volume 3D interaktif',
                  style: TextStyle(
                    color: Color(0xFF9B6B7A),
                    fontSize: 15,
                    letterSpacing: 0.3,
                  ),
                ),

                const SizedBox(height: 40),

                // Cards
                ShapeCard(
                  title: 'Kubus',
                  subtitle: 'Hitung Volume Kubus',
                  formula: 'V = s³',
                  icon: Icons.crop_square_rounded,
                  gradientColors: [Color(0xFFFF6EB4), Color(0xFFCC2277)],
                  glowColor: Color(0xFFFF6EB4),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => KubusScreen()),
                  ),
                ),

                const SizedBox(height: 16),

                ShapeCard(
                  title: 'Tabung',
                  subtitle: 'Hitung Volume Tabung',
                  formula: 'V = πr²t',
                  icon: Icons.album_rounded,
                  gradientColors: [Color(0xFFFF9EC4), Color(0xFFE0558A)],
                  glowColor: Color(0xFFFF9EC4),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => TabungScreen()),
                  ),
                ),

                const SizedBox(height: 16),

                ShapeCard(
                  title: 'Bola',
                  subtitle: 'Hitung Volume Bola',
                  formula: 'V = ⁴⁄₃πr³',
                  icon: Icons.circle_rounded,
                  gradientColors: [Color(0xFFFF3D8A), Color(0xFFAA1155)],
                  glowColor: Color(0xFFFF3D8A),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => BolaScreen()),
                  ),
                ),

                const SizedBox(height: 40),

                // Info box
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.08)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline_rounded, color: Color(0xFF9B6B7A), size: 20),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Masukkan nilai dalam satuan yang sama untuk hasil yang akurat.',
                          style: TextStyle(color: Color(0xFF9B6B7A), fontSize: 13, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShapeCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String formula;
  final IconData icon;
  final List<Color> gradientColors;
  final Color glowColor;
  final VoidCallback onTap;

  const ShapeCard({
    required this.title,
    required this.subtitle,
    required this.formula,
    required this.icon,
    required this.gradientColors,
    required this.glowColor,
    required this.onTap,
  });

  @override
  State<ShapeCard> createState() => _ShapeCardState();
}

class _ShapeCardState extends State<ShapeCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(_pressed ? 0.1 : 0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: widget.glowColor.withOpacity(_pressed ? 0.6 : 0.15),
            width: 1,
          ),
          boxShadow: _pressed
              ? [
                  BoxShadow(
                    color: widget.glowColor.withOpacity(0.45),
                    blurRadius: 32,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: widget.gradientColors),
                borderRadius: BorderRadius.circular(16),
                boxShadow: _pressed
                    ? [
                        BoxShadow(
                          color: widget.glowColor.withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 1,
                        ),
                      ]
                    : [],
              ),
              child: Icon(widget.icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.subtitle,
                    style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: widget.glowColor.withOpacity(_pressed ? 0.25 : 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: widget.glowColor.withOpacity(_pressed ? 0.5 : 0.2)),
                  ),
                  child: Text(
                    widget.formula,
                    style: TextStyle(
                      color: widget.glowColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.white.withOpacity(0.3), size: 14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── KUBUS SCREEN ───────────────────────────────────────────────────────────

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
    return _buildCalculatorScreen(
      context: context,
      title: 'Kubus',
      formula: 'V = s³',
      gradientColors: [Color(0xFFFF6EB4), Color(0xFFCC2277)],
      glowColor: Color(0xFFFF6EB4),
      icon: Icons.crop_square_rounded,
      fields: [
        _buildField(_sController, 'Sisi (s)', 'Panjang sisi kubus'),
      ],
      result: _result,
      unit: 'satuan³',
      onCalc: _calculate,
    );
  }
}

// ─── TABUNG SCREEN ───────────────────────────────────────────────────────────

class TabungScreen extends StatefulWidget {
  @override
  _TabungScreenState createState() => _TabungScreenState();
}

class _TabungScreenState extends State<TabungScreen> {
  final TextEditingController _rController = TextEditingController();
  final TextEditingController _tController = TextEditingController();
  double? _result;

  void _calculate() {
    final r = double.tryParse(_rController.text);
    final t = double.tryParse(_tController.text);
    if (r != null && t != null) {
      setState(() => _result = pi * r * r * t);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildCalculatorScreen(
      context: context,
      title: 'Tabung',
      formula: 'V = πr²t',
      gradientColors: [Color(0xFFFF9EC4), Color(0xFFE0558A)],
      glowColor: Color(0xFFFF9EC4),
      icon: Icons.album_rounded,
      fields: [
        _buildField(_rController, 'Jari-jari (r)', 'Jari-jari alas tabung'),
        _buildField(_tController, 'Tinggi (t)', 'Tinggi tabung'),
      ],
      result: _result,
      unit: 'satuan³',
      onCalc: _calculate,
    );
  }
}

// ─── BOLA SCREEN ─────────────────────────────────────────────────────────────

class BolaScreen extends StatefulWidget {
  @override
  _BolaScreenState createState() => _BolaScreenState();
}

class _BolaScreenState extends State<BolaScreen> {
  final TextEditingController _rController = TextEditingController();
  double? _result;

  void _calculate() {
    final r = double.tryParse(_rController.text);
    if (r != null) {
      setState(() => _result = (4 / 3) * pi * r * r * r);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildCalculatorScreen(
      context: context,
      title: 'Bola',
      formula: 'V = ⁴⁄₃πr³',
      gradientColors: [Color(0xFFFF3D8A), Color(0xFFAA1155)],
      glowColor: Color(0xFFFF3D8A),
      icon: Icons.circle_rounded,
      fields: [
        _buildField(_rController, 'Jari-jari (r)', 'Jari-jari bola'),
      ],
      result: _result,
      unit: 'satuan³',
      onCalc: _calculate,
    );
  }
}

// ─── SHARED BUILDER ──────────────────────────────────────────────────────────

Widget _buildField(TextEditingController ctrl, String label, String hint) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600)),
      const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withOpacity(0.12)),
        ),
        child: TextField(
          controller: ctrl,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 14),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          ),
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}

Widget _buildCalculatorScreen({
  required BuildContext context,
  required String title,
  required String formula,
  required List<Color> gradientColors,
  required Color glowColor,
  required IconData icon,
  required List<Widget> fields,
  required double? result,
  required String unit,
  required VoidCallback onCalc,
}) {
  return Scaffold(
    backgroundColor: const Color(0xFF1A0A10),
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A0A10), Color(0xFF2E0D1A), Color(0xFF1A0A14)],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white70, size: 18),
                ),
              ),

              const SizedBox(height: 32),

              // Hero icon
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: gradientColors),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: glowColor.withOpacity(0.4),
                        blurRadius: 32,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.white, size: 48),
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: Text(
                  'Volume $title',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: glowColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: glowColor.withOpacity(0.3)),
                  ),
                  child: Text(
                    formula,
                    style: TextStyle(color: glowColor, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Input fields
              ...fields,

              // Calculate button
              GestureDetector(
                onTap: onCalc,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: gradientColors),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: glowColor.withOpacity(0.4),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Hitung Volume',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),

              // Result
              if (result != null) ...[
                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: glowColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: glowColor.withOpacity(0.25), width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: glowColor.withOpacity(0.1),
                        blurRadius: 24,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Hasil Volume',
                        style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13, letterSpacing: 1),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        result.toStringAsFixed(4),
                        style: TextStyle(
                          color: glowColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        unit,
                        style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    ),
  );
}