import 'package:dw7_job_timer/app/modules/project/detail/project_detail_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProjectDetailModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ProjectDetailPage()),
      ];
}
