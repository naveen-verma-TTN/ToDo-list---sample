/// Created by Naveen Verma on 17-12-2021
/// To The New
/// naveen.verma@tothenew.com

class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
