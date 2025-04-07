import 'package:domain/models/product/product.dart';
import 'package:domain/models/product/product_variant.dart';

class ProductWithVariantsMapTable {
  ProductWithVariantsMapTable({
    required this.product,
    required this.sizeChartUrl,
    required this.colorImages,
    required this.variantsMapTable,
  });

  final Product product;
  final String sizeChartUrl;
  final Map<String, List<String>> colorImages;
  final Map<String, List<ProductVariant>> variantsMapTable;
}
