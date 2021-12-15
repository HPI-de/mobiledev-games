import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/tiled_component.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:meta/meta.dart';
import 'package:tiled/tiled.dart' hide Image;

import '../utils.dart';
import '../utils/tiled.dart';
import 'enemy.dart';

@immutable
class Level {
  Level(this.data)
      : assert(data != null),
        component = PositionComponent() {}

  final LevelData data;
  final PositionComponent component;
}

@immutable
class LevelData {
  const LevelData._({
    @required this.component,
  }) : assert(component != null);

  static final values = [
    // FancyTiledComponent.create('1.tmx').then((c) => LevelData._(component: c)),
    LevelData._(component: TiledComponent('1.tmx')),
  ];

  static const _pathGroupName = 'path';
  static const _pathObjectName = 'path';
  static const _enemiesGroupName = 'enemies';

  final TiledComponent component;

  TileMap get map => component.map;
  List<Point> get path {
    final object =
        map.getObjectGroup(_pathGroupName).getObject(_pathObjectName);
    assert(object.isPolyline);
    return object.points;
  }

  Iterable<Enemy> createEnemies() sync* {
    for (final object in map.getObjectGroup(_enemiesGroupName).tmxObjects) {
      final enemy = Enemy.fromType(object.type);
      enemy.component.offset = object.offset;
      yield enemy;
    }
  }
}

extension on TiledComponent {
  void normalize() {
    // final tileSize =
  }
}

class FancyTiledComponent extends TiledComponent {
  FancyTiledComponent(String filename) : super(filename);

  static const tileDimension = 48.0;

  @override
  void render(Canvas c) {
    for (final layer in map.layers.where((l) => l.visible)) {
      _renderLayer(c, layer);
    }
  }

  void _renderLayer(Canvas c, Layer layer) {
    for (final tile in layer.tiles) {
      if (tile.gid == 0) {
        return;
      }

      final image = images[tile.image.source];

      final rect = tile.computeDrawRect();
      final src = Rect.fromLTWH(
        rect.left.toDouble(),
        rect.top.toDouble(),
        rect.width.toDouble(),
        rect.height.toDouble(),
      );
      final dst = Rect.fromLTWH(
        tile.x.toDouble() * tileDimension / rect.width,
        tile.y.toDouble() * tileDimension / rect.height,
        tileDimension,
        tileDimension,
      );

      c.drawImageRect(image, src, dst, TiledComponent.paint);
    }
  }
}

/* class FancyTiledComponent extends Component {
  FancyTiledComponent._({
    @required this.map,
    @required this.image,
    @required this.images,
  })  : assert(map != null),
        assert(image != null),
        assert(images != null);

  static Future<FancyTiledComponent> create(String fileName) async {
    final map = await _loadMap(fileName);
    assert(map.tileWidth == map.tileHeight);
    final dimension = map.tileWidth;
    // for (final tileset in map.tilesets) {
    //   tileset
    //     ..width ~/= dimension
    //     ..height ~/= dimension;
    // }
    for (final layer in map.layers) {
      for (final tile in layer.tiles) {
        tile
          ..width = 48
          ..height = 48;
      }
    }
    return FancyTiledComponent._(
      map: map,
      image: await Flame.images.load(map.tilesets[0].image.source),
      images: await _loadImages(map),
    );
  }

  static Future<TileMap> _loadMap(String fileName) async {
    final contents = await Flame.bundle.loadString('assets/tiles/$fileName');
    return TileMapParser().parse(contents);
  }

  static final paint = Paint()..color = Colors.white;

  final TileMap map;
  final Image image;
  final Map<String, Image> images;

  static Future<Map<String, Image>> _loadImages(TileMap map) async {
    final result = <String, Image>{};
    for (final tileset in map.tilesets) {
      for (final image in tileset.images) {
        result[image.source] = await Flame.images.load(image.source);
      }
    }
    return result;
  }

  @override
  void render(Canvas c) {
    for (final layer in map.layers.where((l) => l.visible)) {
      _renderLayer(c, layer);
    }
  }

  void _renderLayer(Canvas c, Layer layer) {
    for (final tile in layer.tiles) {
      if (tile.gid == 0) {
        return;
      }

      final image = images[tile.image.source];

      final rect = tile.computeDrawRect();
      final src = Rect.fromLTWH(rect.left.toDouble(), rect.top.toDouble(),
          rect.width.toDouble(), rect.height.toDouble());
      final dst = Rect.fromLTWH(tile.x.toDouble(), tile.y.toDouble(),
          rect.width.toDouble(), rect.height.toDouble());

      c.drawImageRect(image, src, dst, paint);
    }
  }

  @override
  void update(double t) {}
}
 */
