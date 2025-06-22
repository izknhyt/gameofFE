import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/tile_palette_provider.dart';

/// Palette for selecting terrain types.
class TilePaletteWidget extends ConsumerWidget {
  const TilePaletteWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final terrains = ref.watch(tilePaletteProvider);
    final selected = ref.watch(selectedTerrainProvider);
    return ListView(
      children: [
        for (final t in terrains)
          ListTile(
            title: Text(t),
            selected: t == selected,
            onTap: () =>
                ref.read(selectedTerrainProvider.notifier).state = t,
          ),
      ],
    );
  }
}
