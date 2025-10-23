import 'package:flutter/material.dart';

class DataService {
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  final List<Map<String, dynamic>> _patients = [
    {'id': '1', 'name': 'Paciente Exemplo', 'email': 'exemplo@email.com', 'notes': 'Anotação inicial.'},
  ];

  final List<Map<String, dynamic>> _appointments = [
    {'id': '1', 'patientId': '1', 'date': DateTime.now(), 'notes': 'Consulta inicial.'},
  ];

  List<Map<String, dynamic>> getPatients() => _patients;
  List<Map<String, dynamic>> getAppointments() => _appointments;

  void addPatient(String name, String email) {
    final newPatient = {
      'id': (_patients.length + 1).toString(),
      'name': name,
      'email': email,
      'notes': '',
    };
    _patients.add(newPatient);
  }

  void updatePatientNotes(String id, String notes) {
    final patient = _patients.firstWhere((p) => p['id'] == id);
    patient['notes'] = notes;
  }

  void addAppointment(String patientId, DateTime date, String notes) {
    final newAppointment = {
      'id': (_appointments.length + 1).toString(),
      'patientId': patientId,
      'date': date,
      'notes': notes,
    };
    _appointments.add(newAppointment);
  }

  Map<String, dynamic>? getPatientById(String id) {
    return _patients.firstWhere((p) => p['id'] == id);
  }

  Map<String, dynamic>? getAppointmentById(String id) {
    return _appointments.firstWhere((a) => a['id'] == id);
  }
}