import 'package:flutter/material.dart';
import 'confirmacao_registro.dart';

class SinaisClinicosScreen extends StatefulWidget {
  @override
  _SinaisClinicosScreenState createState() => _SinaisClinicosScreenState();
}

class _SinaisClinicosScreenState extends State<SinaisClinicosScreen> {
  final TextEditingController _temperaturaController = TextEditingController();
  final TextEditingController _glicemiaController = TextEditingController();
  final TextEditingController _pressaoController = TextEditingController();
  final TextEditingController _outrasObservacoesController = TextEditingController();

  @override
  void dispose() {
    _temperaturaController.dispose();
    _glicemiaController.dispose();
    _pressaoController.dispose();
    _outrasObservacoesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: LinearProgressIndicator(
          value: 0.33, // Progresso para a primeira tela
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF62A7D2)),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfirmacaoScreen()),
              );
            },
            child: Text('Pular', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Henrique Bueno',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('56 anos', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sinais clínicos observados:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D3B51),
              ),
            ),
            SizedBox(height: 10),
            _buildInputField(
              controller: _temperaturaController,
              hintText: 'Temperatura corporal (C°)',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 10),
            _buildInputField(
              controller: _glicemiaController,
              hintText: 'Glicemia (mg/dL)',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 10),
            _buildInputField(
              controller: _pressaoController,
              hintText: 'Pressão (mmHg)',
              keyboardType: TextInputType.text, // Pode ser 120/80
            ),
            SizedBox(height: 20),
            Text(
              'Outras Observações detalhadas:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D3B51),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _outrasObservacoesController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Descreva...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConfirmacaoScreen()),
                  );
                },
                child: Text('Próximo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF62A7D2),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}