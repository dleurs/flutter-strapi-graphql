import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white.withOpacity(0.6),
      child: Center(
        child: Lottie.asset('assets/anims/gears-rotating.json', width: 90),
      ),
    );
  }
}
