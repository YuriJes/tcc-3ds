import 'package:flutter/material.dart';
import 'confirmar_agendamento_screen.dart';

class SelecaoPacienteScreen extends StatelessWidget {
  final String data;
  final String hora;

  SelecaoPacienteScreen({required this.data, required this.hora});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleção de Paciente'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Data: $data'),
            Text('Hora: $hora'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final paciente = 'João da Silva';
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmarAgendamentoScreen(
                      data: data,
                      hora: hora,
                      paciente: paciente,
                    ),
                  ),
                );
              },
              child: Text('Selecionar Paciente e Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}