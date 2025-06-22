import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides the list of available terrain types for the editor palette.
final tilePaletteProvider = Provider<List<String>>((ref) {
  return ['plain', 'forest', 'mountain', 'river', 'fort'];
});

/// Holds the currently selected terrain type from the palette.
final selectedTerrainProvider = StateProvider<String>((ref) => 'plain');
