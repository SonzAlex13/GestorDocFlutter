import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'formulario_screen.dart'; // Importamos la pantalla del formulario
import 'pdf_generator.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // La app ahora inicia en el formulario
      home: FormularioScreen(), 
    );
  }
}

// Nueva pantalla que requiere datos para construir el PDF
class PantallaReporteDinamico extends StatelessWidget {
  final String cliente;
  final String fecha;

  const PantallaReporteDinamico({
    Key? key,
    required this.cliente,
    required this.fecha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsualización de Reporte'),
      ),
      body: PdfPreview(
        // Llamamos a la función pasando los parámetros dinámicos
        build: (format) => generarReportePDF(cliente, fecha),
      ),
    );
  }
}