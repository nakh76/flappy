
// import 'package:flutter/material.dart';
//
// import 'home.dart';
//
// void main() {
//   runApp(
//       const MyGame()
//   );
// }
//
// class MyGame extends StatefulWidget {
//   const MyGame({Key? key}) : super(key: key);
//
//   @override
//   State<MyGame> createState() => _MyGameState();
// }
//
// class _MyGameState extends State<MyGame> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//     );
//   }
// }


import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';

void main() {
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}

class MyGame extends FlameGame {
  late Sprite player;

  @override
  Future<void> onLoad() async {
    add(Background());
    add(Bird());

    return super.onLoad();
  }
}

class Background extends SpriteComponent with HasGameRef {
  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load('bg.png');
    size = gameRef.size;

    return super.onLoad();
  }
}

class Bird extends SpriteAnimationComponent with HasGameRef {
  Bird() : super(priority: 1); // <-- This is what changed

  final double _animationSpeed = 0.15;
  late final SpriteAnimation _runDownAnimation;
  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _runUpAnimation;
  late final SpriteAnimation _runRightAnimation;
  late final SpriteAnimation _standingAnimation;

  @override
  Future<void>? onLoad() async {
    // sprite = await Sprite.load('bird.png');
    // size = Vector2(100, 100);
    // position = Vector2(200, 200);

    _loadAnimations().then((_) => {animation = _standingAnimation});

    return super.onLoad();
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('bird.png'),
      srcSize: Vector2(29.0, 32.0),
    );

    // TODO down animation

    // TODO left animation

    // TODO up animation

    // TODO right animation

    // TODO standing animation
  }


}

