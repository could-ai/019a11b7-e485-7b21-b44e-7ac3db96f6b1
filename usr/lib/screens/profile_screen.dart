import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nome: Nome do Usuário', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Email: email@usuario.com'),
            SizedBox(height: 20),
            // Adicionar mais campos de perfil aqui
          ],
        ),
      ),
    );
  }
}
