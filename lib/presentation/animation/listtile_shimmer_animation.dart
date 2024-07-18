import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/animation/shimmer.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/constants/size.dart';

///[ListTileShimmer] This is a shimmer widget represent [ListTile]
class ListTileShimmer extends StatelessWidget {
  ///[ListTileShimmer] constructor
  const ListTileShimmer({required this.isLoading, super.key});

  /// [isLoading] holds loading state
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Shimmer(
      linearGradient: shimmerGradient,
      child: ListTile(
        leading: ShimmerLoading(
          isLoading: isLoading,
          child: CircleAvatar(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: const Alignment(1, -0.01),
                  end: const Alignment(-1, 0.01),
                  colors: greyGradient,
                ),
              ),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ShimmerLoading(
                isLoading: isLoading,
                child: Container(
                  width: width * 0.5,
                  height: height * 0.03,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(1, -0.01),
                      end: const Alignment(-1, 0.01),
                      colors: greyGradient,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(pt8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: pt8),
              ShimmerLoading(
                isLoading: isLoading,
                child: Container(
                  width: width * 0.5,
                  height: height * 0.03,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(1, -0.01),
                      end: const Alignment(-1, 0.01),
                      colors: greyGradient,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(pt8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
