class ProductPriceUiModel {
  final String price;
  final String discountPrice;
  final String discount;
  final String currency;

  ProductPriceUiModel({
    required this.price,
    required this.discountPrice,
    required this.discount,
    required this.currency,
  });

  ProductPriceUiModel.empty()
      : price = '',
        discountPrice = '',
        discount = '',
        currency = '';

  bool get isEmpty =>
      price.isEmpty && discountPrice.isEmpty && discount.isEmpty;
}
