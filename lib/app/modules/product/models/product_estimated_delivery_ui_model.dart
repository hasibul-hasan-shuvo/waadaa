class ProductEstimatedDeliveryUiModel {
  final String deliveryDays;
  final String savingAmount;
  final String currency;

  ProductEstimatedDeliveryUiModel({
    required this.deliveryDays,
    required this.savingAmount,
    required this.currency,
  });

  ProductEstimatedDeliveryUiModel.empty()
      : deliveryDays = '',
        savingAmount = '',
        currency = '';

  bool get isEmpty => deliveryDays.isEmpty;
}
