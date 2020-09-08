import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/model/task.dart';

class DateTimeWidget extends StatefulWidget {
  DateTimeWidget({Key key, this.task}) : super(key: key);

  final Task task;

  @override
  _DateTimeWidgetState createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      initialValue: widget.task.deadline,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: "Prazo"),
      format: DateFormat("dd/MM/yyyy HH:mm"),
      onShowPicker: (context, currentValue) async {
        final date = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
        if (date != null) {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          var value = DateTimeField.combine(date, time);
          widget.task.setDeadline(value);
          return value;
        } else {
          return currentValue;
        }
      },
    );
  }
}
