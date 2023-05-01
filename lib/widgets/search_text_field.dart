
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(children: [Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(prefixIcon: Icon(Icons.search),suffixIcon:IconButton(
          onPressed: controller.clear,
          icon: const Icon(Icons.clear),
        ), ),
        keyboardType: TextInputType.text,
      ),
    )],);
  }
}
