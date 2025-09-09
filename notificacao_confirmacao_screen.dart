import 'package:flutter/material.dart';

class NotificacaoConfirmacaoScreen extends StatelessWidget {
  final String paciente;
  final String data;
  final String hora;

  const NotificacaoConfirmacaoScreen({
    Key? key,
    required this.paciente,
    required this.data,
    required this.hora,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notificação de confirmação',
          style: TextStyle(color: Colors.blue, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Remove a seta de voltar
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, size: 60, color: Colors.blue),
            ),
            SizedBox(height: 24),
            Text(
              'Você agendou uma consulta com sucesso!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Você receberá uma notificação ao chegar próximo à data',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(height: 32),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      'Dr. Stone Gaze', // Nome do médico
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Cardiologista', // Especialidade
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.blue.shade500),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Data da consulta cadastrada',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '$data, às $hora',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst); // Retorna para a tela inicial
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Voltar à Tela Inicial',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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