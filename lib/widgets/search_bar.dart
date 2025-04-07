import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback? onScanPressed;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onChanged,
    this.onScanPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Color(0xFFF1F3FE),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: const InputDecoration(
                hintText: "Search for products or stores",
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFF1F3FE),
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: onScanPressed,
            child: Icon(Icons.qr_code_scanner,color: Colors.grey[600],),
          ),
        ),
      ],
    );
  }
}