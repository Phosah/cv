import 'package:flutter/material.dart';
import 'package:cv_app/screens/cv_edit_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cv_app/providers/cv_data_provider.dart';

class CVViewScreen extends ConsumerWidget {
  const CVViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cvData = ref.watch(cvDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CV'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' ${cvData.fullName}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                'Slack: ${cvData.slackName}',
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Github Handle: ${cvData.githubHandle}',
                style: const TextStyle(color: Colors.blue),
              ),
              const SizedBox(
                height: 4,
              ),
              Text('Personal Bio: ${cvData.personalBio}'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Work Experience:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: cvData.workExperience.length,
                itemBuilder: (context, index) {
                  final workExperience = cvData.workExperience[index];
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          workExperience.company,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          workExperience.date,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: workExperience.roles
                          .map((role) => Text(role))
                          .toList(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Personal Experience:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: cvData.personalExperience.length,
                itemBuilder: (context, index) {
                  final personalExperience = cvData.personalExperience[index];
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          personalExperience.company,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          personalExperience.date,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(personalExperience.description),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CVEditScreen(),
                    ),
                  );
                },
                child: const Text('Edit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
