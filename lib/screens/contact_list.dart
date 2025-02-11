import 'package:flutter/material.dart';
import 'package:contact_management_app/main.dart' as app;
import 'package:contact_management_app/services/contact_service.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactService _contactService = ContactService();
  late Future<List<Contact>> _contactsFuture;

  @override
  void initState() {
    super.initState();
    _contactsFuture = _loadContacts();
  }

  Future<List<Contact>> _loadContacts() {
    return _contactService.getAllContacts();
  }

  Future<void> _refreshContacts() async {
    setState(() {
      _contactsFuture = _loadContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        backgroundColor: Colors.purpleAccent,
      ),
      drawer: const app.NavigationDrawer(),
      body: RefreshIndicator(
        onRefresh: _refreshContacts,
        child: FutureBuilder<List<Contact>>(
          future: _contactsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Error loading contacts'),
                    ElevatedButton(
                      onPressed: _refreshContacts,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No contacts found'));
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final contact = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(contact.pname),
                    subtitle: Text(contact.pphone),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // TODO: Navigate to edit screen
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // TODO: Implement delete functionality
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Delete Contact'),
                                content: Text('Delete ${contact.pname}?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // TODO: Implement delete
                                      Navigator.pop(context);
                                      _refreshContacts();
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to add contact screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


