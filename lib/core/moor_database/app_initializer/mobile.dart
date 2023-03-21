import 'dart:async';
import 'dart:io';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../moor_database.dart';

DemoMoorDatabase constructDb({bool logStatements = false}) {
  if (Platform.isIOS || Platform.isAndroid) {
      final executor = LazyDatabase(() async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final dbFilePath = Platform.isIOS ? dbFolder.path + "/Backups" : dbFolder.path.replaceAll("app_flutter", "databases");
        final dbFileName = Platform.isIOS ? "simform.db" : "simform.db";
        final file = File(p.join(dbFilePath, dbFileName));
        return VmDatabase(file, logStatements: true);
      });
      return DemoMoorDatabase(executor);

    }

    if (Platform.isMacOS || Platform.isLinux) {
      final file = File('out_on_hire.sqlite');
      return DemoMoorDatabase(VmDatabase(file, logStatements: true));
    }
    // if (Platform.isWindows) {
    //   final file = File('db.sqlite');
    //   return Database(VMDatabase(file, logStatements: logStatements));
    // }
    return DemoMoorDatabase(VmDatabase.memory(logStatements: true));
}