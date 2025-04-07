import 'package:data/mapper/category_offers_mapper.dart';
import 'package:data/mapper/hero_banners_mapper.dart';
import 'package:data/mapper/offer_banners_mapper.dart';
import 'package:data/sources/remote/home_remote_data_source.dart';
import 'package:di/di.dart';
import 'package:domain/models/category_offer_item.dart';
import 'package:domain/models/hero_banner_item.dart';
import 'package:domain/models/offer_banner_item.dart';
import 'package:domain/models/product_model.dart';
import 'package:domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._remoteDataSource);

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<List<HeroBannerItem>> getHomeHeroBanners() {
    return _remoteDataSource.getHeroBanners().then(
          (value) => HeroBannersMapper.mapToDomain(value),
        );
  }

  @override
  Future<List<CategoryOfferItem>> getCategoryOffers() {
    return _remoteDataSource.getCategoryOffers().then(
          (value) => CategoryOffersMapper.mapToDomain(value),
        );
  }

  @override
  Future<List<OfferBannerItem>> getOffersConfigList() {
    return _remoteDataSource.getOffersConfigList().then(
          (value) => OfferBannersMapper.mapToDomain(value),
        );
  }

  @override
  Future<String> getWelcomeReward() async {
    return "Welcome reward: 50% off";
  }

  @override
  Future<List<ProductModel>> getLatestProducts() async {
    return [
      ProductModel(
        id: "3493be73-4c82-4ea8-9d24-8c1e38d16cea",
        name: "Name",
        description: "Dunks 01, maroon red",
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/add3/8874/c14a0cbb4cd437d6779e0a5a18963f63?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ssp9f3D93efxesm6UFvruQs26qk2ZCfY1QMO-YioxubaeFahMinjf7713U7bY99Kvi5sPIPuOS6q1lUgr7fAznNOBVtwEU3qocJJio22T30AEH4Le6rORd8jvlxKtNJky2ivmew4swtMKsjfRFL83VttwOnuz1dkkcca97sHWsTYaQ2D6d-vgHYXSLYemHgeiZP71SkpWEdvIBmC8VKQ2uotOcV1YYb~ImxdRZejJiMd-AN7tEodOcVlpgSxuMt3NzFVTFATa60IkbxrxgIr4BV6jT27MNen~VIevuxlUF6pcMEjjWNkjHlbYjYnw~uYWks99BtP4FpcLLoDtAj-gQ__",
        price: 100,
        currency: "Tk",
      ),
      ProductModel(
        id: "1c46507e-2390-4409-b250-266fe5e36e7d",
        name: "Name",
        description: "Dunks 01, maroon red",
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/add3/8874/c14a0cbb4cd437d6779e0a5a18963f63?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ssp9f3D93efxesm6UFvruQs26qk2ZCfY1QMO-YioxubaeFahMinjf7713U7bY99Kvi5sPIPuOS6q1lUgr7fAznNOBVtwEU3qocJJio22T30AEH4Le6rORd8jvlxKtNJky2ivmew4swtMKsjfRFL83VttwOnuz1dkkcca97sHWsTYaQ2D6d-vgHYXSLYemHgeiZP71SkpWEdvIBmC8VKQ2uotOcV1YYb~ImxdRZejJiMd-AN7tEodOcVlpgSxuMt3NzFVTFATa60IkbxrxgIr4BV6jT27MNen~VIevuxlUF6pcMEjjWNkjHlbYjYnw~uYWks99BtP4FpcLLoDtAj-gQ__",
        price: 110,
        currency: "Tk",
      ),
      ProductModel(
        id: "b641bbda-6cf7-49fb-9b25-e09a1e5ad2a5",
        name: "Name",
        description: "Dunks 01, maroon red",
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/add3/8874/c14a0cbb4cd437d6779e0a5a18963f63?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ssp9f3D93efxesm6UFvruQs26qk2ZCfY1QMO-YioxubaeFahMinjf7713U7bY99Kvi5sPIPuOS6q1lUgr7fAznNOBVtwEU3qocJJio22T30AEH4Le6rORd8jvlxKtNJky2ivmew4swtMKsjfRFL83VttwOnuz1dkkcca97sHWsTYaQ2D6d-vgHYXSLYemHgeiZP71SkpWEdvIBmC8VKQ2uotOcV1YYb~ImxdRZejJiMd-AN7tEodOcVlpgSxuMt3NzFVTFATa60IkbxrxgIr4BV6jT27MNen~VIevuxlUF6pcMEjjWNkjHlbYjYnw~uYWks99BtP4FpcLLoDtAj-gQ__",
        price: 90,
        currency: "Tk",
      ),
      ProductModel(
        id: "8ccee0e3-4035-4c9a-bd75-3eec43587492",
        name: "Name",
        description: "The Nike Dunk Low",
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/add3/8874/c14a0cbb4cd437d6779e0a5a18963f63?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ssp9f3D93efxesm6UFvruQs26qk2ZCfY1QMO-YioxubaeFahMinjf7713U7bY99Kvi5sPIPuOS6q1lUgr7fAznNOBVtwEU3qocJJio22T30AEH4Le6rORd8jvlxKtNJky2ivmew4swtMKsjfRFL83VttwOnuz1dkkcca97sHWsTYaQ2D6d-vgHYXSLYemHgeiZP71SkpWEdvIBmC8VKQ2uotOcV1YYb~ImxdRZejJiMd-AN7tEodOcVlpgSxuMt3NzFVTFATa60IkbxrxgIr4BV6jT27MNen~VIevuxlUF6pcMEjjWNkjHlbYjYnw~uYWks99BtP4FpcLLoDtAj-gQ__",
        price: 200,
        currency: "Tk",
      ),
      ProductModel(
        id: "4a2505de-258e-4060-b43b-04894f1adac3",
        name: "Name",
        description: "The Nike Dunk Low",
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/add3/8874/c14a0cbb4cd437d6779e0a5a18963f63?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ssp9f3D93efxesm6UFvruQs26qk2ZCfY1QMO-YioxubaeFahMinjf7713U7bY99Kvi5sPIPuOS6q1lUgr7fAznNOBVtwEU3qocJJio22T30AEH4Le6rORd8jvlxKtNJky2ivmew4swtMKsjfRFL83VttwOnuz1dkkcca97sHWsTYaQ2D6d-vgHYXSLYemHgeiZP71SkpWEdvIBmC8VKQ2uotOcV1YYb~ImxdRZejJiMd-AN7tEodOcVlpgSxuMt3NzFVTFATa60IkbxrxgIr4BV6jT27MNen~VIevuxlUF6pcMEjjWNkjHlbYjYnw~uYWks99BtP4FpcLLoDtAj-gQ__",
        price: 200,
        currency: "Tk",
      ),
    ];
  }
}
