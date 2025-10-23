import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/firestore_service.dart';
import 'package:couldai_user_app/screens/add_patient_screen.dart';
import 'package:couldai_user_app/screens/patient_detail_screen.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  final DataService _dataService = DataService();

  @override
  Widget build(BuildContext context) {
    final patients = _dataService.getPatients();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes'),
      ),
      body: patients.isEmpty
          ? const Center(child: Text('Nenhum paciente cadastrado.'))
          : ListView.builder(
              itemCount: patients.length,
              itemBuilder: (context, index) {
                final patient = patients[index];
                return ListTile(
                  title: Text(patient['name']),
                  subtitle: Text(patient['email']),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PatientDetailScreen(patientId: patient['id']),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddPatientScreen()),
          ).then((_) => setState(() {})); // Atualiza a lista após adicionar
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}