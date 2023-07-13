import 'package:presentation/generated/assets.gen.dart';

extension AssetsGen on Assets {
  static const packageName = 'packages/presentation';
  //static const imagesFolder = '$packageName/assets/images';

  static String getRawString(String assetName) {
    if (assetName.contains(packageName)) {
      return assetName;
    }
    return '$packageName/$assetName';
  }
}
