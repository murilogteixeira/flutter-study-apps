import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'task.g.dart';

class Task = _TaskBase with _$Task;

abstract class _TaskBase with Store {
  _TaskBase(
      {this.title, this.description = "", this.check = false, this.deadline});

  @observable
  String title;
  @action
  setTitle(String value) => title = value;

  @observable
  String description;
  @action
  setDescription(String value) => description = value;

  @observable
  DateTime deadline;
  @action
  setDeadline(DateTime value) => deadline = value;
  String get deadlineString => DateFormat("dd/MM/yyyy HH:mm").format(deadline);

  @observable
  bool check;
  @action
  setCheck(bool value) => check = value;

  fromJson(Map<String, dynamic> json) {
    return Task(
        title: json["title"],
        description: json["description"],
        deadline: DateTime.fromMillisecondsSinceEpoch(json["deadline"]),
        check: json["check"]);
  }

  toJson() {
    return {
      "title": this.title,
      "description": this.description,
      "deadline": this.deadline.millisecondsSinceEpoch,
      "check": this.check
    };
  }
}
