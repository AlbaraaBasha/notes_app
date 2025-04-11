import 'package:flutter/material.dart';

class CostumSearchIcon extends StatelessWidget {
  const CostumSearchIcon({super.key, required this.icon, this.onTap});
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withValues(alpha: 0.1),
        ),
        child: Center(child: Icon(icon, size: 24)),
      ),
    );
  }
}
