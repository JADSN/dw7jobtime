import 'package:dw7_job_timer/app/entities/project_task.dart';

class ProjectTaskModel {
  int? id;
  String name;
  int duration;

  ProjectTaskModel({
    this.id,
    required this.name,
    required this.duration,
  });

  factory ProjectTaskModel.fromEntity(ProjectTask projectTaskModel) {
    return ProjectTaskModel(
      id: projectTaskModel.id,
      name: projectTaskModel.name,
      duration: projectTaskModel.duration,
    );
  }
}
