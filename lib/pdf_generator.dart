import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';

// 1. La función ahora recibe parámetros dinámicos
Future<Uint8List> generarReportePDF(String cliente, String fecha) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Reporte de Actividad', 
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(),
            pw.SizedBox(height: 10),
            // 2. Usar las variables inyectadas en lugar de texto fijo
            pw.Text('Cliente: $cliente', style: const pw.TextStyle(fontSize: 14)),
            pw.Text('Fecha: $fecha', style: const pw.TextStyle(fontSize: 14)),
            pw.SizedBox(height: 20),
            pw.TableHelper.fromTextArray(
              context: context,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
              data: <List<String>>[
                <String>['Artículo', 'Cantidad', 'Estado'],
                <String>['Laptops', '5', 'Buen estado'],
                <String>['Monitores', '2', 'Requiere revisión'],
                <String>['Cables de red', '10', 'Nuevo'],
              ],
            ),
            pw.Spacer(),
            pw.Center(
              child: pw.Text(
                'Firma del responsable',
                style: const pw.TextStyle(color: PdfColors.grey),
              ),
            ),
          ],
        );
      },
    ),
  );

  return pdf.save();
}