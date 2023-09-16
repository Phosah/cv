import 'package:cv_app/screens/cv_edit_screen.dart';
import 'package:flutter/material.dart';

class CVViewScreen extends StatelessWidget {
  const CVViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CV APPLICATION'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'This is the CV preview',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CVEditScreen()),
                );
              },
              child: const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
