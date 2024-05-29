import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'ScrollableNavSheetWidget.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            return const DraggableScrollableNavSheet();
          })
        ],
      ),
    );
  }
}

