import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cv_app/providers/cv_data_provider.dart';

class CVEditScreen extends ConsumerWidget {
  CVEditScreen({Key? key}) : super(key: key);
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController slackUsernameController = TextEditingController();
  final TextEditingController githubController = TextEditingController();
  final TextEditingController personalBioController = TextEditingController();
  final TextEditingController workCompanyController = TextEditingController();
  final TextEditingController workDateController = TextEditingController();
  final TextEditingController workRoleController = TextEditingController();
  final TextEditingController personalCompanyController =
      TextEditingController();
  final TextEditingController personalDateController = TextEditingController();
  final TextEditingController personalRoleController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final cvDataNotifier = ref.read(cvDataProvider.notifier);

    fullNameController.text = cvDataNotifier.fullName ?? '';
    slackUsernameController.text = cvDataNotifier.slackName ?? '';
    githubController.text = cvDataNotifier.githubHandle ?? '';
    personalBioController.text = cvDataNotifier.personalBio ?? '';
    workCompanyController.text = cvDataNotifier.workCompany ?? '';
    workDateController.text = cvDataNotifier.workDate ?? '';
    workRoleController.text = cvDataNotifier.workRole ?? '';
    personalCompanyController.text = cvDataNotifier.personalCompany ?? '';
    personalDateController.text = cvDataNotifier.personalDate ?? '';
    personalRoleController.text = cvDataNotifier.personalRole ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('CV APPLICATION'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                  ),
                  controller: fullNameController,
                  onSaved: (value) {
                    cvDataNotifier.updateFullName(value!);
                  },
                ),
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Slack Username',
                  ),
                  controller: slackUsernameController,
                  onSaved: (value) {
                    cvDataNotifier.updateSlackName(value!);
                  },
                ),
                TextFormField(
                  // maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Github',
                  ),
                  controller: githubController,
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
                  controller: personalBioController,
                  onSaved: (value) {
                    cvDataNotifier.updatePersonalBio(value!);
                  },
                ),

                // const WorkExperienceForm(),
                const SizedBox(height: 20.0),
                const Text('Work Experience'),
                const SizedBox(height: 14.0),
                TextFormField(
                  controller: workDateController,
                  decoration: const InputDecoration(labelText: 'Date'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter date';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cvDataNotifier.updateWorkDate(value!);
                  },
                ),
                TextFormField(
                  controller: workCompanyController,
                  decoration: const InputDecoration(labelText: 'Company'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter company';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cvDataNotifier.updateWorkCompany(value!);
                  },
                ),
                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: workRoleController,
                  decoration: const InputDecoration(labelText: 'Experience'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter experience';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cvDataNotifier.updateWorkRole(value!);
                  },
                ),

                const SizedBox(height: 20.0),
                const Text('Personal Experience'),
                const SizedBox(height: 14.0),
                TextFormField(
                  controller: personalDateController,
                  decoration: const InputDecoration(labelText: 'Date'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter date';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cvDataNotifier.updatePersonalDate(value!);
                  },
                ),
                TextFormField(
                  controller: personalCompanyController,
                  decoration: const InputDecoration(labelText: 'Company'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter company';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cvDataNotifier.updatePersonalCompany(value!);
                  },
                ),
                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: personalRoleController,
                  decoration: const InputDecoration(labelText: 'Experience'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter experience';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cvDataNotifier.updatePersonalRole(value!);
                  },
                ),

                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
