import 'package:flutter/material.dart';
import 'package:vively/models/asset.dart';
import 'package:vively/models/assetAr.dart';

class AssetProvider extends ChangeNotifier {
  List<Asset> getAssets(Locale locale) {
    return locale.languageCode == 'ar' ? myAssetsAr : myAssets;
  }

  List<Asset> getFeedAssets(Locale locale) {
    // You'll need to create feedAssetsAr similar to myAssetsAr
    return locale.languageCode == 'ar' ? feedAssetsAr : feedAssets;
  }
}
