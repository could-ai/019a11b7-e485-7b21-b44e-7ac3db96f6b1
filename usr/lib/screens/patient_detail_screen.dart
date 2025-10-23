import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/firestore_service.dart';

class PatientDetailScreen extends StatefulWidget {
  final String patientId;

  const PatientDetailScreen({super.key, required this.patientId});

  @override
  _PatientDetailScreenState createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {
  final DataService _dataService = DataService();
  late Map<String, dynamic> _patient;
  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _patient = _dataService.getPatientById(widget.patientId)!;
    _notesController.text = _patient['notes'];
  }

  void _saveNotes() {
    _dataService.updatePatientNotes(_patient['id'], _notesController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Anotações salvas!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes de ${_patient['name']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nome: ${_patient['name']}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Email: ${_patient['email']}'),
            const SizedBox(height: 20),
            const Text('Anotações, Informações e Evoluções:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Expanded(
              child: TextField(
                controller: _notesController,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Adicione anotações, informações ou evoluções aqui...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveNotes,
              child: const Text('Salvar Anotações'),
            ),
          ],
        ),
      ),
    );
  }
}