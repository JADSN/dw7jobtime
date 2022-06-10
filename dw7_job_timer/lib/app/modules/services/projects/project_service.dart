import 'package:dw7_job_timer/app/view_models/project_model.dart';
import 'package:dw7_job_timer/app/view_models/project_task_model.dart';

import '../../../entities/project_status.dart';

abstract class ProjectService {
  Future<void> register(ProjectModel projectModel);
  Future<List<ProjectModel>> findByStatus(ProjectStatus projectStatus);
  Future<ProjectModel> findById(int projectId);
  Future<ProjectModel> addTask(int projectId, ProjectTaskModel task);
  Future<void> finish(int projectId);
}
