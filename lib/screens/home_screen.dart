import 'package:flutter/material.dart';
import '../widgets/shape_card.dart';
import 'kubus_screen.dart';
import 'tabung_screen.dart';
import 'bola_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

                /// HEADER
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFF6EB4),
                            Color(0xFFCC3377),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.view_in_ar_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aplikasi Volume',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
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

                /// TITLE
                const Text(
                  'Pilih bentuk\nyang ingin dihitung',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Kalkulator volume 3D interaktif',
                  style: TextStyle(
                    color: Color(0xFF9B6B7A),
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 40),

                /// KUBUS
                ShapeCard(
                  title: 'Kubus',
                  subtitle: 'Hitung Volume Kubus',
                  formula: 'V = s³',
                  icon: Icons.crop_square_rounded,
                  gradientColors: const [
                    Color(0xFFFF6EB4),
                    Color(0xFFCC2277),
                  ],
                  glowColor: const Color(0xFFFF6EB4),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const KubusScreen(),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// TABUNG
                ShapeCard(
                  title: 'Tabung',
                  subtitle: 'Hitung Volume Tabung',
                  formula: 'V = πr²t',
                  icon: Icons.album_rounded,
                  gradientColors: const [
                    Color(0xFFFF9EC4),
                    Color(0xFFE0558A),
                  ],
                  glowColor: const Color(0xFFFF9EC4),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TabungScreen(),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// BOLA
                ShapeCard(
                  title: 'Bola',
                  subtitle: 'Hitung Volume Bola',
                  formula: 'V = ⁴⁄₃πr³',
                  icon: Icons.circle_rounded,
                  gradientColors: const [
                    Color(0xFFFF3D8A),
                    Color(0xFFAA1155),
                  ],
                  glowColor: const Color(0xFFFF3D8A),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const BolaScreen(),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                /// INFO BOX
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: Color(0xFF9B6B7A),
                        size: 20,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Masukkan nilai dalam satuan yang sama untuk hasil yang akurat.',
                          style: TextStyle(
                            color: Color(0xFF9B6B7A),
                            fontSize: 13,
                            height: 1.5,
                          ),
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