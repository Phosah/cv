import 'package:flutter_riverpod/flutter_riverpod.dart';

final cvDataProvider = StateProvider<CVData>(
  (ref) => CVData(
    fullName: 'Efosa Uyi-Idahor',
    slackName: 'Phosah',
    githubHandle: 'https://github.com/Phosah/cv',
    personalBio:
        'I am a seasoned Frontend Developer with over three years of experience specializing in Javascript, Vue, and React. With a deep understanding of these technologies, I am adept at mastering new technologies swiftly. My curiosity and drive for innovation are continuously sparked by the dynamic and rapidly evolving world of web technologies.',
    workExperience: [
      WorkExperience(
        date: '3 years of experience',
        company: 'Reftek',
        roles: [
          'Maintained a well-structured codebase, adhering to industry best practices and robust software architecture principles.',
          'Collaborated closely with designers to transform wireframes and mockups into responsive and visually appealing user interfaces, utilizing Vue and Tailwind.'
        ],
      ),
      WorkExperience(
        date: '2 years of experience',
        company: 'Gruve',
        roles: [
          'Architected and implemented a scalable web3 application infrastructure using Next.js, leveraging its server-side rendering capabilities for optimal performance.',
          'Engineered efficient state management with Redux and Hooks, reducing code complexity by 25% and improving scalability and maintainability.'
        ],
      ),
    ],
    personalExperience: [
      PersonalExperience(
        company: 'HNG Internship',
        date: '1 year of experience',
        description:
            'Developed a personal project using Flutter and Riverpod, showcasing my skills in cross-platform app development.',
      ),
    ],
  ),
);

class CVData {
  String fullName;
  String slackName;
  String githubHandle;
  String personalBio;
  List<WorkExperience> workExperience;
  List<PersonalExperience> personalExperience;

  CVData({
    required this.fullName,
    required this.slackName,
    required this.githubHandle,
    required this.personalBio,
    required this.workExperience,
    required this.personalExperience,
  });
}

class WorkExperience {
  String date;
  String company;
  List<String> roles;

  WorkExperience({
    required this.date,
    required this.company,
    required this.roles,
  });
}

class PersonalExperience {
  String date;
  String company;
  String description;

  PersonalExperience({
    required this.date,
    required this.company,
    required this.description,
  });
}
