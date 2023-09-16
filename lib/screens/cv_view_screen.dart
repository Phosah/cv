import 'package:flutter/material.dart';
import 'package:cv_app/screens/cv_edit_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cv_app/providers/cv_data_provider.dart';

class CVViewScreen extends ConsumerWidget {
  const CVViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cvData = ref.watch(cvDataProvider);
    const Color buttonColor = Color.fromARGB(255, 167, 124, 188);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CV'),
        backgroundColor: buttonColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cvData.fullName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              RichText(
                text: TextSpan(
                  text: 'Slack: ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: cvData.slackName,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text.rich(
                TextSpan(
                  text: 'Github: ',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: cvData.githubHandle,
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: 'Personal Bio: ',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: cvData.personalBio,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CVEditScreen()),
          );
        },
        backgroundColor: buttonColor,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
