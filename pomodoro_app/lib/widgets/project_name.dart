// Widget responsible for the single task shape.
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectText extends StatelessWidget {
  final bool isCompleted;
  final String title;
  final DateTime dueDate;
  final TimeOfDay dueTime;

  ProjectText(
    this.isCompleted,
    this.title,
    this.dueDate,
    this.dueTime,
  );

  Widget _buildText(BuildContext context) {
    if (isCompleted == true) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
          _buildDateTimeTexts(context),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        _buildDateTimeTexts(context),
      ],
    );
  }

  Widget _buildDateText(BuildContext context) {
    return Text(
      DateFormat.yMMMd().format(dueDate).toString(),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 10,
        color: isCompleted ? Colors.grey : Theme.of(context).primaryColorDark,
      ),
    );
  }

  Widget _buildTimeText(BuildContext context) {
    return Text(
      dueTime.format(context),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 10,
        color: isCompleted ? Colors.grey : Theme.of(context).primaryColorDark,
      ),
    );
  }

  Widget _buildDateTimeTexts(BuildContext context) {
    if (dueDate != null && dueTime == null) {
      return _buildDateText(context);
    } else if (dueDate != null && dueTime != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildDateText(context),
          SizedBox(
            width: 10,
          ),
          _buildTimeText(context),
        ],
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return _buildText(context);
  }
}
