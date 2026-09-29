import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'pdf_generator.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PantallaReporte(),
    );
  }
}

class PantallaReporte extends StatelessWidget {
  const PantallaReporte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsualización de Reporte'),
      ),
      body: PdfPreview(
        build: (format) => generarReportePDF(),
      ),
    );
  }
}
