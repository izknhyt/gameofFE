import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/map_data_provider.dart';
import '../providers/selected_tile_provider.dart';

/// Displays information about the currently selected tile.
class InspectorWidget extends ConsumerWidget {
  const InspectorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedTileProvider);
    final mapData = ref.watch(mapDataProvider);

    if (selected == null) {
      return const Center(child: Text('No tile selected'));
    }

    final tile = mapData[selected.$2][selected.$1];
    return Center(
      child: Text('(${selected.$1}, ${selected.$2}): ${tile.terrain}'),
    );
  }
}
