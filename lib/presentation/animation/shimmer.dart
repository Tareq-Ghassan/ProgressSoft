import 'package:flutter/material.dart';

/// [Shimmer] this is a Custom Widget to draw Shimmer Gradient
///
/// ex:
/// ```dart
/// Scaffold(
///   body: Shimmer(
///   linearGradient: shimmerGradient,
///   child: Center(
///     Text(Tareq),
///    ),
///  ),
/// );
/// ```
/// see also
///
/// [linearGradient] is the Gradient Shimmer
///
/// [child]
class Shimmer extends StatefulWidget {
  /// Create a [Shimmer] widget
  const Shimmer({
    required this.linearGradient,
    super.key,
    this.child,
  });

  /// [of] holds state
  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  /// [linearGradient] is the Gradient Shimmer
  final LinearGradient linearGradient;

  /// [child] property
  final Widget? child;

  @override
  ShimmerState createState() => ShimmerState();
}

///[ShimmerState] class to hold Shimmer State
class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  ///[gradient] holds gradient colors
  LinearGradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        transform:
            _SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  /// [isSized]
  bool get isSized {
    if (context.findRenderObject() == null) {
      return false;
    }
    return (context.findRenderObject()! as RenderBox).hasSize;
  }

  /// [size] a size getter
  Size get size => (context.findRenderObject()! as RenderBox).size;

  ///[getDescendantOffset] a function to get Descendant offest
  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject()! as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  /// [shimmerChanges] listen to changes
  Listenable get shimmerChanges => _shimmerController;

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0, 0);
  }
}

/// [ShimmerLoading] this is a Custom Widget to do Shimmer loading effect
///
/// ex:
/// ```dart
/// Scaffold(
///   body: Shimmer(
///   isLoading: true,
///   child: Center(
///     Text(Tareq),
///    ),
///  ),
/// );
/// ```
/// see also
///
/// * [isLoading] flag to turn loading on and off
///
/// * [child] the child that will be loadded
///
class ShimmerLoading extends StatefulWidget {
  /// Creates a [ShimmerLoading]
  const ShimmerLoading({
    required this.isLoading,
    required this.child,
    super.key,
  });

  /// * [isLoading] flag to turn loading on and off
  final bool isLoading;

  /// * [child] the child that will be loadded
  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // update the shimmer painting.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    // Collect ancestor shimmer info.
    final shimmer = Shimmer.of(context)!;
    if (!shimmer.isSized) {
      // The ancestor Shimmer widget has not laid
      // itself out yet. Return an empty box.
      return const SizedBox();
    }
    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;
    var offsetWithinShimmer = Offset.zero;
    if (context.findRenderObject() != null) {
      final box = context.findRenderObject()! as RenderBox;
      offsetWithinShimmer = shimmer.getDescendantOffset(
        descendant: box,
      );
    }

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}
