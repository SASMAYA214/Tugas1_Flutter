import 'package:flutter/material.dart';

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
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: widget.glowColor.withOpacity(_pressed ? 0.25 : 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: widget.glowColor.withOpacity(_pressed ? 0.5 : 0.2),
                    ),
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
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white.withOpacity(0.3),
                  size: 14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}