import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/firestore_service.dart';
import 'package:couldai_user_app/screens/add_appointment_screen.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  final DataService _dataService = DataService();

  @override
  Widget build(BuildContext context) {
    final appointments = _dataService.getAppointments();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
      ),
      body: appointments.isEmpty
          ? const Center(child: Text('Nenhuma consulta agendada.'))
          : ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                final patient = _dataService.getPatientById(appointment['patientId']);
                return ListTile(
                  title: Text('Consulta com ${patient?['name'] ?? 'Paciente Desconhecido'}'),
                  subtitle: Text('${appointment['date'].toString().split(' ')[0]} - ${appointment['notes']}'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddAppointmentScreen()),
          );
          if (result == true) setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
