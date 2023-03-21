import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moor_demo/features/users/presentation/cubit/user_cubit.dart';
import 'package:workmanager/workmanager.dart';
import '../../work_manager_demo.dart';
import '../widgets/user_list_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late UserCubit _userCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userCubit = BlocProvider.of<UserCubit>(context);
    _userCubit.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: Center(child: GetUserListWidget()));
  }
}
