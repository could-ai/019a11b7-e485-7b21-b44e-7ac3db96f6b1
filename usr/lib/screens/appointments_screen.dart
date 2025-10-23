import 'package:flutter/material.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
      ),
      body: ListView.builder(
        itemCount: 10, // Exemplo
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Consulta ${index + 1}'),
            subtitle: const Text('Paciente: Nome do Paciente'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navegar para detalhes da consulta
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicionar nova consulta
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
