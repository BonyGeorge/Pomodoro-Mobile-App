// The Tasks Page.
/* Here is all of the user daily tasks.*/
import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_app/providers/projects.dart';
import 'package:pomodoro_app/widgets/project_list.dart';
import 'package:pomodoro_app/widgets/add_edit_project.dart';

class Projecty extends StatefulWidget {
  static const routeName = '/projects';

  @override
  _ProjectyState createState() => _ProjectyState();
}

class _ProjectyState extends State<Projecty> {
  @override
  Widget build(BuildContext context) {
    final projecttList = Provider.of<ProjectProvider>(context).projectsList;
    //final task = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('My Projects'),
        backgroundColorStart: Colors.cyan,
        backgroundColorEnd: Colors.green,
        centerTitle: true,
        actions: <Widget>[
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
      body: projecttList.length > 0
          ? ListView.builder(
              itemCount: projecttList.length,
              itemBuilder: (context, index) {
                return ProjectItem(projecttList[index]);
              },
            )
          : LayoutBuilder(
              builder: (ctx, constraints) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: constraints.maxHeight * 0.5,
                        child: Image.asset('assets/images/nodata.png',
                            fit: BoxFit.cover),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'No Projects added yet...',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
