import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw7_job_timer/app/modules/services/projects/project_service.dart';
import 'package:dw7_job_timer/app/view_models/project_model.dart';

import '../../../../entities/project_status.dart';

part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterStatus> {
  final ProjectService _projectService;

  ProjectRegisterController({required ProjectService projectService})
      : _projectService = projectService,
        super(ProjectRegisterStatus.initial);

  Future<void> register(String name, int estimate) async {
    try {
      emit(ProjectRegisterStatus.loading);
      final project = ProjectModel(
        name: name,
        estimate: estimate,
        status: ProjectStatus.em_andamento,
        tasks: [],
      );
      _projectService.register(project);
      emit(ProjectRegisterStatus.success);
    } on Exception catch (e, s) {
      log('Error ao salvar projeto', error: e, stackTrace: s);
      emit(ProjectRegisterStatus.failure);
    }
  }
}
