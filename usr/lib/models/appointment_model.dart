class AppointmentModel {
  final String id;
  final String patientId;
  final DateTime date;
  final String notes;

  AppointmentModel({required this.id, required this.patientId, required this.date, required this.notes});
}
