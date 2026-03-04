import 'package:flutter/material.dart';
import '../widgets/shape_card.dart';
import 'kubus_screen.dart';
import 'tabung_screen.dart';
import 'bola_screen.dart';

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

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.08)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline_rounded, color: Color(0xFF9B6B7A), size: 20),
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