import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/stage.dart';
import '../models/tile.dart';
import '../models/unit.dart';

/// [StageNotifier] manages the current [Stage] state for the editor.
/// It exposes helper methods to update tiles or units within the stage.
class StageNotifier extends StateNotifier<Stage> {
  StageNotifier() : super(Stage.empty());

  /// Load an entirely new stage.
  void setStage(Stage newStage) {
    state = newStage;
  }

  /// Place or replace a tile at the given coordinates.
  void setTile(int x, int y, Tile tile) {
    if (y < 0 || y >= stageHeight || x < 0 || x >= stageWidth) return;
    state.tiles[y][x] = tile;
    // Reassign state to notify listeners of the change.
    state = Stage(tiles: state.tiles, units: state.units);
  }

  /// Remove a tile by resetting it to a plain tile.
  void removeTile(int x, int y) {
    setTile(x, y, Tile(terrainType: 'plain'));
  }

  /// Add a unit to the stage at the specified coordinates.
  void addUnit(Unit unit, int x, int y) {
    state.units.add(UnitPlacement(x: x, y: y, unit: unit));
    state = Stage(tiles: state.tiles, units: state.units);
  }

  /// Remove a unit located at the specified coordinates.
  void removeUnitAt(int x, int y) {
    state.units.removeWhere((u) => u.x == x && u.y == y);
    state = Stage(tiles: state.tiles, units: state.units);
  }

  /// Update properties of a unit at the given coordinates.
  void updateUnit(Unit updatedUnit, int x, int y) {
    for (final placement in state.units) {
      if (placement.x == x && placement.y == y) {
        placement.unit
          ..hp = updatedUnit.hp
          ..mobility = updatedUnit.mobility
          ..affinity = updatedUnit.affinity;
        break;
      }
    }
    state = Stage(tiles: state.tiles, units: state.units);
  }
}

/// Provider used to access the [StageNotifier].
final stageProvider =
    StateNotifierProvider<StageNotifier, Stage>((ref) => StageNotifier());
