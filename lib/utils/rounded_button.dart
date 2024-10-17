import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color.fromARGB(255, 149, 0, 255), // Color de fondo del botón
        foregroundColor: Colors.white, // Color del texto
        minimumSize: const Size(300, 60), // Tamaño del botón (ancho, alto)
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
        ),
        elevation: 10, // Altura de la sombra
        shadowColor: const Color.fromARGB(255, 0, 0, 0), // Color de la sombra
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 30, // Tamaño del texto
          fontFamily: 'PixelifySans', // Fuente del texto
        ),
      ),
    );
  }
}
