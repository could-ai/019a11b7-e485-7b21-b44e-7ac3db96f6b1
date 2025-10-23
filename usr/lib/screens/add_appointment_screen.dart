import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/firestore_service.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({super.key});

  @override
  _AddAppointmentScreenState createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  final DataService _dataService = DataService();
  String? _selectedPatientId;
  DateTime? _selectedDate;
  final TextEditingController _notesController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _addAppointment() {
    if (_selectedPatientId != null && _selectedDate != null) {
      _dataService.addAppointment(_selectedPatientId!, _selectedDate!, _notesController.text);
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final patients = _dataService.getPatients();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Consulta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              hint: const Text('Selecionar Paciente'),
              value: _selectedPatientId,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPatientId = newValue;
                });
              },
              items: patients.map<DropdownMenuItem<String>>((
                Map<String, dynamic> patient) {
                return DropdownMenuItem<String>(
                  value: patient['id'],
                  child: Text(patient['name']),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(_selectedDate == null
                  ? 'Selecionar Data'
                  : 'Data: ${_selectedDate!.toString().split(' ')[0]}'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Notas da Consulta'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addAppointment,
              child: const Text('Agendar'),
            ),
          ],
        ),
      ),
    );
  }
}