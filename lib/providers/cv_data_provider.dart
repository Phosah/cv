import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cv_app/models/cv_data.dart';

final cvDataProvider = StateProvider<CVData>(
  (ref) => CVData(
    fullName: 'Efosa Uyi-Idahor',
    slackName: 'Phosah',
    githubHandle: 'https://github.com/Phosah/cv',
    personalBio:
        'I am a seasoned Frontend Developer with over three years of experience specializing in Javascript, Vue, and React. With a deep understanding of these technologies, I am adept at mastering new technologies swiftly. My curiosity and drive for innovation are continuously sparked by the dynamic and rapidly evolving world of web technologies.',
    workExperience: [
      WorkExperience(
        date: 'Oct 2022 - Present',
        company: 'Reftek',
        roles: [
          'Maintained a well-structured codebase, adhering to industry best practices and robust software architecture principles.',
          'Collaborated closely with designers to transform wireframes and mockups into responsive and visually appealing user interfaces, utilizing Vue and Tailwind.'
        ],
      ),
      WorkExperience(
        date: 'Jan 2020 - Oct 2022',
        company: 'Gruve',
        roles: [
          'Architected and implemented a scalable web3 application infrastructure using Next.js, leveraging its server-side rendering capabilities for optimal performance.',
          'Engineered efficient state management with Redux and Hooks, reducing code complexity by 25% and improving scalability and maintainability.'
        ],
      ),
    ],
  ),
);