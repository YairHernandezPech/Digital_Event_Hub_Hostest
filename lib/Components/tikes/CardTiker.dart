import 'package:flutter/material.dart';

class CardTiket extends StatelessWidget {
  final String horaIn;
  final String horafin;
  final String eventoNombre;
  final String ubicacion;
  final String description;
  final int eventoId;

  const CardTiket({
    Key? key,
    required this.eventoNombre,
    required this.eventoId, required this.horaIn, required this.horafin, required this.ubicacion, required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Encabezado: Escaneo Exitoso
          Container(
            width: double.infinity, // Ocupa todo el ancho disponible
            height: 200, // Puedes modificar esta altura
            padding: EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
              ),
              // borderRadius: BorderRadius.vertical(
              //   bottom: Radius.circular(20.0),
              // ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 50.0,
                ),
                SizedBox(height: 8.0),
                Text(
                  "¡Escaneo Exitoso!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16.0),

          // Contenedor de imagen
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        "VIP",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          // Título y descripción del evento
           Text(
            "$eventoNombre",
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '"$description"',
            style: TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.italic,
              color: Colors.grey[600],
            ),
          ),

          const SizedBox(height: 16.0),

          // Detalles del evento
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.blue),
                    SizedBox(width: 8.0),
                    Text("Fecha: 15 de Noviembre, 2024"),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.blue),
                    const SizedBox(width: 8.0),
                    Text("Hora: $horaIn - $horafin"),
                  ],
                ),
                const SizedBox(height: 8.0),
                 Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.blue),
                    const SizedBox(width: 8.0),
                    Text("Lugar: $ubicacion"),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Row(
                  children: [
                    Icon(Icons.music_note, color: Colors.blue),
                    SizedBox(width: 8.0),
                    Text("Categoria: Rock, Pop, Electrónica"),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Acción del botón
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              backgroundColor: Colors.blue,
            ),
            child: const Text(
              "Ver detalles completos",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
