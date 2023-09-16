import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cv_app/providers/cv_data_provider.dart';

class WorkExperienceForm extends ConsumerStatefulWidget {
  const WorkExperienceForm({Key? key}) : super(key: key);

  @override
  _WorkExperienceFormState createState() => _WorkExperienceFormState();
}

class _WorkExperienceFormState extends ConsumerState<WorkExperienceForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _dateController;
  late TextEditingController _companyController;
  late List<String> _roles;

  @override
  void initState() {
    super.initState();
    final workExperience = ref.read(cvDataProvider).workExperience.first;
    _dateController = TextEditingController(text: workExperience.date);
    _companyController = TextEditingController(text: workExperience.company);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          const Text('Work Experience'),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: _dateController,
            decoration: const InputDecoration(labelText: 'Date'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter date';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _companyController,
            decoration: const InputDecoration(labelText: 'Company'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter company';
              }
              return null;
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _roles.length,
            itemBuilder: (context, index) {
              return TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                initialValue: _roles[index],
                decoration: const InputDecoration(labelText: 'Role'),
                onChanged: (value) {
                  _roles[index] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter role';
                  }
                  return null;
                },
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    _companyController.dispose();
    super.dispose();
  }
}
