import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cv_app/models/cv_data.dart';

final cvDataProvider =
    StateNotifierProvider<CVDataNotifier, CVData>((ref) => CVDataNotifier(
          CVData(
            fullName: 'Efosa Uyi-Idahor',
            slackName: 'Phosah',
            githubHandle: 'https://github.com/Phosah/cv',
            personalBio:
                'I am a seasoned Frontend Developer with over three years of experience specializing in Javascript, Vue, and React. With a deep understanding of these technologies, I am adept at mastering new technologies swiftly. My curiosity and drive for innovation are continuously sparked by the dynamic and rapidly evolving world of web technologies.',
            workCompany: 'Reftek',
            workDate: 'Oct 2020 - Present',
            workRole:
                'Maintained a well-structured codebase, adhering to industry best practices and robust software architecture principles. Collaborated closely with designers to transform wireframes and mockups into responsive and visually appealing user interfaces, utilizing Vue and Tailwind. Architected and implemented a scalable web3 application infrastructure using Next.js, leveraging its server-side rendering capabilities for optimal performance. ',
            personalCompany: 'HNG i8 Finalist',
            personalDate: 'Aug 2020 - Oct 2020',
            personalRole:
                'Participated in the frontend track that built ZuriChat. Lead the Vue team as Team lead from stage 7 to stage 10. Learnt how to work in groups and under pressure. Attained a pixel-perfect representation of the original design concept across both web and mobile platforms through meticulous attention to detail.',
            workExperience: [
              WorkExperience(
                date: 'Oct 2022 - Present',
                company: 'Reftek',
                roles:
                    'Maintained a well-structured codebase, adhering to industry best practices and robust software architecture principles. Collaborated closely with designers to transform wireframes and mockups into responsive and visually appealing user interfaces, utilizing Vue and Tailwind.',
              ),
            ],
            personalExperience: [
              PersonalExperience(
                date: 'Aug 2020 - Oct 2020',
                company: 'HNG i8 Finalist',
                description:
                    'Architected and implemented a scalable web3 application infrastructure using Next.js, leveraging its server-side rendering capabilities for optimal performance.',
              ),
            ],
          ),
        ));

class CVDataNotifier extends StateNotifier<CVData> {
  CVDataNotifier(CVData state) : super(state);

  String? get fullName => state.fullName;
  String? get slackName => state.slackName;
  String? get githubHandle => state.githubHandle;
  String? get personalBio => state.personalBio;
  String? get workCompany => state.workCompany;
  String? get workDate => state.workDate;
  String? get workRole => state.workRole;
  String? get personalCompany => state.personalCompany;
  String? get personalDate => state.personalDate;
  String? get personalRole => state.personalRole;
  // String? get workCompany => state.workExperience[0].company;
  // String? get workDate => state.workExperience[0].date;
  // String? get workDescription => state.workExperience[0].roles;

  void updateFullName(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  void updateSlackName(String slackName) {
    state = state.copyWith(slackName: slackName);
  }

  void updateGithubHandle(String githubHandle) {
    state = state.copyWith(githubHandle: githubHandle);
  }

  void updatePersonalBio(String personalBio) {
    state = state.copyWith(personalBio: personalBio);
  }

  void updateWorkCompany(String workCompany) {
    state = state.copyWith(workCompany: workCompany);
  }

  void updateWorkDate(String workDate) {
    state = state.copyWith(workDate: workDate);
  }

  void updateWorkRole(String workRole) {
    state = state.copyWith(workRole: workRole);
  }

  void updatePersonalCompany(String personalCompany) {
    state = state.copyWith(personalCompany: personalCompany);
  }

  void updatePersonalDate(String personalDate) {
    state = state.copyWith(personalDate: personalDate);
  }

  void updatePersonalRole(String personalRole) {
    state = state.copyWith(personalRole: personalRole);
  }

  // void updateWorkExperience(WorkExperience workExperience) {
  //   state = state.copyWith(
  //     workExperience: [workExperience],
  //   );
  // }
}
