import 'package:flame/components.dart';
import 'package:flame/effects.dart';

class LoaderComponent extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    // Aquí puedes cargar un sprite o hacer una animación
    sprite = await Sprite.load('rabbit.png'); // Carga un sprite de carga
    size = Vector2.all(200); // Tamaño del loader
  }

  @override
  void onMount() {
    super.onMount();

    // Aquí es seguro acceder a gameRef, ya que el componente está montado
    position = Vector2.zero() - (size / 2); // Posición del loader
  }

  Future<void> removeLoader() async {
    // Transición de salida: hace desaparecer el loader
    add(OpacityEffect.to(0.0, EffectController(duration: 0.5)));
    await Future.delayed(
        const Duration(milliseconds: 500)); // Espera a que termine la animación
    removeFromParent(); // Elimina el loader
  }
}
