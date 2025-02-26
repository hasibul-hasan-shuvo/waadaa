import 'package:data/models/master_product_response.dart';
import 'package:data/sources/remote/base/base_remote_data_source.dart';
import 'package:data/sources/remote/clients/end_points.dart';
import 'package:data/sources/remote/clients/models/NetworkResponse.dart';
import 'package:data/sources/remote/product/product_remote_data_source.dart';
import 'package:di/di.dart';

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl extends BaseRemoteDataSource
    implements ProductRemoteDataSource {
  ProductRemoteDataSourceImpl(super.client);

  @override
  Future<MasterProductResponse> getProductById(String id) {
    try {
      final apiCall = client.get('${EndPoints.product}/$id/');

      return callApiWithErrorParser(apiCall).then(_parseProductResponse);
    } catch (_) {
      rethrow;
    }
  }

  MasterProductResponse _parseProductResponse(NetworkResponse response) {
    return MasterProductResponse.fromJson(response.data);
  }
}
