// home_cuidador_screen.dart
import 'package:flutter/material.dart';
import 'consultas_screen.dart';
import 'medicamentos_screen.dart';
import 'emergencias_screen.dart';
import 'tarefas_screen.dart';
import 'sentimentos_screen.dart';
import 'pacientes_screen.dart';
import 'meu_perfil_screen.dart';
import 'conversas_screen.dart';
import 'agendar_consultas_screen.dart' hide ConsultasScreen;
import 'registros_diarios_screen.dart';
import 'agendar_medicamento_screen.dart';
import 'agendar_tarefa_screen.dart' hide AgendarConsultasScreen, PacientesScreen, ConversasScreen, MeuPerfilScreen;
import 'notifications_screen.dart'; // Adicione esta linha

class HomeCuidadorScreen extends StatefulWidget {
  @override
  _HomeCuidadorScreenState createState() => _HomeCuidadorScreenState();
}

class _HomeCuidadorScreenState extends State<HomeCuidadorScreen> {
  bool _showOptions = false;

  void _toggleOptions() {
    setState(() {
      _showOptions = !_showOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFB3E5FC),
                Color(0xFF81D4FA),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MeuPerfilScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        // CORREÇÃO: Usamos backgroundImage para exibir a imagem,
                        // pois é a forma correta para o CircleAvatar.
                        backgroundImage: AssetImage('assets/carolina.png'),
                        radius: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Bem-vinda, Carolina',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.notifications_none, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotificationsScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                _buildInfoCard(
                  context: context,
                  icon: Icons.access_time,
                  title: 'Consultas Hoje',
                  subtitle: '2 Agendadas',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConsultasScreen()),
                    );
                  },
                ),
                _buildInfoCard(
                  context: context,
                  icon: Icons.medical_services_outlined,
                  title: 'Medicamentos a administrar',
                  subtitle: '2 Horários',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MedicamentosScreen()),
                    );
                  },
                ),
                _buildInfoCard(
                  context: context,
                  icon: Icons.warning_amber_outlined,
                  title: 'Emergências recentes',
                  subtitle: '1 Alerta hoje',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmergenciasScreen()),
                    );
                  },
                ),
                _buildInfoCard(
                  context: context,
                  icon: Icons.task_alt,
                  title: 'Tarefas Pendentes',
                  subtitle: '2 Tarefas',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TarefasScreen()),
                    );
                  },
                ),
                _buildInfoCard(
                  context: context,
                  icon: Icons.sick_outlined,
                  title: 'Sentimentos Paciente',
                  subtitle: '2 sintomas hoje',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SentimentosScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildAnimatedFloatingButton(
                  icon: Icons.medication_outlined,
                  isVisible: _showOptions,
                  offset: 10,
                  onPressed: () {
                    _toggleOptions();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AgendarMedicamentoScreen()),
                    );
                  },
                ),
                _buildAnimatedFloatingButton(
                  icon: Icons.task_alt,
                  isVisible: _showOptions,
                  offset: 00.0,
                  onPressed: () {
                    _toggleOptions();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AgendarTarefaScreen()),
                    );
                  },
                ),
                _buildAnimatedFloatingButton(
                  icon: Icons.calendar_today_outlined,
                  isVisible: _showOptions,
                  offset: 0.0,
                  onPressed: () {
                    _toggleOptions();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AgendarConsultasScreen()),
                    );
                  },
                ),
                _buildAnimatedFloatingButton(
                  icon: Icons.sticky_note_2_outlined,
                  isVisible: _showOptions,
                  offset: 00.0,
                  onPressed: () {
                    _toggleOptions();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrosDiariosScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleOptions,
        child: Icon(_showOptions ? Icons.close : Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
    );
  }

  Widget _buildInfoCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.blue.shade700),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(subtitle),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedFloatingButton({
    required IconData icon,
    required bool isVisible,
    required double offset,
    required VoidCallback onPressed,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transform: Matrix4.translationValues(0.0, isVisible ? -offset : 0.0, 0.0),
      child: AnimatedOpacity(
        opacity: isVisible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
        child: FloatingActionButton(
          mini: true,
          heroTag: null,
          onPressed: isVisible ? onPressed : null,
          child: Icon(icon),
        ),
      ),
    );
  }
}
