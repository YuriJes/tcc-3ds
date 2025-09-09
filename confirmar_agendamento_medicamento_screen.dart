import 'package:flutter/material.dart';

import 'pacientes_screen.dart';
import 'meu_perfil_screen.dart';
import 'conversas_screen.dart';
import 'agendar_consultas_screen.dart';
import 'agendar_medicamento_screen.dart';

class ConfirmarAgendamentoMedicamentoScreen extends StatelessWidget {
  final String patientName;
  final String medicationName;
  final String dosage;
  final DateTime date;
  final String time;

  const ConfirmarAgendamentoMedicamentoScreen({
    Key? key,
    required this.patientName,
    required this.medicationName,
    required this.dosage,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // As linhas de importação e formatação do DateFormat foram removidas.
    final timeWithoutSuffix = time.replaceAll(':00', '');

    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmação de agendamento'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cadastro',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5AB6C3),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Você cadastrou um medicamento para',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Text(
                patientName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                '${date.day}/${date.month}/${date.year}, às $timeWithoutSuffix:00',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AgendarMedicamentoScreen()),
                  );
                },
                child: Text(
                  'Alterar data ou horário',
                  style: TextStyle(color: Color(0xFF5AB6C3), decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(height: 24),
              _buildInfoField(
                'Nome Do Medicamento',
                medicationName,
              ),
              SizedBox(height: 16),
              _buildInfoField(
                'Dosagem',
                dosage,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Agendamento Confirmado!'),
                      content: Text('Sua medicação foi agendada com sucesso.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.popUntil(context, (route) => route.isFirst);
                          },
                          child: Text('Voltar para a Tela Inicial'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5AB6C3),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  'Confirmar agendamento',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.blue),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
            IconButton(
              icon: Icon(Icons.message_outlined, color: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConversasScreen()),
                );
              },
            ),
            SizedBox(width: 48),
            IconButton(
              icon: Icon(Icons.person_outline, color: Colors.grey),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PacientesScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.calendar_today_outlined, color: Colors.grey),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgendarConsultasScreen()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildInfoField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFE1F5FE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
