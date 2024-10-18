import 'package:flutter/material.dart';

class Detailtiket extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del evento
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/evento1.jpg",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          
          // Título del evento (nombre del evento alineado a la izquierda)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Noche Mexicana",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.grey, size: 16),
                  SizedBox(width: 4),
                  Text(
                    "23/02/2024 - 24/05/2025",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Texto largo a la derecha
              Expanded(
                child: Text(
                  "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis molestias excepturi sint occaecati cupiditate non provident.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(width: 16), // Espacio entre el texto y la información

              // Información del lugar y horarios a la izquierda
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Lugar del evento
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey, size: 16),
                        SizedBox(width: 4),
                        Text(
                          "Gran Carpa Santa Fe",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.grey, size: 16),
                        SizedBox(width: 4),
                        Text(
                          "15:00:00 - 16:00:00",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
