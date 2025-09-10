import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shimmer/shimmer.dart';

class UserItemShimmer extends StatelessWidget {
  const UserItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      color: ColorsApp.gray.withAlpha(60),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar shimmer
            _shimmerBox(
              width: 60,
              height: 60,
              borderRadius: BorderRadius.circular(30),
            ),
            const SizedBox(width: 10),
            // Text shimmer
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 18,
                  ),
                  const SizedBox(height: 6),
                  _shimmerBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 14,
                  ),
                  const SizedBox(height: 6),
                  _shimmerBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _shimmerBox({
    required double width,
    required double height,
    BorderRadius? borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: ColorsApp.gray.withAlpha(50),
      highlightColor: Colors.white24,
      period: const Duration(milliseconds: 1500),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: borderRadius ?? BorderRadius.circular(6),
        ),
      ),
    );
  }
}
