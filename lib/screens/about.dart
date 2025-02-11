import 'package:flutter/material.dart';
import 'package:contact_management_app/main.dart' as app;  // Add prefix

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.purpleAccent,
      ),
      drawer: const app.NavigationDrawer(),  // Use the prefix
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Column(
                children: [
                  Icon(
                    Icons.contact_phone,
                    size: 80,
                    color: Colors.purpleAccent,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Contact Management App',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Developer Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildInfoRow('Name:', 'Reindorf Narh'),
            _buildInfoRow('Student ID:', '54982026'),
            const SizedBox(height: 24),
            const Text(
              'App Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A contact management application that allows users to create, '
              'view, edit, and delete contacts. Built using Flutter and '
              'integrates with a REST API for data management.',
            ),
            const SizedBox(height: 24),
            const Text(
              'Features',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildFeatureItem('View all contacts'),
            _buildFeatureItem('Add new contacts'),
            _buildFeatureItem('Edit existing contacts'),
            _buildFeatureItem('Delete contacts'),
            _buildFeatureItem('Real-time updates'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.purpleAccent, size: 20),
          const SizedBox(width: 8),
          Text(feature),
        ],
      ),
    );
  }
}


