import 'package:flutter/material.dart';

import 'confirmar_agendamento_medicamento_screen.dart';
import 'pacientes_screen.dart'; // Importa a tela de pacientes para navegação
import 'meu_perfil_screen.dart'; // Importa a tela do perfil para navegação
import 'conversas_screen.dart'; // Importa a tela de conversas para navegação
import 'agendar_consultas_screen.dart'; // Importa a tela de agendar consultas para navegação


class AgendarMedicamentoScreen extends StatefulWidget {
  @override
  _AgendarMedicamentoScreenState createState() => _AgendarMedicamentoScreenState();
}

class _AgendarMedicamentoScreenState extends State<AgendarMedicamentoScreen> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF5AB6C3), // Cor primária do seletor
              onPrimary: Colors.white, // Cor do texto
              onSurface: Colors.black, // Cor do texto na superfície
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _selectTime(String time) {
    setState(() {
      _selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda para marcar medicamento'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Marque a data do medicamento',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5AB6C3),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: Color(0xFF5AB6C3)),
                      SizedBox(width: 12),
                      Text(
                        'Data selecionada: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Adicione o Horário:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5AB6C3),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildTimeButton('8:00'),
                  _buildTimeButton('9:00'),
                  _buildTimeButton('11:00'),
                  _buildTimeButton('12:00'),
                  _buildTimeButton('14:00'),
                  _buildTimeButton('15:00'),
                  _buildTimeButton('17:00'),
                  _buildTimeButton('18:00'),
                  _buildTimeButton('19:00'),
                ],
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _selectedTime != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmarAgendamentoMedicamentoScreen(
                              patientName: 'Henrique Bueno', // Exemplo de nome de paciente
                              medicationName: 'Clonazepam', // Exemplo de nome do medicamento
                              dosage: '1 Mg', // Exemplo de dosagem
                              date: _selectedDate,
                              time: _selectedTime!,
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5AB6C3),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  'Próximo',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
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
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
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

  Widget _buildTimeButton(String time) {
    bool isSelected = _selectedTime == time;
    return ElevatedButton(
      onPressed: () => _selectTime(time),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color(0xFF5AB6C3) : Colors.white,
        side: BorderSide(
          color: isSelected ? Color(0xFF5AB6C3) : Colors.grey,
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: Text(
        time,
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
