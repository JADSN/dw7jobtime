import 'package:isar/isar.dart';
import 'package:dw7_job_timer/app/entities/converters/project_tatus_converter.dart';
import 'package:dw7_job_timer/app/entities/project_task.dart';

import 'project_status.dart';

part 'project.g.dart';

@Collection()
class Project {
  @Id()
  int? id;

  late String name;
  late int estimate;

  @ProjectTatusConverter()
  late ProjectStatus status;

  final tasks = IsarLinks<ProjectTask>();
}
