import 'package:flutter/material.dart';
import 'package:contact_management_app/main.dart' as app;  // Add prefix

class EditContact extends StatelessWidget {
  const EditContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Contacts"),
        backgroundColor: Colors.purpleAccent,
      ),
      drawer: const app.NavigationDrawer(),  // Use the prefix
      body: const Center(
        child: Text('Edit Contacts Here'),
      ),
    );
  }
}


