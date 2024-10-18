import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hola",
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              'Bienvenido',
              style: TextStyle(
                fontSize: 25.0,
                color: Color(0xFF888888),
              ),
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage('assets/logo_dos.png'), // Imagen de fondo
          backgroundColor:
              Colors.transparent, // Para eliminar cualquier color de fondo
        ),
      ],
    );
  }
}
