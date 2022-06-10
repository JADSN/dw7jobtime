import 'package:dw7_job_timer/app/modules/project/task/controller/task_controller.dart';
import 'package:dw7_job_timer/app/modules/project/task/task_page.dart';
import 'package:dw7_job_timer/app/view_models/project_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class TaskModule extends Module {
  @override
  final List<Bind> binds = [
    BlocBind.lazySingleton(
      (i) => TaskController(projectService: i()), // AppModule
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) {
      final ProjectModel projectModel = args.data;
      return TaskPage(controller: Modular.get()..setProject(projectModel));
    })
  ];
}