import 'package:flutter/material.dart';
import 'package:hostess_digital/Apis/Events.dart';
import 'package:hostess_digital/Components/Home.dart';
import 'package:intl/intl.dart';

class CardTiket extends StatefulWidget {
  final int eventoId;
  final String horaIn;
  final String horafin;
  final String eventoNombre;
  final String ubicacion;
  final String description;
  final String fechaInicio;
  final String fechaTermino;
  final String code;
  final int tipoEvento;

  const CardTiket({
    Key? key,
    required this.eventoNombre,
    required this.eventoId,
    required this.horaIn,
    required this.horafin,
    required this.ubicacion,
    required this.description,
    required this.fechaInicio,
    required this.fechaTermino,
    required this.code,
    required this.tipoEvento,
  }) : super(key: key);

  @override
  _CardTiketState createState() => _CardTiketState();
}

class _CardTiketState extends State<CardTiket> {
  String? imagenUrl;
  String? tipo_Event;
  String? fecha_inicio;
  String? fecha_termino;
  bool isLoading = true;

  // Instancia del servicio para obtener el evento
  final EventService eventService = EventService();

  // Función para obtener el evento por su ID desde la API
  Future<void> fetchEvent() async {
    try {
      final data = await eventService.getByID(widget.eventoId.toString());
      if (data != null) {
        setState(() {
          imagenUrl = data['imagen_url'];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error fetching event by ID: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> validarEtipovent() async {
    try {
      fecha_inicio =
          DateFormat('dd-MM-yyyy').format(DateTime.parse(widget.fechaInicio));
      fecha_termino =
          DateFormat('dd-MM-yyyy').format(DateTime.parse(widget.fechaTermino));

      if (widget.tipoEvento == 1) {
        tipo_Event = "Publico";
      } else {
        tipo_Event = "Privado";
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEvent(); // Llama a la API cuando el widget se inicializa
    validarEtipovent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(
              child:
                  CircularProgressIndicator()) // Muestra un indicador de carga mientras espera la respuesta
          : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0), // Ajusta el valor según sea necesario
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Encabezado: Escaneo Exitoso
                    Container(
                      width: double.infinity, // Ocupa todo el ancho disponible
                      height: 200, // Puedes modificar esta altura
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Centrar verticalmente
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
              
                    const SizedBox(height: 16.0),
              
                    // Contenedor de imagen
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        width: double.infinity,
                        height: 230,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Stack(
                          children: [
                            // Muestra la imagen si la URL no es nula, si no, muestra un icono de imagen
                            Center(
                              child: imagenUrl != null
                                  ? Image.network(
                                      imagenUrl!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Icon(
                                          Icons.broken_image,
                                          size: 50,
                                          color: Colors.grey,
                                        );
                                      },
                                    )
                                  : const Icon(
                                      Icons.image,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                            ),
                            Positioned(
                              top: 8.0,
                              right: 8.0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  "$tipo_Event",
                                  style: const TextStyle(
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
                      widget.eventoNombre,
                      style: const TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '"${widget.description}"',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                    ),
              
                    const SizedBox(height: 16.0),
              
                    // Detalles del evento
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_today, color: Colors.blue),
                              SizedBox(width: 8.0),
                              Text("Fecha: $fecha_inicio - $fecha_termino"),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              const Icon(Icons.access_time, color: Colors.blue),
                              const SizedBox(width: 8.0),
                              Text("Hora: ${widget.horaIn} - ${widget.horafin}"),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.blue),
                              const SizedBox(width: 8.0),
                              Text("Lugar: ${widget.ubicacion}"),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              const Icon(Icons.confirmation_number,
                                  color: Colors.blue),
                              const SizedBox(width: 8.0),
                              Text("Tiket: ${widget.code}"),
                            ],
                          ),
                        ],
                      ),
                    ),
              
                    const SizedBox(height: 150),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "Volver",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ),
    );
  }
}
