import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hostess_digital/Apis/Tiket.dart';
import 'package:hostess_digital/Components/DetailEvent.dart';
import 'package:hostess_digital/Components/Events.dart';
import 'package:hostess_digital/Components/Header.dart';
import 'package:hostess_digital/HomeTiket.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String qrCode = 'Unknown';
  dynamic selectedEvent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 24, bottom: 0, left: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderHome(),
              SizedBox(height: 50),
              SizedBox(
                height: 200,
                child: EventCarousel(
                  onEventSelected: (eventDetails) {
                    setState(() {
                      selectedEvent = eventDetails;
                    });
                  },
                ),
              ),
              EventDetails(event: selectedEvent),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scanQRCode();
        },
        backgroundColor: const Color.fromARGB(128, 127, 134, 238),
        child: const Icon(
          Icons.qr_code,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

Future<void> scanQRCode() async {
    final qrCode = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'CANCEL',
      true,
      ScanMode.QR,
    );

    if (!mounted) return;

    setState(() {
      this.qrCode = qrCode;
    });

    final tiketService = TiketService();
    final response = await tiketService.create(qrCode);

    if (response != null && response is Map<String, dynamic> && !response.containsKey('error')) {
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeTiket(),
        ),
      );
    } else {
      String errorMessage;

      if (response is Map<String, dynamic> && response.containsKey('error')) {
        errorMessage = response['error'];
      } 
      else if (response is String) {
        errorMessage = response;
      } 
      else {
        errorMessage = 'Error desconocido al validar el ticket';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          backgroundColor: const Color.fromARGB(128, 238, 127, 127),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cancel, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}