// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw7_job_timer/app/entities/project_status.dart';
import 'package:dw7_job_timer/app/repositories/projects/project_repository.dart';
import 'package:dw7_job_timer/app/view_models/project_model.dart';

import '../../../entities/project.dart';
import './project_service.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectRepository _projectRepository;

  ProjectServiceImpl({
    required ProjectRepository projectRepository,
  }) : _projectRepository = projectRepository;

  @override
  Future<void> register(ProjectModel projectModel) async {
    final project = Project()
      ..id = projectModel.id
      ..name = projectModel.name
      ..status = projectModel.status
      ..estimate = projectModel.estimate;

    await _projectRepository.register(project);
  }

  @override
  Future<List<ProjectModel>> findByStatus(ProjectStatus projectStatus) async {
    final projects = await _projectRepository.findByStatus(projectStatus);
    return projects.map(ProjectModel.fromEntity).toList();
  }
}
