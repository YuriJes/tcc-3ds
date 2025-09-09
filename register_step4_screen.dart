import 'package:flutter/material.dart';

class RegisterStep4Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Permite voltar para a tela anterior
            Navigator.pop(context);
          },
        ),
        title: Text('Informações Profissionais'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Envie seu certificado ou documento profissional para que possamos validar sua atuação como cuidador',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 24),
            Text('Formação'),
            DropdownButtonFormField(
              items: ['Enfermagem', 'Fisioterapia', 'Cuidador de Idosos']
                  .map((value) => DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      ))
                  .toList(),
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Selecione Sua Formação',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text('Número De Registro Profissional'),
            TextFormField(
              decoration: InputDecoration(
                hintText: '(Se Houver)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Envie um arquivo em PDF, JPEG e PNG com no máximo 10MB',
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: Text('Selecionar Arquivo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Expanded(
                  child: Text(
                    'Declaro que as informações fornecidas são verdadeiras e que estou apto para exercer a função de cuidador',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Lógica para enviar os dados e finalizar o cadastro
                // Por exemplo, você pode voltar para a tela inicial
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Enviar'),
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