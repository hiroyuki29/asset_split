import 'package:asset_split/src/common_widget/async_value_widget.dart';
import 'package:asset_split/src/features/asset/data/local_asset_repository_impl.dart';
import 'package:asset_split/src/features/asset/use_case/asset_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../common_widget/bottom_navigation_common.dart';
import '../../../constants.dart';
import '../domain/model/asset.dart';
import 'add_new_asset_screen.dart';

class AssetListScreen extends ConsumerWidget {
  const AssetListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            : ListView.builder(
                itemCount: assets.list.length,
                itemBuilder: (context, itemIndex) {
                  final asset = assets.list[itemIndex];
                  return Slidable(
                    startActionPane: ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: const ScrollMotion(),
                      // All actions are defined in the children parameter.
                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: (value) {
                            ref.read(assetUseCaseProvider).remove(asset!.id);
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
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.topStart,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: SizedBox(
                                    height: 200,
                                    child: Image.memory(asset!.image),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    child: Text(
                                      asset.name.assetName,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    child: Text(
                                        '残りの金額：${costFormat.format(asset.balanceAtNow().amount)}円'),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                                '元の金額：${costFormat.format(asset.cost.amount)}'),
                            Text(
                                '償却期間：${asset.depreciationPriodOfMonth.amount}ヶ月'),
                            Text(
                                '購入日：${dateFormat.format(asset.purchaseDate)}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
