import 'package:flutter/material.dart';

/// A grid whose cells can be re-ordered with long-press drag.
class ReorderGrid extends StatelessWidget {
  final int count;
  final int columns;
  final double aspect;
  final Widget Function(BuildContext, int) itemBuilder;
  final void Function(int from, int to) onReorder;
  final EdgeInsets padding;

  const ReorderGrid({
    super.key,
    required this.count,
    required this.itemBuilder,
    required this.onReorder,
    this.columns = 3,
    this.aspect = 0.72,
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GridView.builder(
      padding: padding,
      itemCount: count,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        childAspectRatio: aspect,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, i) => DragTarget<int>(
        onWillAcceptWithDetails: (d) => d.data != i,
        onAcceptWithDetails: (d) => onReorder(d.data, i),
        builder: (context, candidates, _) {
          final child = itemBuilder(context, i);
          return LongPressDraggable<int>(
            data: i,
            feedback: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(width: 110, height: 110 / aspect, child: child),
            ),
            childWhenDragging: Opacity(opacity: 0.25, child: child),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: candidates.isNotEmpty
                    ? Border.all(color: cs.primary, width: 3)
                    : null,
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
