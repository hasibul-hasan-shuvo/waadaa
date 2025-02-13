import 'package:flutter/material.dart';

class BlackLinearGradient extends StatelessWidget {
  const BlackLinearGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.black.withValues(alpha: 0.8),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
