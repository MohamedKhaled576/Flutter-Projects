import 'package:get/get.dart';

class User {
  final int id;
  final String name;
  final String email;
  final int age;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
  });
}

class TableController extends GetxController {
  var users = <User>[].obs;
  var selectedRows = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadLocalData();
  }

  void loadLocalData() {
    users.value = [
      User(id: 1, name: "Mohamed", email: "mohamed@test.com", age: 25),
      User(id: 2, name: "Ahmed", email: "ahmed@test.com", age: 30),
      User(id: 3, name: "Sara", email: "sara@test.com", age: 22),
      User(id: 4, name: "Mona", email: "mona@test.com", age: 28),
    ];
  }

  void toggleSelection(int id) {
    if (selectedRows.contains(id)) {
      selectedRows.remove(id);
    } else {
      selectedRows.add(id);
    }
  }
}