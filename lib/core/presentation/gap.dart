import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double gap;

  const Gap({
    super.key,
    this.gap = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: gap,
      width: gap,
    );
  }
}
