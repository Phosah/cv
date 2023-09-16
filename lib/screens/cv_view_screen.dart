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
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: const Text(
                  'Work Experience:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Text(
                    cvData.workCompany,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  const Spacer(),
                  Text(
                    cvData.workDate,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Text(cvData.workRole),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: const Text(
                  'Personal Experience:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Text(
                    cvData.personalCompany,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  const Spacer(),
                  Text(
                    cvData.personalDate,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Text(cvData.personalRole),
              const SizedBox(
                height: 10,
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
