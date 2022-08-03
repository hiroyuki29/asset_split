import 'package:asset_split/src/common_widget/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../common_widget/bottom_navigation_common.dart';
import '../../../constants.dart';
import '../../user/domain/model/user.dart';
import '../../user/presentation/current_user_state.dart';
import '../domain/local_asset_repository.dart';
import '../domain/model/asset.dart';
import '../use_case/asset_use_case.dart';
import 'add_new_asset_screen.dart';

class AssetListScreen extends ConsumerWidget {
  const AssetListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<User?> currentUser = ref.watch(currentUserStateProvider);
    final AsyncValue<AssetList> assetList = ref.watch(assetListStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('買ったモノ一覧'),
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
                child: const AddNewAssetScreen(),
              ),
            ),
          );
        },
      ),
      body: AsyncValueWidget<AssetList>(
        value: assetList,
        data: (assets) => assets.list.isEmpty
            ? Center(
                child: Text(
                  '買ったモノを\n登録しよう!',
                  style: Theme.of(context).textTheme.headline4,
                ),
              )
            : Column(
                children: [
                  Text('ユーザー名:${currentUser.value!.name.name}'),
                  Flexible(
                    child: ListView.builder(
                      itemCount: assets.list.length,
                      itemBuilder: (context, itemIndex) {
                        final asset = assets.list[itemIndex];
                        return Column(
                          children: [
                            Slidable(
                              startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (value) {
                                      ref
                                          .read(assetUseCaseProvider)
                                          .remove(asset!.id);
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
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      child: SizedBox(
                                        child: Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.memory(asset!.image)
                                                  .image,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('名前：${asset.name.assetName}'),
                                          Text(
                                              '元の金額：${costFormat.format(asset.cost.amount)}円'),
                                          Text(
                                              '残りの金額：${costFormat.format(asset.balanceAtNow().amount)}円'),
                                          TextForPeriod(
                                            year: asset.period.year,
                                            month: asset.period.month,
                                            day: asset.period.day,
                                          ),
                                          Text(
                                              '購入日：${dateFormat.format(asset.purchaseDate)}'),
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                            const Divider(
                              thickness: 1,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class TextForPeriod extends StatelessWidget {
  const TextForPeriod({
    Key? key,
    required this.year,
    required this.month,
    required this.day,
  }) : super(key: key);

  final int year;
  final int month;
  final int day;

  @override
  Widget build(BuildContext context) {
    String yearText = '';
    String monthText = '';
    String dayText = '';
    if (year != 0) {
      yearText = '$year年';
    }
    if (month != 0) {
      monthText = '$monthヶ月';
    }
    if (day != 0) {
      dayText = '$day日';
    }
    return Text('償却期間：$yearText$monthText$dayText');
  }
}
