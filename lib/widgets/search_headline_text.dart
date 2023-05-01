
import 'package:flutter/material.dart';

class SearchHeadlineText extends StatelessWidget {
  const SearchHeadlineText({required this.headerText, super.key});

  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        5,
        5,
        5,
        5,
      ),
      child: Text(
        headerText,
       style: TextStyle(fontSize: 8)
        //       color: AppColors.secondary,
        //     ),
      ),
    );
  }
}
