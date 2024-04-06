import 'package:flutter/material.dart';

class TCircularLoading extends StatelessWidget {
  const TCircularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
