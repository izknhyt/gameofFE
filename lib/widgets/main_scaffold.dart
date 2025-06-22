import 'package:flutter/material.dart';

import 'tile_palette_widget.dart';
import 'unit_palette_widget.dart';
import 'map_canvas_widget.dart';
import 'inspector_widget.dart';

/// Overall layout for the editor screen.
class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stage Editor')),
      body: Column(
        children: const [
          Expanded(
            child: Row(
              children: [
                SizedBox(width: 200, child: TilePaletteWidget()),
                Expanded(child: MapCanvasWidget()),
                SizedBox(width: 200, child: UnitPaletteWidget()),
              ],
            ),
          ),
          SizedBox(height: 120, child: InspectorWidget()),
        ],
      ),
    );
  }
}
