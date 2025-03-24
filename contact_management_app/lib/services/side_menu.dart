import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SideMenu extends StatefulWidget{
  const SideMenu({super.key});

  @override
  State<SideMenu> createState()  => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

@override
  Widget build(BuildContext context) {

    //button style
    final ButtonStyle style =
        ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20, color: Colors.white), 
        backgroundColor: Colors.purpleAccent, );


    return Scaffold(
      body: Container(
        width: 200,
        height: double.infinity,
        color: Color(0xFF17203A),
        child: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white24,
                child: Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                  ),
              ),
              title: Text("Tawiah Narh",
              style: TextStyle(color: Colors.white),
              ),
              subtitle: Text("~Contacts",
              style: TextStyle(color: Colors.white),
              ),
            ),

            // ElevatedButton(
            //   style: style,
            //   onPressed: (){}, 
            //   child: (Icon(
            //     CupertinoIcons.phone,
            //     color: Colors.white,
            //   ))
            //   ),

            //Contact list button
              ElevatedButton.icon(
                style: style,
                onPressed: (){}, 
                icon: const Icon(
                  CupertinoIcons.phone,
                  color: Colors.white,
                ),
                label: const Text("Contact List")),

              //Add contacts button
                ElevatedButton.icon(
                style: style,
                onPressed: (){}, 
                icon: const Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
                label: const Text("Add Contact")),

              //Edit button
                ElevatedButton.icon(
                style: style,
                onPressed: (){}, 
                icon: const Icon(
                  CupertinoIcons.pen,
                  color: Colors.white,
                ),
                label: const Text("Edit Contact"))

          ],
        ),
      ),
      )
    );
  }
}