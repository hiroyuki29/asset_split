import 'package:asset_split/src/features/asset/presentation/asset_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widget/async_value_widget.dart';
import '../domain/model/asset.dart';
import 'add_new_asset_screen.dart';

class AssetHomeScreen extends ConsumerWidget {
  const AssetHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AssetList> assetList = ref.watch(assetStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset split'),
      ),
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
                    )));
          }),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('登録アイテム'),
          ),
          Expanded(
            child: AsyncValueWidget<AssetList>(
              value: assetList,
              data: (assets) => assets.list.isEmpty
                  ? Center(
                      child: Text(
                        'No products found',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    )
                  : ListView.builder(
                      itemCount: assets.list.length,
                      itemBuilder: (context, index) {
                        final asset = assets.list[index];
                        return ListTile(
                          trailing: Image.memory(asset!.image),
                          title: Text(
                            asset.name.assetName,
                          ),
                          onTap: () {
                            ref
                                .read(assetStateProvider.notifier)
                                .remove(asset.id);
                          },
                        );
                      }),
            ),
          ),
        ],
      ),
    );
  }
}
