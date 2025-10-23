import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/patient_detail_screen.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes'),
      ),
      body: ListView.builder(
        itemCount: 10, // Exemplo
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Paciente ${index + 1}'),
            subtitle: const Text('Clique para ver detalhes'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PatientDetailScreen(),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicionar novo paciente
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
