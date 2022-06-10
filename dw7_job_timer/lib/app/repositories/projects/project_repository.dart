import 'package:dw7_job_timer/app/entities/project_task.dart';

import '../../entities/project.dart';
import '../../entities/project_status.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);
  Future<List<Project>> findByStatus(ProjectStatus projectStatus);
  Future<Project> findById(int projectId);
  Future<Project> addTask(int projectId, ProjectTask projectTask);
  Future<void> finish(int projectId);
}
