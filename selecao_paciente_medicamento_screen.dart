import 'package:flutter/material.dart';
import 'confirmar_agendamento_screen.dart'; // Você precisará criar a tela de confirmação para medicamentos

class SelecaoPacienteMedicamentoScreen extends StatelessWidget {
  final String data;
  final String hora;

  SelecaoPacienteMedicamentoScreen({required this.data, required this.hora});

  final List<Map<String, String>> pacientes = [
    {'nome': 'Henrique Bueno', 'idade': '56 anos', 'avatar': 'https://i.pravatar.cc/150?img=1'},
    {'nome': 'Pedro Bossa', 'idade': '89 anos', 'avatar': 'https://i.pravatar.cc/150?img=2'},
    {'nome': 'Caio Divo', 'idade': '47 anos', 'avatar': 'https://i.pravatar.cc/150?img=3'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Sintomas'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Pra qual paciente e esse medicamento?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar pacientes',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pacientes.length,
              itemBuilder: (context, index) {
                final paciente = pacientes[index];
                return _buildPacienteCard(context, paciente['nome']!, paciente['idade']!, paciente['avatar']!, data, hora);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPacienteCard(BuildContext context, String nome, String idade, String avatarUrl, String data, String hora) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    idade,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmarAgendamentoScreen(
                      data: data,
                      hora: hora,
                      paciente: nome,
                    ),
                  ),
                );
              },
              child: Text('Selecionar'),
            ),
          ],
        ),
      ),
    );
  }
}