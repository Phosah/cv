import 'package:flutter/material.dart';

class CVEditScreen extends StatefulWidget {
  const CVEditScreen({Key? key}) : super(key: key);

  @override
  State<CVEditScreen> createState() => _CVEditScreenState();
}

class _CVEditScreenState extends State<CVEditScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredSlackName = '';
  var _enteredGithub = '';
  var _enteredPersonalBio = '';
  var _enteredWorkExperience = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CV APPLICATION'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                ),
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Slack Username',
                ),
                onSaved: (value) {
                  _enteredSlackName = value!;
                },
              ),
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Github handle',
                ),
                onSaved: (value) {
                  _enteredGithub = value!;
                },
              ),
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Personal Bio',
                ),
                onSaved: (value) {
                  _enteredPersonalBio = value!;
                },
              ),
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                onSaved: (value) {
                  _enteredWorkExperience = value!;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Perform save operation
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
