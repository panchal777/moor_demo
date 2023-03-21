// import 'package:drift/drift.dart';
// import 'dart:io';
// import 'package:drift/native.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
//
// part 'employee.g.dart';
//
// @DriftDatabase(
//   include: {'employee.drift'},
// )
// class MyDatabase extends _$MyDatabase {
//   MyDatabase() : super(_openConnection());
//
//   @override
//   int get schemaVersion => 1;
//
//   Future<List<EmployeeData>> getEmployee() async {
//     return await select(employee).get();
//   }
//
//   Future<int> saveEmployee(EmployeeCompanion companion) async {
//     return await into(employee).insert(companion);
//   }
//
//   Future<int> deleteAllEmployee() async {
//     return await delete(employee).go();
//   }
// }
//
// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'employee.db'));
//     return NativeDatabase(file);
//   });
// }
