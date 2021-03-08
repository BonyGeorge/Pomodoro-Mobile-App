// The Tasks Page.
/* Here is all of the user daily tasks.*/
import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_app/providers/projects.dart';
import 'package:pomodoro_app/widgets/project_list.dart';
import 'package:pomodoro_app/widgets/add_edit_project.dart';

class Project extends StatelessWidget {
  static const routeName = '/projects';

  Future _projects(BuildContext context) async {
    await Provider.of<ProjectProvider>(context, listen: false)
        .fetchAndSetProjects(filterByUser: true);
  }

  @override
  Widget build(BuildContext context) {
    print('Project build');
    return Scaffold(
        appBar: GradientAppBar(
          title: Text('My Projects'),
          backgroundColorStart: Colors.cyan,
          backgroundColorEnd: Colors.green,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => AddNewProject(isEditMode: false),
                );
              },
            ),
          ],
        ),
        drawer: MyDrawer(),
        body: FutureBuilder(
          future: Provider.of<ProjectProvider>(context, listen: false)
              .fetchAndSetProjects(filterByUser: true),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              final projetList =
                  Provider.of<ProjectProvider>(context).projectsList;
              print(projetList.length);
              if (projetList.length == 0) {
                return LayoutBuilder(
                  builder: (ctx, constraints) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: constraints.maxHeight * 0.5,
                            child: Image.asset('assets/images/nodata.png',
                                fit: BoxFit.cover),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'No tasks added yet...',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return ListView.builder(
                  itemCount: projetList.length,
                  itemBuilder: (context, index) {
                    return ProjectItem(projetList[index]);
                  },
                );
              }
            }
          },
        ));
  }
}
