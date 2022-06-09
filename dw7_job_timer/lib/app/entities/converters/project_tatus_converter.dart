import 'package:isar/isar.dart';

import '../project_status.dart';

class ProjectTatusConverter extends TypeConverter<ProjectStatus, int> {
  const ProjectTatusConverter();

  @override
  ProjectStatus fromIsar(int object) {
    return ProjectStatus.values.elementAt(object);
  }

  @override
  int toIsar(ProjectStatus object) {
    return object.index;
  }
}
