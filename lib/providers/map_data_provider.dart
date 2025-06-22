import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/map_tile.dart';
import '../models/stage.dart';

/// [MapDataNotifier] manages a grid of [MapTile]s for the map editor.
class MapDataNotifier extends StateNotifier<List<List<MapTile>>> {
  MapDataNotifier()
      : super(List.generate(
          stageHeight,
          (_) => List.generate(
            stageWidth,
            (_) => MapTile(terrain: 'plain'),
          ),
        ));

  /// Load map data from a JSON file at [path].
  Future<void> loadStage(String path) async {
    final file = File(path);
    if (!await file.exists()) return;
    final content = await file.readAsString();
    final data = jsonDecode(content) as List<dynamic>;
    final grid = data
        .map((row) => (row as List)
            .map((tile) => MapTile.fromJson(tile as Map<String, dynamic>))
            .toList())
        .toList();
    state = grid.cast<List<MapTile>>();
  }

  /// Save the current map data to a JSON file at [path].
  Future<void> saveStage(String path) async {
    final file = File(path);
    final data = jsonEncode(
      state.map((row) => row.map((t) => t.toJson()).toList()).toList(),
    );
    await file.writeAsString(data);
  }

  /// Update the tile at coordinates ([x], [y]) to the given [terrain].
  void updateTile(int x, int y, String terrain) {
    if (y < 0 || y >= state.length) return;
    if (x < 0 || x >= state[y].length) return;
    state[y][x] = MapTile(terrain: terrain);
    state = [for (final row in state) [...row]];
  }
}

/// Provider exposing the [MapDataNotifier].
final mapDataProvider =
    StateNotifierProvider<MapDataNotifier, List<List<MapTile>>>(
        (ref) => MapDataNotifier());
