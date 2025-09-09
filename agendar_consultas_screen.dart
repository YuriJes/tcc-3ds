import 'package:flutter/material.dart';
import 'selecao_paciente_screen.dart';

class AgendarConsultasScreen extends StatefulWidget {
  @override
  _AgendarConsultasScreenState createState() => _AgendarConsultasScreenState();
}

class _AgendarConsultasScreenState extends State<AgendarConsultasScreen> {
  // A data e a hora selecionadas para o agendamento
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;

  @override
  Widget build(BuildContext context) {
    // Pega o mês e o ano da data selecionada para exibir no calendário
    final month = _selectedDate.month;
    final year = _selectedDate.year;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Marque o dia da sua consulta',
          style: TextStyle(color: Colors.blue, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildCalendar(month, year),
              SizedBox(height: 24),
              Text(
                'Adicione o Horário:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 16),
              _buildTimeGrid(),
              SizedBox(height: 80), // Espaço para o botão inferior
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: ElevatedButton(
                  // O botão só fica ativo se uma hora for selecionada
                  onPressed: _selectedTime != null
                      ? () {
                          // Navega para a próxima tela passando a data e hora selecionadas
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelecaoPacienteScreen(
                                data: '${_selectedDate.day} de ${_getMonthName(_selectedDate.month)}',
                                hora: _selectedTime!,
                              ),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedTime != null ? Colors.lightBlue[100] : Colors.grey[200],
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Próximo',
                    style: TextStyle(
                      color: _selectedTime != null ? Colors.blue : Colors.grey[600],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
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
                // TODO: Navegar para a tela de mensagens
              },
            ),
            SizedBox(width: 48), // Espaço para o FloatingActionButton
            IconButton(
              icon: Icon(Icons.person_outline, color: Colors.grey),
              onPressed: () {
                // TODO: Navegar para a tela de pacientes
              },
            ),
            IconButton(
              icon: Icon(Icons.calendar_today_outlined, color: Colors.grey),
              onPressed: () {
                // Já está nesta tela
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Ação do botão +
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue.shade500,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Constrói o widget do calendário
  Widget _buildCalendar(int month, int year) {
    final daysOfWeek = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'];

    final firstDayOfMonth = DateTime(year, month, 1);
    final lastDayOfMonth = DateTime(year, month + 1, 0);
    final daysInMonthCount = lastDayOfMonth.day;
    final leadingEmptyDays = firstDayOfMonth.weekday % 7;

    final daysInMonth = [
      ...List.generate(leadingEmptyDays, (_) => ''),
      ...List.generate(daysInMonthCount, (index) => (index + 1).toString()),
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
              onPressed: () {
                setState(() {
                  _selectedDate = DateTime(year, month - 1, 1);
                });
              },
            ),
            Text(
              '${_getMonthName(month)}\n$year',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onPressed: () {
                setState(() {
                  _selectedDate = DateTime(year, month + 1, 1);
                });
              },
            ),
          ],
        ),
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1.0,
          ),
          itemCount: daysOfWeek.length,
          itemBuilder: (context, index) {
            return Center(
              child: Text(
                daysOfWeek[index],
                style: TextStyle(color: Colors.blue),
              ),
            );
          },
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1.0,
          ),
          itemCount: daysInMonth.length,
          itemBuilder: (context, index) {
            final day = daysInMonth[index];
            final isCurrentMonthDay = day.isNotEmpty;
            final dayInt = isCurrentMonthDay ? int.parse(day) : -1;

            final isSelected = isCurrentMonthDay &&
                dayInt == _selectedDate.day &&
                month == _selectedDate.month &&
                year == _selectedDate.year;
            
            final DateTime currentDayDate = isCurrentMonthDay ? DateTime(year, month, dayInt) : DateTime.now().add(Duration(days: 9999));
            final bool isPastDate = currentDayDate.isBefore(DateTime.now().subtract(Duration(days: 1)));

            return GestureDetector(
              onTap: isCurrentMonthDay && !isPastDate
                  ? () {
                      setState(() {
                        _selectedDate = DateTime(year, month, dayInt);
                      });
                    }
                  : null,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.lightBlue[100] : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    day,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.blue
                          : (isPastDate
                              ? Colors.grey.shade400
                              : (isCurrentMonthDay ? Colors.black : Colors.transparent)),
                      fontWeight: isSelected || isCurrentMonthDay ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Constrói o widget da grade de horários
  Widget _buildTimeGrid() {
    final times = [
      '8:00', '9:00', '11:00', '12:00',
      '14:00', '15:00', '17:00', '18:00', '19:00'
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: times.length,
      itemBuilder: (context, index) {
        final time = times[index];
        final isSelected = _selectedTime == time;

        return OutlinedButton(
          onPressed: () {
            setState(() {
              _selectedTime = time;
            });
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: isSelected ? Colors.lightBlue[100] : Colors.white,
            side: BorderSide(
              color: isSelected ? Colors.transparent : Colors.blue.shade200!,
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            time,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.blue.shade300,
            ),
          ),
        );
      },
    );
  }

  // Retorna o nome do mês em português
  String _getMonthName(int month) {
    const months = [
      "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
      "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
    ];
    return months[month - 1];
  }
}
