import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common.dart';
import '../../../../core/common_strings.dart';
import '../../data/models/response_model.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_cubit_state.dart';

class GetUserListWidget extends StatelessWidget {
  List<Result>? list;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserCubitState>(
      listener: (context, state) {
        if (state is FetchUserSuccessState) {
          Common.showToast(msg: state.msg);
        }
      },
      child: BlocBuilder<UserCubit, UserCubitState>(builder: (context, state) {
        if (state is StateInitial || state is StateLoading) {
          return const CircularProgressIndicator();
        } else if (state is FetchUserSuccessState) {
          list = state.list;
        }

        return Container(
            child: list != null && list!.isNotEmpty
                ? ListView.builder(
                    itemCount: list!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              rowValue(
                                  CommonStrings.kEmail, list![index].email),
                              const SizedBox(height: 5),
                              rowValue(CommonStrings.kName,
                                  '${list![index].name!.title} ${list![index].name!.first} ${list![index].name!.last}'),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(CommonStrings.kNoRecordsFound),
                  ));
      }),
    );
  }

  Widget rowValue(String title, dynamic value) {
    return Row(
      children: [
        Text('$title :'),
        const SizedBox(width: 4),
        Expanded(child: Text(value.toString()))
      ],
    );
  }
}
