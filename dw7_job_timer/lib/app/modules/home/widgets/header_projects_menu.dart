import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../entities/project_status.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.5,
                child: DropdownButtonFormField<ProjectStatus>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    isCollapsed: true,
                  ),
                  items: ProjectStatus.values
                      .map(
                        (projectStatus) => DropdownMenuItem(
                          value: projectStatus,
                          child: Text(
                            projectStatus.label,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.4,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Novo Projeto'),
                  onPressed: () {
                    log("NEW PROJECT");
                    Modular.to.pushNamed('/project/register/');
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
