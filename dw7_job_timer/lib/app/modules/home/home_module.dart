import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'package:dw7_job_timer/app/modules/home/controller/home_controller.dart';
import 'package:dw7_job_timer/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    BlocBind.lazySingleton(
      (i) => HomeController(projectService: i()),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (context, args) =>
            HomePage(controller: Modular.get()..loadProjects()))
  ];
}
