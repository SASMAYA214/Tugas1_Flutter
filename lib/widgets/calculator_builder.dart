import 'package:flutter/material.dart';

/// ==============================
/// INPUT FIELD
/// ==============================
Widget buildField(
  TextEditingController ctrl,
  String label,
  String hint,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.white.withOpacity(0.12),
          ),
        ),
        child: TextField(
          controller: ctrl,
          keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                TextStyle(color: Colors.white.withOpacity(0.3)),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16,
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}

/// ==============================
/// NUMBER FORMATTER (NO 0000)
/// ==============================
String formatNumber(double value) {
  return value
      .toStringAsFixed(4) // max 4 decimal
      .replaceAll(RegExp(r'0+$'), '') // hapus nol belakang
      .replaceAll(RegExp(r'\.$'), ''); // hapus titik jika kosong
}

/// ==============================
/// CALCULATOR SCREEN TEMPLATE
/// ==============================
Widget buildCalculatorScreen({
  required BuildContext context,
  required String title,
  required String formula,
  required List<Color> gradientColors,
  required Color glowColor,
  required IconData icon,
  required List<Widget> fields,
  required double? result, // ✅ FIX: sekarang nullable
  required String unit,
  required VoidCallback onCalc,
}) {
  return Scaffold(
    backgroundColor: const Color(0xFF1A0A10),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            /// BACK BUTTON
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white70,
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// ICON
            Icon(icon, color: glowColor, size: 70),
            const SizedBox(height: 16),

            /// TITLE
            Text(
              'Volume $title',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            /// FORMULA
            Text(
              formula,
              style: TextStyle(
                color: glowColor,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            /// INPUT FIELDS
            ...fields,

            /// BUTTON
            ElevatedButton(
              onPressed: onCalc,
              style: ElevatedButton.styleFrom(
                backgroundColor: glowColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
              ),
              child: const Text("Hitung Volume"),
            ),

            const SizedBox(height: 30),

            /// RESULT CARD
            if (result != null)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: glowColor),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Hasil Volume",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      formatNumber(result),
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: glowColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      unit,
                      style: const TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    ),
  );
}