import 'package:flutter/material.dart';
import 'package:shared/utils/colors_app.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final int currentIndex;
  final ValueChanged<int>? onTabChanged;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.currentIndex,
    this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(tabs.length, (index) {
        final isSelected = index == currentIndex;
        return GestureDetector(
          onTap: () {
            if (onTabChanged != null) {
              onTabChanged!(index);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isSelected ? ColorsApp.blue : Colors.transparent,
                  width: 3,
                ),
              ),
            ),
            child: Text(
              tabs[index],
              style: TextStyle(
                color: isSelected ? ColorsApp.blue : ColorsApp.gray,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      }),
    );
  }
}
