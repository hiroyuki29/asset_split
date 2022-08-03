class AssetName {
  AssetName({required this.assetName}) {
    if (assetName.isEmpty) {
      throw Exception('no asset name');
    }
    if (assetName.length > 20) {
      throw Exception('too long name');
    }
  }
  String assetName;
}
