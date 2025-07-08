import 'package:flutter/material.dart';

class PaginationSpinner extends StatelessWidget {
  const PaginationSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
