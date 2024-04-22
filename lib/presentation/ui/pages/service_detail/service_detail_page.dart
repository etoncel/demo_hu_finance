import 'package:flutter/material.dart';

class ServiceDetailPage extends StatelessWidget {
  const ServiceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Servicios"),
        actions: [
          IconButton(
              key: const Key("goBackArrowKey"),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: const Center(
        child: Text("Servicio"),
      ),
    );
  }
}
