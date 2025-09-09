import 'package:flutter/material.dart';

class SenhaScreen extends StatelessWidget {
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
        title: Text('Configuração de Senhas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildPasswordField(
              label: 'Senha Antiga',
              hint: '**********',
            ),
            SizedBox(height: 20),
            _buildPasswordField(
              label: 'Nova Senha',
              hint: '**********',
            ),
            SizedBox(height: 20),
            _buildPasswordField(
              label: 'Confirmar Nova Senha',
              hint: '**********',
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Lógica para trocar a senha
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Trocar Senha'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          obscureText: true, // Para esconder a senha
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: Icon(Icons.remove_red_eye_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
