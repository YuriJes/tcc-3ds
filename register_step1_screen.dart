import 'package:flutter/material.dart';
import 'register_step2_screen.dart'; // Importe a próxima tela

class RegisterStep1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue.shade100,
                child: Icon(Icons.person, size: 60, color: Colors.blue.shade700),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Bem-Vindo!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Digite os seus dados de acesso corretamente nos campos abaixo',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email ou Telefone',
                hintText: 'julia@email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                suffixIcon: Icon(Icons.visibility_off),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirmar Senha',
                suffixIcon: Icon(Icons.visibility_off),
                border: OutlineInputBorder(),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navega para a próxima tela do fluxo de cadastro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterStep2Screen()),
                );
              },
              child: Text('Próximo'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}