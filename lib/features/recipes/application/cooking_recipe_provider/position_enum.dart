import 'package:mobile/features/recipes/application/cooking_recipe_provider/side_enum.dart';

enum Position {
  left,
  middle,
  right,
}

extension PositionOnSideExtension on Position {
  Position getPositionOnSide(Side side) {
    switch (this) {
      case Position.left:
        return side == Side.left ? Position.right : Position.middle;
      case Position.right:
        return side == Side.left ? Position.middle : Position.left;
      default:
        return side == Side.left ? Position.left : Position.right;
    }
  }
}

List<Position> getPositionsStartingFrom(Position? startingFrom) {
  return startingFrom == Position.middle
      ? [Position.middle, Position.right, Position.left]
      : startingFrom == Position.right
          ? [Position.right, Position.left, Position.middle]
          : [Position.left, Position.middle, Position.right];
}
