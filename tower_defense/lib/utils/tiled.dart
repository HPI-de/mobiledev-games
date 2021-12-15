import 'dart:ui';

import 'package:tiled/tiled.dart';

extension FancyTileMap on TileMap {
  ObjectGroup getObjectGroup(String name) =>
      objectGroups.singleWhere((g) => g.name == name);
}

extension FancyObjectGroup on ObjectGroup {
  TmxObject getObject(String name) =>
      tmxObjects.singleWhere((g) => g.name == name);
}

extension FancyTmxObject on TmxObject {
  Offset get offset => Offset(x.toDouble(), y.toDouble());
}
