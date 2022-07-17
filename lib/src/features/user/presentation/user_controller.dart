// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../domain/model/user.dart';
// import '../domain/value/money_amount.dart';
// import '../use_case/user_use_case.dart';

// final userStateProvider =
//     StateNotifierProvider.autoDispose<UserState, AsyncValue<List<User>>>(
//         (ref) => UserState(userUseCase: ref.watch(userUseCaseProvider)));

// class UserState extends StateNotifier<AsyncValue<List<User>>> {
//   UserState({required this.userUseCase}) : super(const AsyncData([])) {
//     _fetchUsers();
//   }

//   final UserUseCase userUseCase;

//   void _fetchUsers() async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() => userUseCase.fetchUsers());
//   }

//   void add({
//     required UserName name,
//   }) async {
//     state = const AsyncLoading();
//     User newUser = User.initCreate(
//       name: name,
//     );
//     state = await AsyncValue.guard(() => userUseCase.add(newUser));
//   }

//   void remove(int id) async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() => userUseCase.remove(id));
//   }

//   void addPayment(User user, Money add) async {
//     state = const AsyncLoading();
//     await userUseCase.addPayment(user: user, add: add);
//     state = await AsyncValue.guard(() => userUseCase.fetchUsers());
//   }

//   void update({
//     required User user,
//     UserName? name,
//     Money? sumAmount,
//     Money? payBackAmount,
//   }) async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() => userUseCase.update(
//           user: user,
//           name: name,
//           sumAmount: sumAmount,
//           payBackAmount: payBackAmount,
//         ));
//   }
// }
