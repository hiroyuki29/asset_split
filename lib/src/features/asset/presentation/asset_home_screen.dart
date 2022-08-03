import 'package:asset_split/src/features/asset/use_case/asset_use_case.dart';
import 'package:asset_split/src/features/user/presentation/current_user_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common_widget/async_value_widget.dart';
import '../../../common_widget/bottom_navigation_common.dart';
import '../../../constants.dart';
import '../../user/domain/model/user.dart';
import '../../user/domain/value/money_amount.dart';
import '../domain/local_asset_repository.dart';
import '../domain/model/asset.dart';

class AssetHomeScreen extends ConsumerStatefulWidget {
  const AssetHomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AssetHomeScreenState();
}

class _AssetHomeScreenState extends ConsumerState<AssetHomeScreen> {
  int _indicatorNumber = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final AsyncValue<User?> currentUserId = ref.watch(currentUserStateProvider);
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
                    carouselController: _controller,
                    options: CarouselOptions(
                        height: 250,
                        autoPlay: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _indicatorNumber = index;
                          });
                        }),
                    itemCount: assets.list.length,
                    itemBuilder: (context, itemIndex, pageViewIndex) {
                      final asset = assets.list[itemIndex];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: SizedBox(
                                child: Container(
                                  width: 280,
                                  height: 280,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.memory(asset!.image).image,
                                    ),
                                  ),
                                ),
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
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        assetList.value!.list.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(_indicatorNumber == entry.key
                                      ? 0.9
                                      : 0.4)),
                        ),
                      );
                    }).toList(),
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
