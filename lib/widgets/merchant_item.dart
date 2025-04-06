import 'package:flutter/material.dart';

class MerchantItem extends StatelessWidget {
  final String name;

  const MerchantItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(name),
      backgroundColor: Colors.white,
      elevation: 1,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
