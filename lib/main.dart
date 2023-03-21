import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moor_demo/features/users/presentation/cubit/user_cubit.dart';
import 'core/common_strings.dart';
import 'package:moor_demo/features/users/injection_container_auth.dart'
    as demoSl;

import 'features/users/presentation/pages/user_list_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await demoSl.init();
  runApp(const MyApp());
}

Route<dynamic>? _getRoute(RouteSettings settings) {
  if (settings.name == '/') {
    return _buildRoute(
        settings,
        BlocProvider(
            create: (_) => demoSl.demoSl<UserCubit>()..getUsers(),
            child: const MyHomePage()));
  }
  return null;
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return MaterialPageRoute(
    settings: settings,
    builder: (ctx) => builder,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: CommonStrings.kAppName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: _getRoute,
    );
  }
}
