import 'package:flutter/material.dart';
import 'notificacao_confirmacao_screen.dart'; // Importa a próxima tela

class ConfirmarAgendamentoScreen extends StatelessWidget {
  final String paciente;
  final String data;
  final String hora;

  const ConfirmarAgendamentoScreen({
    Key? key,
    required this.paciente,
    required this.data,
    required this.hora,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Confirmação de agendamento',
          style: TextStyle(color: Colors.blue, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cadastro',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Você cadastrou uma consulta para',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '$paciente',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '$data, às $hora',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Ação para alterar data ou horário
                Navigator.pop(context);
              },
              child: Text(
                'Alterar data ou horário',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Motivo da consulta',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'O que você está sentindo ou precisa? Por exemplo:\n"Estou muito ansioso e com dificuldade para dormir"',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Ação para confirmar o agendamento
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificacaoConfirmacaoScreen(
                        paciente: paciente,
                        data: data,
                        hora: hora,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Confirmar agendamento',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home, color: Colors.blue), onPressed: () {}),
            IconButton(icon: Icon(Icons.message_outlined, color: Colors.grey), onPressed: () {}),
            SizedBox(width: 48),
            IconButton(icon: Icon(Icons.person_outline, color: Colors.grey), onPressed: () {}),
            IconButton(icon: Icon(Icons.calendar_today_outlined, color: Colors.grey), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue.shade500,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}