import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  final dynamic event; // El evento que será mostrado

  EventDetails({required this.event});

  @override
  Widget build(BuildContext context) {
    if (event == null) {
      return Center(child: Text('Selecciona un evento para ver los detalles'));
    }

    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del evento
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              event['imagen_url'],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  event['evento_nombre'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevenir texto largo
                  maxLines: 1, // Limitar a una sola línea
                ),
              ),
              SizedBox(width: 8), // Espacio entre el título y la fecha
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.grey, size: 16),
                  SizedBox(width: 4),
                  Text(
                    "${event['fecha_inicio'].substring(0, 10)} - ${event['fecha_termino'].substring(0, 10)}",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Descripción del evento
              Expanded(
                child: Text(
                  event['descripcion'] ?? "No hay descripción disponible",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
              const SizedBox(width: 16),

              // Información del lugar y horarios
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey, size: 16),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            event['ubicacion'] ?? "Ubicación no disponible",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                            overflow: TextOverflow.ellipsis, // Prevenir texto largo
                            maxLines: 1, // Limitar a una sola línea
                          ),
                        ),
                      ],
                    ),
                  ),
                        

                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.access_time, color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          "${event['horario_inicio_1']} - ${event['horario_fin_1']}",
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
