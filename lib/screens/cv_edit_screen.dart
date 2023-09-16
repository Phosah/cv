import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cv_app/providers/cv_data_provider.dart';

class CVEditScreen extends ConsumerWidget {
  const CVEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final cvDataNotifier = ref.read(cvDataProvider.notifier);

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
                  cvDataNotifier.updateFullName(value!);
                },
              ),
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Slack Username',
                ),
                onSaved: (value) {
                  cvDataNotifier.updateSlackName(value!);
                },
              ),
              TextFormField(
                // maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Github',
                ),
                onSaved: (value) {
                  cvDataNotifier.updateGithubHandle(value!);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: 'Personal Bio',
                ),
                onSaved: (value) {
                  cvDataNotifier.updatePersonalBio(value!);
                },
              ),
              // TextFormField(
              //   maxLength: 50,
              //   decoration: const InputDecoration(
              //     labelText: 'Description',
              //   ),
              //   onSaved: (value) {
              //     final workExperience = [
              //       WorkExperience(
              //         date: '...',
              //         company: '...',
              //         roles: [value!],
              //       ),
              //     ];
              //     cvDataNotifier.updateWorkExperience(workExperience);
              //   },
              // ),
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
