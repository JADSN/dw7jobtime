import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asuka/snackbars/asuka_snack_bar.dart';

import 'package:dw7_job_timer/app/core/ui/job_timer_icons.dart';
import 'package:dw7_job_timer/app/entities/project_status.dart';
import 'package:dw7_job_timer/app/view_models/project_model.dart';
import 'package:dw7_job_timer/app/modules/project/detail/widgets/project_detail_app_bar.dart';
import 'package:dw7_job_timer/app/modules/project/detail/widgets/project_pie_char.dart';
import 'package:dw7_job_timer/app/modules/project/detail/widgets/project_task_tile.dart';

import 'controller/project_detail_controller.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectDetailController controller;

  const ProjectDetailPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProjectDetailController, ProjectDetailState>(
        bloc: controller,
        listener: (context, state) {
          if (state.status == ProjectDetailStatus.failure) {
            AsukaSnackbar.alert('Error interno').show();
          }
        },
        builder: (context, state) {
          final ProjectModel? projectModel = state.projectModel;

          switch (state.status) {
            case ProjectDetailStatus.initial:
              return const Center(
                child: Text('Carregando projeto'),
              );
            case ProjectDetailStatus.loading:
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case ProjectDetailStatus.complete:
              return _buildProjectDetail(context, projectModel!);
            case ProjectDetailStatus.failure:
              if (projectModel != null) {
                return _buildProjectDetail(context, projectModel);
              }

              return const Center(
                child: Text('Error ao carregar projeto'),
              );
          }
        },
      ),
    );
  }

  Widget _buildProjectDetail(BuildContext context, ProjectModel projectModel) {
    final totalTask = projectModel.tasks
        .fold<int>(0, (totalValue, task) => totalValue += task.duration);

    return CustomScrollView(
      slivers: [
        ProjectDetailAppBar(
          projectModel: projectModel,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  bottom: 50.0,
                ),
                child: ProjectPieChar(
                  projectEstimate: projectModel.estimate,
                  totalTasks: totalTask,
                ),
              ),
              ...projectModel.tasks
                  .map((task) => ProjectTaskTile(
                        task: task,
                      ))
                  .toList()
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Visibility(
                visible: projectModel.status != ProjectStatus.finalizado,
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.finishProject();
                  },
                  icon: const Icon(JobTimerIcons.ok_circled2),
                  label: const Text('Finalizar Projeto'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
