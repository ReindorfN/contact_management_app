import 'dart:convert';
import 'package:http/http.dart' as http;

class Contact {
  final int pid;
  final String pname;
  final String pphone;

  Contact({
    required this.pid,
    required this.pname,
    required this.pphone,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      pid: json['pid'],
      pname: json['pname'],
      pphone: json['pphone'],
    );
  }
}

class ContactService {
  static const String baseUrl = 'https://apps.ashesi.edu.gh/contactmgt/actions';

//fetching individual contacts
  Future<Contact> getContact(int contid) async {
    final response = await http.get(
      Uri.parse('$baseUrl/get_a_contact_mob?contid=$contid'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      if (jsonList.isNotEmpty) {
        return Contact.fromJson(jsonList[0]);
      }
      throw Exception('Contact not found');
    } else {
      throw Exception('Failed to load contact');
    }
  }

//fetching all contacts
  Future<List<Contact>> getAllContacts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/get_all_contact_mob'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Contact.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load contacts');
    }
  }

//adding contacts
  Future<bool> addContact(String fullname, String phone) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add_contact_mob'),
      body: {
        'ufullname': fullname,
        'uphonename': phone,
      },
    );

    if (response.statusCode == 200) {
      return response.body.toLowerCase() == 'success';
    } else {
      throw Exception('Failed to add contact');
    }
  }

  Future<bool> deleteContact(int contactId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/delete_contact'),
      body: {
        'cid': contactId.toString(),
      },
    );

    if (response.statusCode == 200) {
      return response.body.toLowerCase() == 'true';
    } else {
      throw Exception('Failed to delete contact');
    }
  }
}
