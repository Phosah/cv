import 'package:flutter_riverpod/flutter_riverpod.dart';

class CVData {
  String fullName;
  String slackName;
  String githubHandle;
  String personalBio;
  String workCompany;
  String workDate;
  String workRole;
  String personalCompany;
  String personalDate;
  String personalRole;
  List<WorkExperience> workExperience;
  List<PersonalExperience> personalExperience;

  CVData({
    required this.fullName,
    required this.slackName,
    required this.githubHandle,
    required this.personalBio,
    required this.workCompany,
    required this.workDate,
    required this.workRole,
    required this.personalCompany,
    required this.personalDate,
    required this.personalRole,
    required this.workExperience,
    required this.personalExperience,
  });

  CVData copyWith({
    String? fullName,
    String? slackName,
    String? githubHandle,
    String? personalBio,
    String? workCompany,
    String? workDate,
    String? workRole,
    String? personalCompany,
    String? personalDate,
    String? personalRole,
    List<WorkExperience>? workExperience,
    List<PersonalExperience>? personalExperience,
  }) {
    return CVData(
      fullName: fullName ?? this.fullName,
      slackName: slackName ?? this.slackName,
      githubHandle: githubHandle ?? this.githubHandle,
      personalBio: personalBio ?? this.personalBio,
      workCompany: workCompany ?? this.workCompany,
      workDate: workDate ?? this.workDate,
      workRole: workRole ?? this.workRole,
      personalCompany: personalCompany ?? this.personalCompany,
      personalDate: personalDate ?? this.personalDate,
      personalRole: personalRole ?? this.personalRole,
      workExperience: workExperience ?? this.workExperience,
      personalExperience: personalExperience ?? this.personalExperience,
    );
  }
}

class WorkExperience {
  String date;
  String company;
  String roles;

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

class CVDataProvider extends StateNotifier<CVData> {
  CVDataProvider()
      : super(CVData(
          fullName: 'Efosa Uyi-Idahor',
          slackName: 'Phosah',
          githubHandle: 'https://github.com/Phosah/cv',
          personalBio:
              'I am a seasoned Frontend Developer with over three years of experience specializing in Javascript, Vue, and React. With a deep understanding of these technologies, I am adept at mastering new technologies swiftly. My curiosity and drive for innovation are continuously sparked by the dynamic and rapidly evolving world of web technologies.',
          workCompany: 'Reftek',
          workDate: 'Oct 2022 - Present',
          workRole:
              'Architected and implemented a scalable web3 application infrastructure using Next.js, leveraging its server-side rendering capabilities for optimal performance',
          personalCompany: 'HNG i8 Finalist',
          personalDate: 'Oct 2022 - Present',
          personalRole:
              'Maintained a well-structured codebase, adhering to industry best practices and robust software architecture principles. Collaborated closely with designers to transform wireframes and mockups into responsive and visually appealing user interfaces, utilizing Vue and Tailwind. Architected and implemented a scalable web3 application infrastructure using Next.js, leveraging its server-side rendering capabilities for optimal performance. ',
          workExperience: [
            WorkExperience(
                date: '3 years of experience',
                company: 'Reftek',
                roles:
                    'Engineered efficient state management with Redux and Hooks, reducing code complexity by 25% and improving scalability and maintainability.'),
          ],
          personalExperience: [
            PersonalExperience(
              company: 'HNF',
              date: '1 year of experience',
              description:
                  'Developed a personal project using Flutter and Riverpod, showcasing my skills in cross-platform app development.',
            ),
          ],
        ));

  void updateCVData(CVData newData) {
    state = newData;
  }
}

final cvDataProvider = StateNotifierProvider<CVDataProvider, CVData>((ref) {
  return CVDataProvider();
});
