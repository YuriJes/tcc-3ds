import 'package:flutter/material.dart';

import 'confirmar_agendamento_tarefa_screen.dart';
import 'agendar_tarefa_screen.dart';
import 'pacientes_screen.dart' hide PacientesScreen;
import 'meu_perfil_screen.dart';
import 'conversas_screen.dart' hide ConversasScreen;
import 'agendar_consultas_screen.dart' hide AgendarConsultasScreen;

class SelecionarPacienteTarefaScreen extends StatelessWidget {
  final DateTime date;
  final String time;

  const SelecionarPacienteTarefaScreen({
    Key? key,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pra qual paciente é essa tarefa?'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AgendarTarefaScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar pacientes',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 16),
              _buildPatientCard(
                context,
                'Henrique Bueno',
                '56 anos',
                'assets/henrique_bueno.png', // Substitua pelo caminho real da imagem
                date,
                time,
              ),
              _buildPatientCard(
                context,
                'Pedro Bossa',
                '89 anos',
                'assets/pedro_bossa.png', // Substitua pelo caminho real da imagem
                date,
                time,
              ),
              _buildPatientCard(
                context,
                'Caio Diva',
                '47 anos',
                'assets/caio_diva.png', // Substitua pelo caminho real da imagem
                date,
                time,
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
              onPressed: () {},
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

  Widget _buildPatientCard(BuildContext context, String name, String age, String imagePath, DateTime date, String time) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    age,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmarAgendamentoTarefaScreen(
                      patientName: name,
                      taskDescription: 'Caminhada de manhã',
                      taskReason: 'Henrique não se exercita',
                      date: date,
                      time: time,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5AB6C3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Selecionar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
