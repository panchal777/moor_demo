import 'package:moor/moor_web.dart';

import '../moor_database.dart';

DemoMoorDatabase constructDb({bool logStatements = false}) {
  print("initialize db");
  return DemoMoorDatabase(WebDatabase('db', logStatements: logStatements));
}
/*
void initializeApp(){
  //initialize web related code here.
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp());
}

Future<void> initHive() async{
 // await Hive.initFlutter();
  //   // Hive.init(appDocDir.path);
}*/
