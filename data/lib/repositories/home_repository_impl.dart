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
    await Future.delayed(Duration(seconds: 1));
    return [
      ProductModel(
        id: "1",
        name: "Name",
        description: "The Nike Dunk Low is an easy score for your wardrobe",
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/b7fa/1ba1/39595175b7da98ffbb7d72f7e483b55a?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=N~j06V8Nk45n93H2Kj5ujegZH1WjMPTYsH8367deGqtoGGumVJ1f-25RNTkCPdGuDKPTxBFKOo7x2zA0NPIBBY2v7R9SbGN~cQjxE93Au3QXSHGIU~huQwmF0jMgiPQzn2ilRhXEUmo8ST3S0jr-Wd5no0pAErtLDzMuVUFlngV8rRF2yHAksS47GwrEZ277JbIT2yz02MMLW67WC2YKFww83ExFejWkKzZM3DaW6fF9ST0CNQbl1C79XRGcEJ7HlLDe5XAjcBcF~FZG~VXYg8EIBwSoNhofSw-WRZc59xoYw5-KXclu~dSYBwNcH9lKWk6yHXYrdbRiRvAvkqEBgA__",
        price: 100,
        currency: "Tk",
      ),
      ProductModel(
        id: "1",
        name: "Name",
        description: "The Nike Dunk Low is an easy score for your wardrobe",
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/b7fa/1ba1/39595175b7da98ffbb7d72f7e483b55a?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=N~j06V8Nk45n93H2Kj5ujegZH1WjMPTYsH8367deGqtoGGumVJ1f-25RNTkCPdGuDKPTxBFKOo7x2zA0NPIBBY2v7R9SbGN~cQjxE93Au3QXSHGIU~huQwmF0jMgiPQzn2ilRhXEUmo8ST3S0jr-Wd5no0pAErtLDzMuVUFlngV8rRF2yHAksS47GwrEZ277JbIT2yz02MMLW67WC2YKFww83ExFejWkKzZM3DaW6fF9ST0CNQbl1C79XRGcEJ7HlLDe5XAjcBcF~FZG~VXYg8EIBwSoNhofSw-WRZc59xoYw5-KXclu~dSYBwNcH9lKWk6yHXYrdbRiRvAvkqEBgA__",
        price: 100,
        currency: "Tk",
      ),
      ProductModel(
        id: "1",
        name: "Name",
        description: "The Nike Dunk Low is an easy score for your wardrobe",
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/b7fa/1ba1/39595175b7da98ffbb7d72f7e483b55a?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=N~j06V8Nk45n93H2Kj5ujegZH1WjMPTYsH8367deGqtoGGumVJ1f-25RNTkCPdGuDKPTxBFKOo7x2zA0NPIBBY2v7R9SbGN~cQjxE93Au3QXSHGIU~huQwmF0jMgiPQzn2ilRhXEUmo8ST3S0jr-Wd5no0pAErtLDzMuVUFlngV8rRF2yHAksS47GwrEZ277JbIT2yz02MMLW67WC2YKFww83ExFejWkKzZM3DaW6fF9ST0CNQbl1C79XRGcEJ7HlLDe5XAjcBcF~FZG~VXYg8EIBwSoNhofSw-WRZc59xoYw5-KXclu~dSYBwNcH9lKWk6yHXYrdbRiRvAvkqEBgA__",
        price: 100,
        currency: "Tk",
      ),
      ProductModel(
        id: "1",
        name: "Name",
        description: "The Nike Dunk Low is an easy score for your wardrobe",
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/b7fa/1ba1/39595175b7da98ffbb7d72f7e483b55a?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=N~j06V8Nk45n93H2Kj5ujegZH1WjMPTYsH8367deGqtoGGumVJ1f-25RNTkCPdGuDKPTxBFKOo7x2zA0NPIBBY2v7R9SbGN~cQjxE93Au3QXSHGIU~huQwmF0jMgiPQzn2ilRhXEUmo8ST3S0jr-Wd5no0pAErtLDzMuVUFlngV8rRF2yHAksS47GwrEZ277JbIT2yz02MMLW67WC2YKFww83ExFejWkKzZM3DaW6fF9ST0CNQbl1C79XRGcEJ7HlLDe5XAjcBcF~FZG~VXYg8EIBwSoNhofSw-WRZc59xoYw5-KXclu~dSYBwNcH9lKWk6yHXYrdbRiRvAvkqEBgA__",
        price: 100,
        currency: "Tk",
      ),
    ];
  }
}
