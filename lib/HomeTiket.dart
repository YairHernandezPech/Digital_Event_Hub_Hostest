import 'package:flutter/material.dart';
import 'package:hostess_digital/Components/TiketCard.dart';
import 'package:hostess_digital/Home.dart';

class HomeTiket extends StatefulWidget {

  @override
  State<HomeTiket> createState() => _HomeTiketState();
}

class _HomeTiketState extends State<HomeTiket> {
  String qrCode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const Home()), // Navega a la lista de eventos
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 24, bottom: 0, left: 24),
        child: SingleChildScrollView(
          // Envolvemos el Column
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Aquí van todos los componentes del Home
              const SizedBox(
                height: 50,
              ),
              TicketCard(),
              //Detailtiket(),
            ],
          ),
        ),
      ),
    );
  }
}
