import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'pdf_generator.dart';
import 'main.dart';

class FormularioScreen extends StatefulWidget {
  const FormularioScreen({Key? key}) : super(key: key);

  @override
  State<FormularioScreen> createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Captura de Datos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'cliente',
                decoration: const InputDecoration(labelText: 'Nombre del Cliente'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              FormBuilderDateTimePicker(
                name: 'fecha',
                inputType: InputType.date,
                decoration: const InputDecoration(labelText: 'Fecha del Reporte'),
                initialValue: DateTime.now(),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    final formData = _formKey.currentState?.value;
                    final nombreCliente = formData?['cliente'] as String;
                    final fechaReporte = formData?['fecha'] as DateTime;
                    
                    final fechaTexto = "${fechaReporte.day}/${fechaReporte.month}/${fechaReporte.year}";

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PantallaReporteDinamico(
                          cliente: nombreCliente,
                          fecha: fechaTexto,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Generar PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}