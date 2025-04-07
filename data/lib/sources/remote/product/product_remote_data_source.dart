import 'package:data/models/master_product_response.dart';

abstract class ProductRemoteDataSource {
  Future<MasterProductResponse> getProductById(String id);
}
