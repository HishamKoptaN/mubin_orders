// import 'package:get/get.dart';

// import '../core/order.dart';

// class StudentListController extends GetxController {
//   final RxList<Order> _students = <Order>[].obs;

//   int get count => _students.length;

//   List<Order> getStudents() {
//     return _students;
//   }

//   Order at(int index) {
//     return _students[index];
//   }

//   void setStudents(List<Order> students) {
//     _students.assignAll(students);
//     update();
//   }

//   void addStudent(Order student) {
//     _students.insert(0, student);
//     update();
//   }

//   void deleteStudent(Order student) {
//     _students.remove(student);
//     update();
//   }

//   void updateStudent(int index, Order updatedStudent) {
//     _students[index] = updatedStudent;
//     update();
//   }
// }
