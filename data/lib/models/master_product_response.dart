import 'package:data/models/category_response.dart';
import 'package:data/models/image_response.dart';

class MasterProductResponse {
  MasterProductResponse.fromJson(dynamic json) {
    product = json['product'] != null
        ? ProductResponse.fromJson(json['product'])
        : null;
  }

  ProductResponse? product;
}

class ProductResponse {
  ProductResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isOverseas = json['is_overseas'];
    productType = json['product_type'];
    manufacturer = json['manufacturer'];
    warrantyPolicy = json['warranty_policy'];
    returnPolicy = json['return_policy'];
    usagePrecaution = json['usage_precaution'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(CategoryResponse.fromJson(v));
      });
    }
    brand = json['brand'];
    approvalStatus = json['approval_status'];
    slug = json['slug'];
    shippingInformation = json['shipping_information'];
    if (json['attributes'] != null) {
      variants = [];
      json['attributes'].forEach((v) {
        variants?.add(VariantsResponse.fromJson(v));
      });
    }
    averageRating = json['average_rating'];
    if (json['product_files'] != null) {
      images = [];
      json['product_files'].forEach((v) {
        images?.add(ImageResponse.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variantMappings = [];
      json['variants'].forEach((v) {
        variantMappings?.add(ProductVariantResponse.fromJson(v));
      });
    }
  }
  String? id;
  String? name;
  String? description;
  bool? isOverseas;
  String? productType;
  String? manufacturer;
  String? warrantyPolicy;
  String? returnPolicy;
  String? usagePrecaution;
  List<CategoryResponse>? categories;
  String? brand;
  String? approvalStatus;
  String? slug;
  String? shippingInformation;
  List<VariantsResponse>? variants;
  double? averageRating;
  List<ImageResponse>? images;
  List<ProductVariantResponse>? variantMappings;
}

class ProductVariantResponse {
  ProductVariantResponse.fromJson(dynamic json) {
    id = json['id'];
    if (json['attribute_values'] != null) {
      attributeValues = [];
      json['attribute_values'].forEach((v) {
        attributeValues?.add(ProductVariantAttributeResponse.fromJson(v));
      });
    }
    waadaaSku = json['waadaa_sku'];
    currency = json['currency'];
    retailPrice = json['retail_price'];
    description = json['description'];
    estimatedDeliveryTime = json['estimated_delivery_time'];
    isWaadaaApproved = json['is_waadaa_approved'];
    initialStockQuantity = json['initial_stock_quantity'];
    availableStockQuantity = json['available_stock_quantity'];
    masterProduct = json['master_product'];
    attributeValue = json['attribute_value'] != null
        ? json['attribute_value'].cast<String>()
        : [];
    colorImages = [];

    if (json['color_images'] != null) {
      json['color_images'].forEach((v) {
        colorImages?.add(v['url']);
      });
    }
  }
  String? id;
  List<ProductVariantAttributeResponse>? attributeValues;
  String? waadaaSku;
  String? currency;
  double? retailPrice;
  String? description;
  int? estimatedDeliveryTime;
  bool? isWaadaaApproved;
  int? initialStockQuantity;
  int? availableStockQuantity;
  String? masterProduct;
  List<String>? attributeValue;
  List<String>? colorImages;
}

class ProductVariantAttributeResponse {
  ProductVariantAttributeResponse.fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      name = json.keys.first;
      value = json.values.first.toString();
    } else {
      name = '';
      value = '';
    }
  }

  String? name;
  String? value;
}

class VariantsResponse {
  VariantsResponse.fromJson(dynamic json) {
    name = json['name'];
    values = json['values'] != null ? json['values'].cast<String>() : [];
  }

  String? name;
  List<String>? values;
}
