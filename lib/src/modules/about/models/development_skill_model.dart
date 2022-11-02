class DevelopmentSkillModel {
  DevelopmentSkillModel(this.skillTitle, this.skillModelList);
  String? skillTitle;
  List<SkillModel>? skillModelList;
}

class SkillModel {
  SkillModel(
    this.title,
    this.svgFilePath,
    this.percent,
  );
  String? title;
  String? svgFilePath;
  int? percent;
}

var listSkillModel = [
  DevelopmentSkillModel('Mobile Development', [
    SkillModel('DART', 'assets/svg/skills/dart.svg', 80),
    SkillModel('FLUTTER', 'assets/svg/skills/flutter-logo.svg', 85),
    SkillModel('KOTLIN', 'assets/svg/skills/kotlin.svg', 50),
  ]),
  DevelopmentSkillModel('Web Development', [
    SkillModel('HTML', 'assets/svg/skills/html-1.svg', 60),
    SkillModel('CSS', 'assets/svg/skills/css.svg', 60),
    SkillModel('JAVASCRIPT', 'assets/svg/skills/javascript.svg', 60),
  ]),
  DevelopmentSkillModel('Backend Development', [
    SkillModel('FIREBASE', 'assets/svg/skills/firebase.svg', 65),
    SkillModel('MYSQL', 'assets/svg/skills/mysql.svg', 50),
    SkillModel('FLASK', 'assets/svg/skills/flask.svg', 60),
  ]),
  DevelopmentSkillModel('Other Languages', [
    SkillModel('PYTHON', 'assets/svg/skills/python.svg', 70),
    SkillModel('JAVA', 'assets/svg/skills/java.svg', 50),
    SkillModel('C/C++', 'assets/svg/skills/c.svg', 50),
  ]),
];
