import 'package:asset_split/src/features/user/presentation/add_new_user_screen.dart';
import 'package:asset_split/src/features/user/presentation/current_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import '../../../common_widget/async_value_widget.dart';
import '../../../common_widget/bottom_navigation_common.dart';
import '../../../constants.dart';
import '../../../routing/app_router.dart';
import '../domain/local_user_repository.dart';
import '../domain/model/user.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<User>> userList = ref.watch(userListStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザー一覧'),
      ),
      bottomNavigationBar: const BottomNavigationCommon(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddNewUserScreen(),
              ),
            ),
          );
        },
      ),
      body: AsyncValueWidget<List<User>>(
        value: userList,
        data: (users) => users.isEmpty
            ? Center(
                child: Text(
                  'ユーザー登録しよう！',
                  style: Theme.of(context).textTheme.headline4,
                ),
              )
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, itemIndex) {
                  final user = users[itemIndex];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          ref
                              .read(currentUserStateProvider.notifier)
                              .stateChange(user);
                          context.goNamed(AppRoute.home.name);
                        },
                        child: Slidable(
                          startActionPane: ActionPane(
                            // A motion is a widget used to control how the pane animates.
                            motion: const ScrollMotion(),
                            // All actions are defined in the children parameter.
                            children: [
                              // A SlidableAction can have an icon and/or a label.
                              SlidableAction(
                                onPressed: (value) {
                                  ref
                                      .read(currentUserStateProvider.notifier)
                                      .remove(user);
                                },
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                              SlidableAction(
                                onPressed: (value) {},
                                backgroundColor: const Color(0xFF21B7CA),
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Edit',
                              ),
                            ],
                          ),
                          // endActionPane: ActionPane(
                          //   // A motion is a widget used to control how the pane animates.
                          //   motion: const ScrollMotion(),
                          //   // All actions are defined in the children parameter.
                          //   children: [
                          //     // A SlidableAction can have an icon and/or a label.
                          //     SlidableAction(
                          //       onPressed: (value) {
                          //         ref
                          //             .read(currentUserStateProvider.notifier)
                          //             .changeCurrentUser(user.id);
                          //         context.goNamed(AppRoute.home.name);
                          //       },
                          //       backgroundColor: Colors.green,
                          //       foregroundColor: Colors.white,
                          //       icon: Icons.delete,
                          //       label: 'select',
                          //     ),
                          //   ],
                          // ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('ユーザー名：${user.name.name}'),
                                  Text(
                                      '資産合計${costFormat.format(user.sumAmount.amount)}円'),
                                  Text(
                                      '返済合計：${costFormat.format(user.payBackAmount.amount)}円'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      )
                    ],
                  );
                },
              ),
      ),
    );
  }
}
