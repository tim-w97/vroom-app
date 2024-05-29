import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/rides/ride_vm.dart';

class DraggableScrollableNavSheet extends StatefulWidget {
  //final RideVM vm;
  const DraggableScrollableNavSheet({super.key, /*required this.vm*/});

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
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                  /*Consumer<RideVM>(
                    builder: (context, vm, child) {
                      return*/ const Flexible(
                          child: Center(
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Start"),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "End"),
                            ),
                          ],
                        ),
                      )/*);
                    },*/
                  )
                ],
              ),
            ),
          ),);
        },);
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
    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Container(
        width: double.infinity,
        color: Colors.black12,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 64.0,
            height: 8,
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
