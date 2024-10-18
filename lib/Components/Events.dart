import 'package:flutter/material.dart';
import 'package:hostess_digital/Apis/Events.dart';
import 'package:skeletonizer/skeletonizer.dart'; // Importa la librería skeletonizer

class EventCarousel extends StatefulWidget {
  final Function(dynamic) onEventSelected; // Nueva función callback

  EventCarousel({required this.onEventSelected});

  @override
  _EventCarouselState createState() => _EventCarouselState();
}

class _EventCarouselState extends State<EventCarousel> {
  List<dynamic> events = [];
  final EventService eventService = EventService();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchEventImages();
  }

  Future<void> fetchEventImages() async {
    final data = await eventService.getAll();
    setState(() {
      events = data;
      isLoading = false;
    });
  }

  void onImageTap(String idEvento) async {
    EventService eventService = EventService();
    final eventDetails = await eventService.getByID(idEvento);
    widget.onEventSelected(eventDetails); // Pasamos los detalles del evento
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: isLoading
          ? Skeletonizer(
              enabled: true,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onImageTap(events[index]['evento_id'].toString());
                        },
                        child: Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage(events[index]['imagen_url']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
