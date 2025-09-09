import 'package:flutter/material.dart';

class AdicionarPacienteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Adicionar Paciente'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Aqui você pode adicionar os campos de formulário para o novo paciente
            Text('Formulário de adição de paciente', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            // Exemplo de campo de texto
            TextField(
              decoration: InputDecoration(
                labelText: "Nome Completo",
                border: OutlineInputBorder(),
              ),
            ),
            // Adicione mais campos conforme necessário
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text('Adicionar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}