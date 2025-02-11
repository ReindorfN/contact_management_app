// import 'package:contact_management_app/services/side_menu.dart';
import 'package:contact_management_app/screens/about.dart';
import "package:flutter/material.dart";
import 'package:contact_management_app/screens/add_contact.dart';
import 'package:contact_management_app/screens/contact_list.dart';
import 'package:contact_management_app/screens/edit_contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Contact Management',
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Contact Management"),
        backgroundColor: Colors.purpleAccent,
      ),
      drawer: const NavigationDrawer(),
    ),
  );
}


//Navigation drawer class
class NavigationDrawer extends StatelessWidget{
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),

        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext  context) => Container(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
    runSpacing: 16,
    children: [
      ListTile(
        leading: const Icon(Icons.contacts),
        title: const Text("Contacts"),
        onTap: () => 
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ContactsPage(),
          )),
      ),

    //Divider
      const Divider(color: Colors.black54,),

      ListTile(
        leading: const Icon(Icons.add),
        title: const Text("Add Contact"),
        onTap: () => 
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const AddContact(),
          )),
      ),
      ListTile(
        leading: const Icon(Icons.info),
        title: const Text("About"),
        onTap: () => 
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const AboutPage(),
          )),
      ),
      
    ],
  ),
  );
}