import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:pomodoro_app/models/project.dart';
import 'package:pomodoro_app/widgets/pt_list.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_app/providers/projects.dart';

class AddPTask extends StatefulWidget {
  static const routeName = '/projectTask';
  Project pro;

  @override
  _AddPTaskState createState() => _AddPTaskState();
}

class _AddPTaskState extends State<AddPTask> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ProjectProvider>(context).projectsTasks;
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Project Tasks'),
        backgroundColorStart: Colors.cyan,
        backgroundColorEnd: Colors.green,
        centerTitle: true,
      ),
      body: pro.length > 0
          ? ListView.builder(
              itemCount: pro.length,
              itemBuilder: (context, index) {
                return PTItem(pro[index]);
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
                        'No Completed Tasks yet...',
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
