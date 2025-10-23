import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/chat_screen.dart';

class PatientDetailScreen extends StatelessWidget {
  const PatientDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Paciente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Nome: Nome do Paciente', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            const Text('Email: email@paciente.com'),
            const SizedBox(height: 20),
            const Text('Anotações:', style: TextStyle(fontSize: 18)),
            const Expanded(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Adicione suas anotações aqui...',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                );
              },
              child: const Text('Abrir Chat'),
            ),
          ],
        ),
      ),
    );
  }
}
