import 'package:medosedo_ecommerce/data/model/response/product_model.dart';

class CartModel {
  int? _id;
  int? _productId;
  String? _image;
  String? _name;
  String? _thumbnail;
  int? _sellerId;
  String? _sellerIs;
  String? _seller;
  double? _price;
  double? _discountedPrice;
  int? _quantity;
  int? _maxQuantity;
  String? _variant;
  String? _color;
  Variation? _variation;
  double? _discount;
  String? _discountType;
  double? _tax;
  String? _taxModel;
  String? _taxType;
  int? shippingMethodId;
  String? _cartGroupId;
  String? _shopInfo;
  List<ChoiceOptions>? _choiceOptions;
  List<int> _variationIndexes = [];
  double? _shippingCost;
  String? _shippingType;
  int? _minimumOrderQuantity;
  ProductInfo? _productInfo;
  String? _productType;
  String? _slug;

  CartModel(
      this._id,
      this._productId,
      this._thumbnail,
      this._name,
      this._seller,
      this._price,
      this._discountedPrice,
      this._quantity,
      this._maxQuantity,
      this._variant,
      this._color,
      this._variation,
      this._discount,
      this._discountType,
      this._tax,
      this._taxModel,
      this._taxType,
      this.shippingMethodId,
      this._cartGroupId,
      this._sellerId,
      this._sellerIs,
      this._image,
      this._shopInfo,
      this._choiceOptions,
      this._variationIndexes,
      this._shippingCost,
      this._minimumOrderQuantity,
      this._productType,
      this._slug);

  String get variant => _variant!;
  String get color => _color!;
  Variation? get variation => _variation;
  // ignore: unnecessary_getters_setters
  int get quantity => _quantity!;
  // ignore: unnecessary_getters_setters
  set quantity(int value) {
    _quantity = value;
  }

  int get maxQuantity => _maxQuantity!;
  double get price => _price!;
  double get discountedPrice => _discountedPrice!;
  String get name => _name!;
  String get seller => _seller!;
  String get image => _image!;
  int get id => _id!;
  int get productId => _productId!;
  double get discount => _discount!;
  String get discountType => _discountType!;
  double get tax => _tax!;
  String get taxModel => _taxModel!;
  String get taxType => _taxType!;
  String get cartGroupId => _cartGroupId!;
  String get sellerIs => _sellerIs!;
  int get sellerId => _sellerId!;
  String get thumbnail => _thumbnail!;
  String get shopInfo => _shopInfo!;
  List<ChoiceOptions> get choiceOptions => _choiceOptions!;
  List<int> get variationIndexes => _variationIndexes!;
  double get shippingCost => _shippingCost!;
  String get shippingType => _shippingType ?? '';
  int get minimumOrderQuantity => _minimumOrderQuantity!;
  ProductInfo get productInfo => _productInfo!;
  String get productType => _productType!;
  String get slug => _slug!;

  CartModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _productId = int.parse(json['product_id'].toString());
    _name = json['name'];
    _seller = json['seller'];
    _thumbnail = json['thumbnail'];
    _sellerId = int.parse(json['seller_id'].toString());
    _sellerIs = json['seller_is'];
    _image = json['image'];
    _price = json['price'].toDouble();
    _discountedPrice = json['discounted_price'];
    _quantity = int.parse(json['quantity'].toString());
    _maxQuantity = json['max_quantity'];
    _variant = json['variant'];
    _color = json['color'];
    _variation = json['variation'] != null
        ? Variation.fromJson(json['variation'])
        : Variation();
    _discount = json['discount'].toDouble();
    _discountType = json['discount_type'];
    _tax = json['tax'].toDouble();
    _taxModel = json['tax_model'];
    _taxType = json['tax_type'];
    shippingMethodId = json['shipping_method_id'];
    _cartGroupId = json['cart_group_id'];
    _shopInfo = json['shop_info'];
    if (json['choice_options'] != null) {
      _choiceOptions = [];
      json['choice_options'].forEach((v) {
        _choiceOptions!.add(new ChoiceOptions.fromJson(v));
      });
    }
    _variationIndexes = json['variation_indexes'] != null
        ? json['variation_indexes'].cast<int>()
        : [];
    if (json['shipping_cost'] != null) {
      _shippingCost = double.parse(json['shipping_cost'].toString());
    }
    if (json['shipping_type'] != null) {
      _shippingType = json['shipping_type'];
    }
    _productInfo = json['product'] != null
        ? new ProductInfo.fromJson(json['product'])
        : null;
    _productType = json['product_type'];
    _slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['product_id'] = this._productId;
    data['name'] = this._name;
    data['seller'] = this._seller;
    data['image'] = this._image;
    data['price'] = this._price;
    data['discounted_price'] = this._discountedPrice;
    data['quantity'] = this._quantity;
    data['max_quantity'] = this._maxQuantity;
    data['variant'] = this._variant;
    data['color'] = this._color;
    data['variation'] = this._variation;

    data['discount'] = this._discount;
    data['discount_type'] = this._discountType;
    data['tax'] = this._tax;
    data['tax_model'] = this._taxModel;
    data['tax_type'] = this._taxType;
    data['shipping_method_id'] = this.shippingMethodId;
    data['cart_group_id'] = this._cartGroupId;
    data['thumbnail'] = this._thumbnail;
    data['seller_id'] = this._sellerId;
    data['seller_is'] = this._sellerIs;
    data['shop_info'] = this._shopInfo;
    if (this._choiceOptions != null) {
      data['choice_options'] =
          this._choiceOptions!.map((v) => v.toJson()).toList();
    }
    data['variation_indexes'] = this._variationIndexes;
    data['shipping_cost'] = this._shippingCost;
    data['_shippingType'] = this._shippingType;
    data['product_type'] = this._productType;
    data['slug'] = this._slug;

    return data;
  }
}

class ProductInfo {
  int? id;
  String? addedBy;
  int? userId;
  String? name;
  String? slug;
  String? productType;
  String? categoryIds;
  dynamic brandId;
  String? taxModel;
  String? unit;
  int? minQty;
  int? refundable;
  dynamic digitalProductType;
  dynamic digitalFileReady;
  String? images;
  String? thumbnail;
  int? featured;
  dynamic flashDeal;
  String? videoProvider;
  dynamic videoUrl;
  String? colors;
  String? variantProduct;
  String? attributes;
  String? choiceOptions;
  int? published;
  dynamic unitPrice;
  int? purchasePrice;
  int? tax;
  dynamic taxType;
  int? discount;
  String? discountType;
  int? currentStock;
  String? minimumOrderQty;
  String? details;
  int? freeShipping;
  dynamic attachment;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? status;
  String? colorImage;
  int? featuredStatus;
  dynamic metaTitle;
  dynamic metaDescription;
  String? metaImage;
  String? requestStatus;
  dynamic deniedNote;
  int? shippingCost;
  int? multiplyQty;
  dynamic tempShippingCost;
  dynamic isShippingCostUpdated;
  String? code;
  String? reviewsCount;
  String? sellerPhone;
  int? totalCurrentStock;
  Seller? seller;
  List<dynamic>? translations;
  List<dynamic>? reviews;

  ProductInfo({
    this.id,
    this.addedBy,
    this.userId,
    this.name,
    this.slug,
    this.productType,
    this.categoryIds,
    this.brandId,
    this.taxModel,
    this.unit,
    this.minQty,
    this.refundable,
    this.digitalProductType,
    this.digitalFileReady,
    this.images,
    this.thumbnail,
    this.featured,
    this.flashDeal,
    this.videoProvider,
    this.videoUrl,
    this.colors,
    this.variantProduct,
    this.attributes,
    this.choiceOptions,
    this.published,
    this.unitPrice,
    this.purchasePrice,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.currentStock,
    this.minimumOrderQty,
    this.details,
    this.freeShipping,
    this.attachment,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.colorImage,
    this.featuredStatus,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.requestStatus,
    this.deniedNote,
    this.shippingCost,
    this.multiplyQty,
    this.tempShippingCost,
    this.isShippingCostUpdated,
    this.code,
    this.reviewsCount,
    this.sellerPhone,
    this.totalCurrentStock,
    this.seller,
    this.translations,
    this.reviews,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) => ProductInfo(
        id: json["id"],
        addedBy: json["added_by"],
        userId: json["user_id"],
        name: json["name"],
        slug: json["slug"],
        productType: json["product_type"],
        categoryIds: json["category_ids"],
        brandId: json["brand_id"],
        taxModel: json["tax_model"],
        unit: json["unit"],
        minQty: json["min_qty"],
        refundable: json["refundable"],
        digitalProductType: json["digital_product_type"],
        digitalFileReady: json["digital_file_ready"],
        images: json["images"],
        thumbnail: json["thumbnail"],
        featured: json["featured"],
        flashDeal: json["flash_deal"],
        videoProvider: json["video_provider"],
        videoUrl: json["video_url"],
        colors: json["colors"],
        variantProduct: json["variant_product"],
        attributes: json["attributes"],
        choiceOptions: json["choice_options"],
        published: json["published"],
        unitPrice: json["unit_price"],
        purchasePrice: json["purchase_price"],
        tax: json["tax"],
        taxType: json["tax_type"],
        discount: json["discount"],
        discountType: json["discount_type"],
        currentStock: json["current_stock"],
        minimumOrderQty: json["minimum_order_qty"],
        details: json["details"],
        freeShipping: json["free_shipping"],
        attachment: json["attachment"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        status: json["status"],
        colorImage: json["color_image"],
        featuredStatus: json["featured_status"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaImage: json["meta_image"],
        requestStatus: json["request_status"],
        deniedNote: json["denied_note"],
        shippingCost: json["shipping_cost"],
        multiplyQty: json["multiply_qty"],
        tempShippingCost: json["temp_shipping_cost"],
        isShippingCostUpdated: json["is_shipping_cost_updated"],
        code: json["code"],
        reviewsCount: json["reviews_count"],
        sellerPhone: json["seller_phone"],
        totalCurrentStock: json["total_current_stock"],
        seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        reviews: json["reviews"] == null
            ? []
            : List<dynamic>.from(json["reviews"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "added_by": addedBy,
        "user_id": userId,
        "name": name,
        "slug": slug,
        "product_type": productType,
        "category_ids": categoryIds,
        "brand_id": brandId,
        "tax_model": taxModel,
        "unit": unit,
        "min_qty": minQty,
        "refundable": refundable,
        "digital_product_type": digitalProductType,
        "digital_file_ready": digitalFileReady,
        "images": images,
        "thumbnail": thumbnail,
        "featured": featured,
        "flash_deal": flashDeal,
        "video_provider": videoProvider,
        "video_url": videoUrl,
        "colors": colors,
        "variant_product": variantProduct,
        "attributes": attributes,
        "choice_options": choiceOptions,
        "published": published,
        "unit_price": unitPrice,
        "purchase_price": purchasePrice,
        "tax": tax,
        "tax_type": taxType,
        "discount": discount,
        "discount_type": discountType,
        "current_stock": currentStock,
        "minimum_order_qty": minimumOrderQty,
        "details": details,
        "free_shipping": freeShipping,
        "attachment": attachment,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
        "color_image": colorImage,
        "featured_status": featuredStatus,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_image": metaImage,
        "request_status": requestStatus,
        "denied_note": deniedNote,
        "shipping_cost": shippingCost,
        "multiply_qty": multiplyQty,
        "temp_shipping_cost": tempShippingCost,
        "is_shipping_cost_updated": isShippingCostUpdated,
        "code": code,
        "reviews_count": reviewsCount,
        "seller_phone": sellerPhone,
        "total_current_stock": totalCurrentStock,
        "seller": seller?.toJson(),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
      };
}

class Seller {
  int? id;
  String? phone;

  Seller({
    this.id,
    this.phone,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
      };
}
