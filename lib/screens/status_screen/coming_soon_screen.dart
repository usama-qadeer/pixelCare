import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Lottie.asset("assets/images/animation/coming_soon.json")],
      ),
    );
  }
}
