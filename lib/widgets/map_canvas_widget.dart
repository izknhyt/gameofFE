import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/stage.dart';
import '../providers/map_data_provider.dart';
import '../providers/selected_tile_provider.dart';
import '../providers/tile_palette_provider.dart';

/// Canvas that displays the map grid and handles tile updates.
class MapCanvasWidget extends ConsumerWidget {
  const MapCanvasWidget({super.key});

  Color _terrainColor(String terrain) {
    switch (terrain) {
      case 'plain':
        return Colors.green;
      case 'forest':
        return Colors.greenAccent;
      case 'mountain':
        return Colors.brown;
      case 'river':
        return Colors.blue;
      case 'fort':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapData = ref.watch(mapDataProvider);
    final selectedTerrain = ref.watch(selectedTerrainProvider);
    final selectedTile = ref.watch(selectedTileProvider);
    final notifier = ref.read(mapDataProvider.notifier);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: stageWidth,
      ),
      itemCount: stageWidth * stageHeight,
      itemBuilder: (context, index) {
        final x = index % stageWidth;
        final y = index ~/ stageWidth;
        final tile = mapData[y][x];
        final isSelected = selectedTile != null &&
            selectedTile.$1 == x &&
            selectedTile.$2 == y;
        return GestureDetector(
          onTap: () {
            notifier.updateTile(x, y, selectedTerrain);
            ref.read(selectedTileProvider.notifier).state = (x: x, y: y);
          },
          child: Container(
            margin: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: _terrainColor(tile.terrain),
              border: isSelected
                  ? Border.all(color: Colors.yellow, width: 2)
                  : Border.all(color: Colors.black12),
            ),
          ),
        );
      },
    );
  }
}
