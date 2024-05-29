import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FlutterMap(
          options: const MapOptions(initialCenter: LatLng(50.31, 11.91)),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              // Plenty of other options available!
            )
          ],
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 30, 0, 0),
            child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => const MapView()),
                  );
                },
                child: const Icon(Icons.arrow_back)),
          ),
        ),
        DraggableScrollableSheet(
            builder: (BuildContext context, ScrollController scrollController) {
          return const DraggableScrollableNavSheet(); //TODO Insert form here
        })
      ],
    );
  }
}

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
          return ColoredBox(
              color: Colors.black12.withOpacity(0.3),
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
            width: 32.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
