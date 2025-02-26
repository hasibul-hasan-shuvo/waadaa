import 'package:domain/models/product/product.dart';

class ProductWithVariantsMapTable {
  ProductWithVariantsMapTable({
    required this.product,
    required this.variantsMapTable,
  });

  final Product product;
  final Map variantsMapTable;
}
