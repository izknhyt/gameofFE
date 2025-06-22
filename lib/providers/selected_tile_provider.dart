import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Holds the currently selected tile coordinates on the map canvas.
/// `null` means no tile is selected.
final selectedTileProvider = StateProvider<(int x, int y)?>(
  (ref) => null,
);
