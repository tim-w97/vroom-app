import 'dart:ui';

import 'package:flutter/material.dart';

class DraggableScrollableNavSheet extends StatefulWidget {
  const DraggableScrollableNavSheet({super.key});

  @override
  State<DraggableScrollableNavSheet> createState() =>
      _DraggableScrollableNavSheetState();
}

class _DraggableScrollableNavSheetState
    extends State<DraggableScrollableNavSheet> {
  double _sheetPosition = 0.5;
  final double _dragSensitivity = 600;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(

        initialChildSize: _sheetPosition,
        builder: (BuildContext context, ScrollController scrollController) {
          return ClipRect(
              child: ColoredBox(
                color: Colors.grey.shade900.withOpacity(0.75),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10
                  ),
                  child: Column(
                    children: [
                      Grabber(
                        onVerticalDragUpdate: (DragUpdateDetails details) {
                          setState(() {
                            _sheetPosition -= details.delta.dy / _dragSensitivity;
                            if (_sheetPosition < 0.25) {
                              _sheetPosition = 0.25;
                            }
                            if (_sheetPosition > 1.0) {
                              _sheetPosition = 1.0;
                            }
                          });
                        },
                      ),
                      const Flexible(
                          child: Center(
                            child: Column(
                              children: [
                                Text("Todo"),
                                Text("Todo")
                              ],),)
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}

class Grabber extends StatelessWidget {
  const Grabber({
    super.key,
    required this.onVerticalDragUpdate,
  });

  final ValueChanged<DragUpdateDetails> onVerticalDragUpdate;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Container(
        width: double.infinity,
        color: colorScheme.onSurface,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 64.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
