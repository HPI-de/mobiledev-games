import 'package:flame/game.dart';
import 'package:flame/components/component.dart';

extension AddAll on BaseGame {
  void addAll(List<Component> components) => components.forEach(add);
}
