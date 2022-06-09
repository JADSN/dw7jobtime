import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'package:dw7_job_timer/app/modules/project/register/controller/project_register_controller.dart';
import 'package:dw7_job_timer/app/modules/project/register/project_register_page.dart';

class ProjectRegisterModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        BlocBind.lazySingleton(
            (i) => ProjectRegisterController(projectService: i())) // AppModule
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => ProjectRegisterPage(
            controller: Modular.get(),
          ),
        ),
      ];
}
