
import 'package:flutter/material.dart';

class SearchFilterChip extends StatelessWidget {
  const SearchFilterChip({
    required this.chipText,
    required this.onSelected,
    super.key,
  });

  final ValueSetter<String> onSelected;

  final String chipText;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        chipText,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      onSelected: (_) => onSelected(chipText),
      shape: RoundedRectangleBorder(
        side: const BorderSide(),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
