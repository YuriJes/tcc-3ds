import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdicionarNovoPacienteScreen extends StatefulWidget {
  @override
  _AdicionarNovoPacienteScreenState createState() => _AdicionarNovoPacienteScreenState();
}

class _AdicionarNovoPacienteScreenState extends State<AdicionarNovoPacienteScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _codigoGerado = '';

  void _gerarCodigoDeAcesso() {
    // Lógica simples para gerar um código de acesso.
    // Em um aplicativo real, isso seria gerado por um backend.
    final String nome = _nomeController.text.substring(0, 3).toUpperCase();
    final String codigo = '1234';
    setState(() {
      _codigoGerado = '$nome-$codigo';
    });
  }

  void _copiarCodigo() {
    if (_codigoGerado.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: _codigoGerado)).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Código copiado para a área de transferência!')),
        );
      });
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

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
        title: Text('Adicionar Novo Paciente'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text('Nome Do Paciente', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.lightBlue.shade50,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 15),
            Text('E-Mail Paciente', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.lightBlue.shade50,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _gerarCodigoDeAcesso,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text('Gerar Código De Acesso'),
            ),
            SizedBox(height: 20),
            Text('Código Gerado:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _codigoGerado.isNotEmpty ? _codigoGerado : 'PAC-0000',
                      style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: _copiarCodigo,
                  child: Text('Copiar'),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}