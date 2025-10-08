import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  const TopCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    // Find max count for scaling
    int maxCount = categories.map((c) => c['count'] as int).reduce((a, b) => a > b ? a : b);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Top Categories by Product Count",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // Build category rows
        ...categories.map((category) {
          double progress = (category['count'] as int) / maxCount;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    category['name'],
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[300],
                    color: Colors.purple,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(width: 8),
                Text("${category['count']}"),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
