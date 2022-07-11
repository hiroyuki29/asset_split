import 'package:asset_split/src/common_widget/async_value_widget.dart';
import 'package:asset_split/src/features/asset/presentation/asset_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widget/bottom_navigation_common.dart';
import '../../../constants.dart';
import '../domain/model/asset.dart';
import 'add_new_asset_screen.dart';

class AssetListScreen extends ConsumerWidget {
  const AssetListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AssetList> assetList = ref.watch(assetStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset split'),
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
                child: AddNewAssetScreen(),
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
                  'No Assets found',
                  style: Theme.of(context).textTheme.headline4,
                ),
              )
            : ListView.builder(
                itemCount: assets.list.length,
                itemBuilder: (context, itemIndex) {
                  final asset = assets.list[itemIndex];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onLongPress: () {
                        ref.read(assetStateProvider.notifier).remove(asset!.id);
                      },
                      child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: SizedBox(
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
                                    style: const TextStyle(color: Colors.black),
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
                          Text('元の金額：${costFormat.format(asset.cost.amount)}'),
                          Text('償却期間：${asset.depreciationPriodOfMonth}ヶ月'),
                          Text('購入日：${dateFormat.format(asset.purchaseDate)}'),
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
