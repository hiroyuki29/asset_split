import 'package:asset_split/src/features/asset/data/local_asset_repository_impl.dart';
import 'package:asset_split/src/features/asset/presentation/asset_controller.dart';
import 'package:asset_split/src/features/asset/use_case/asset_use_case.dart';
import 'package:asset_split/src/features/user/presentation/current_user_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widget/async_value_widget.dart';
import '../../../common_widget/bottom_navigation_common.dart';
import '../../../constants.dart';
import '../../user/domain/value/money_amount.dart';
import '../domain/model/asset.dart';

class AssetHomeScreen extends ConsumerWidget {
  const AssetHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<int> currentUserId = ref.watch(currentUserStateProvider);
    final AsyncValue<AssetList> assetList = ref.watch(assetListStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('$currentUserId'),
      ),
      bottomNavigationBar: const BottomNavigationCommon(),
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
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '購入合計：${costFormat.format(assetList.value!.sumAllCost().amount)}円',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 270,
                      autoPlay: true,
                    ),
                    itemCount: assets.list.length,
                    itemBuilder: (context, itemIndex, pageViewIndex) {
                      final asset = assets.list[itemIndex];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onLongPress: () {
                            ref.read(assetUseCaseProvider).remove(asset!.id);
                          },
                          child: Column(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.topStart,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
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
                                        style: const TextStyle(
                                            color: Colors.black),
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
                              // Text(
                              //     '元の金額：${costFormat.format(asset.cost.amount)}'),
                              // Text('償却期間：${asset.depreciationPriodOfMonth}ヶ月'),
                              // Text(
                              //     '購入日：${dateFormat.format(asset.purchaseDate)}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('何円分がまんした？ボタンを押そう！'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                        onPressed: () async {
                          try {
                            ref
                                .read(assetUseCaseProvider)
                                .addPayment(add: Money(100), assetList: assets);
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: const Text(
                          '100円',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                        onPressed: () async {
                          try {
                            ref
                                .read(assetUseCaseProvider)
                                .addPayment(add: Money(200), assetList: assets);
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: const Text(
                          '200円',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                        onPressed: () async {
                          try {
                            ref
                                .read(assetUseCaseProvider)
                                .addPayment(add: Money(300), assetList: assets);
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: const Text(
                          '300円',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '一日当たりの目標償却：${costFormat.format(assetList.value!.sumRepaymentByDay().amount)}円',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
