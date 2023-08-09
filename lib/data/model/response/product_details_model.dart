import 'package:medosedo_ecommerce/data/model/response/product_model.dart';
import 'package:medosedo_ecommerce/data/model/response/seller_model.dart';

class ProductDetailsModel {
  late  int _id;
  late String _addedBy;
  late int _userId;
  late  String _name;
  late  String _slug;
  late  String _productType;
  late List<CategoryIds> _categoryIds;
  late  int _brandId;
  late String _unit;
  late int _minQty;
  late int _refundable;
  late  String _digitalProductType;
  late String _digitalFileReady;
  late List<String> _images;
  late String _thumbnail;
  late int _featured;
  late String _videoProvider;
  late String _videoUrl;
  late List<Colors> _colors;
  late int _variantProduct;
  late List<int> _attributes;
  late List<ChoiceOptions> _choiceOptions;
  late List<Variation> _variation;
  late int _published;
  late double _unitPrice;
  late double _purchasePrice;
  late double _tax;
  late String _taxModel;
  late String _taxType;
  late double _discount;
  late String _discountType;
  late int _currentStock;
  late int _minimumOrderQty;
  late String _details;
  late int _freeShipping;
  late  String _createdAt;
  late String _updatedAt;
  late int _status;
  late int _featuredStatus;
  late String _metaTitle;
  late String _metaDescription;
  late String _metaImage;
  late int _requestStatus;
  late String _deniedNote;
  late double _shippingCost;
  late int _multiplyQty;
  late String _code;
  late int _reviewsCount;
  late String _averageReview;
  late List<Reviews> _reviews;
  late Seller _seller;


  ProductDetailsModel(
      {required int id,
        required String addedBy,
        required int userId,
        required String name,
        required String slug,
        required String productType,
        required List<CategoryIds> categoryIds,
        required int brandId,
        required String unit,
        required int minQty,
        required int refundable,
        required String digitalProductType,
        required String digitalFileReady,
        required List<String> images,
        required String thumbnail,
        required int featured,
        required String videoProvider,
        required String videoUrl,
        required List<Colors> colors,
        required int variantProduct,
        required List<int> attributes,
        required List<ChoiceOptions> choiceOptions,
        required List<Variation> variation,
        required int published,
        required double unitPrice,
        required double purchasePrice,
        required double tax,
        required String taxModel,
        required String taxType,
        required double discount,
        required String discountType,
        required int currentStock,
        required int minimumOrderQty,
        required String details,
        required int freeShipping,
        required String createdAt,
        required String updatedAt,
        required int status,
        required int featuredStatus,
        required String metaTitle,
        required String metaDescription,
        required String metaImage,
        required int requestStatus,
        required String deniedNote,
        required double shippingCost,
        required int multiplyQty,
        required String code,
        required int reviewsCount,
        required String averageReview,
        required List<Reviews> reviews,
        required Seller seller,
      }) {
    if (id != null) {
      this._id = id;
    }
    if (addedBy != null) {
      this._addedBy = addedBy;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (name != null) {
      this._name = name;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (productType != null) {
      this._productType = productType;
    }
    if (categoryIds != null) {
      this._categoryIds = categoryIds;
    }
    if (brandId != null) {
      this._brandId = brandId;
    }
    if (unit != null) {
      this._unit = unit;
    }
    if (minQty != null) {
      this._minQty = minQty;
    }
    if (refundable != null) {
      this._refundable = refundable;
    }
    if (digitalProductType != null) {
      this._digitalProductType = digitalProductType;
    }
    if (digitalFileReady != null) {
      this._digitalFileReady = digitalFileReady;
    }
    if (images != null) {
      this._images = images;
    }
    if (thumbnail != null) {
      this._thumbnail = thumbnail;
    }
    if (featured != null) {
      this._featured = featured;
    }

    if (videoProvider != null) {
      this._videoProvider = videoProvider;
    }
    if (videoUrl != null) {
      this._videoUrl = videoUrl;
    }
    if (colors != null) {
      this._colors = colors;
    }
    if (variantProduct != null) {
      this._variantProduct = variantProduct;
    }
    if (attributes != null) {
      this._attributes = attributes;
    }
    if (choiceOptions != null) {
      this._choiceOptions = choiceOptions;
    }
    if (variation != null) {
      this._variation = variation;
    }
    if (published != null) {
      this._published = published;
    }
    if (unitPrice != null) {
      this._unitPrice = unitPrice;
    }
    if (purchasePrice != null) {
      this._purchasePrice = purchasePrice;
    }
    if (tax != null) {
      this._tax = tax;
    }
    if (taxModel != null) {
      this._taxModel = taxModel;
    }
    if (taxType != null) {
      this._taxType = taxType;
    }
    if (discount != null) {
      this._discount = discount;
    }
    if (discountType != null) {
      this._discountType = discountType;
    }
    if (currentStock != null) {
      this._currentStock = currentStock;
    }
    if (minimumOrderQty != null) {
      this._minimumOrderQty = minimumOrderQty;
    }
    if (details != null) {
      this._details = details;
    }
    if (freeShipping != null) {
      this._freeShipping = freeShipping;
    }

    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (status != null) {
      this._status = status;
    }
    if (featuredStatus != null) {
      this._featuredStatus = featuredStatus;
    }
    if (metaTitle != null) {
      this._metaTitle = metaTitle;
    }
    if (metaDescription != null) {
      this._metaDescription = metaDescription;
    }
    if (metaImage != null) {
      this._metaImage = metaImage;
    }
    if (requestStatus != null) {
      this._requestStatus = requestStatus;
    }
    if (deniedNote != null) {
      this._deniedNote = deniedNote;
    }
    if (shippingCost != null) {
      this._shippingCost = shippingCost;
    }
    if (multiplyQty != null) {
      this._multiplyQty = multiplyQty;
    }
    if (code != null) {
      this._code = code;
    }
    if (reviewsCount != null) {
      this._reviewsCount = reviewsCount;
    }
    if (averageReview != null) {
      this._averageReview = averageReview;
    }
    if (reviews != null) {
      this._reviews = reviews;
    }
    if (seller != null) {
      this._seller = seller;
    }

  }

  int get id => _id;
  String get addedBy => _addedBy;
  int get userId => _userId;
  String get name => _name;
  String get slug => _slug;
  String get productType => _productType;
  List<CategoryIds> get categoryIds => _categoryIds;
  int get brandId => _brandId;
  String get unit => _unit;
  int get minQty => _minQty;
  int get refundable => _refundable;
  String get digitalProductType => _digitalProductType;
  String get digitalFileReady => _digitalFileReady;
  List<String> get images => _images;
  String get thumbnail => _thumbnail;
  int get featured => _featured;
  String get videoProvider => _videoProvider;
  String get videoUrl => _videoUrl;
  List<Colors> get colors => _colors;
  int get variantProduct => _variantProduct;
  List<int> get attributes => _attributes;
  List<ChoiceOptions> get choiceOptions => _choiceOptions;
  List<Variation> get variation => _variation;
  int get published => _published;
  double get unitPrice => _unitPrice;
  double get purchasePrice => _purchasePrice;
  double get tax => _tax;
  String get taxModel => _taxModel;
  String get taxType => _taxType;
  double get discount => _discount;
  String get discountType => _discountType;
  int get currentStock => _currentStock;
  int get minimumOrderQty => _minimumOrderQty;
  String get details => _details;
  int get freeShipping => _freeShipping;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get status => _status;
  int get featuredStatus => _featuredStatus;
  String get metaTitle => _metaTitle;
  String get metaDescription => _metaDescription;
  String get metaImage => _metaImage;
  int get requestStatus => _requestStatus;
  String get deniedNote => _deniedNote;
  double get shippingCost => _shippingCost;
  int get multiplyQty => _multiplyQty;
  String get code => _code;
  int get reviewsCount => _reviewsCount;
  String get averageReview => _averageReview;
  List<Reviews> get reviews => _reviews;
  Seller get seller => _seller;

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _addedBy = json['added_by'];
    _userId = json['user_id'];
    _name = json['name'];
    _slug = json['slug'];
    _productType = json['product_type'];
    if (json['category_ids'] != null) {
      _categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        _categoryIds.add(new CategoryIds.fromJson(v));
      });
    }
    _brandId = json['brand_id']??0;
    _unit = json['unit'];
    _minQty = json['min_qty'];
    _refundable = json['refundable'];
    _digitalProductType = json['digital_product_type']??'';
    _digitalFileReady = json['digital_file_ready']??'';
    _images = json['images'].cast<String>();
    _thumbnail = json['thumbnail'];
    _featured = json['featured']??0;
    _videoProvider = json['video_provider'];
    _videoUrl = json['video_url']??'';
    if (json['colors_formatted'] != null) {
      _colors = <Colors>[];
      json['colors_formatted'].forEach((v) {
        _colors.add(new Colors.fromJson(v));
      });
    }
    _variantProduct = int.parse(json['variant_product'].toString());
    _attributes = json['attributes'].cast<int>();
    if (json['choice_options'] != null) {
      _choiceOptions = <ChoiceOptions>[];
      json['choice_options'].forEach((v) {
        _choiceOptions.add(new ChoiceOptions.fromJson(v));
      });
    }
    if (json['variation'] != null) {
      _variation = <Variation>[];
      json['variation'].forEach((v) {
        _variation.add(new Variation.fromJson(v));
      });
    }
    _published = json['published'];
    _unitPrice = json['unit_price'].toDouble();
    _purchasePrice = json['purchase_price'].toDouble();
    _tax = json['tax'].toDouble();
    _taxModel = json['tax_model'];
    _taxType = json['tax_type'];
    _discount = json['discount'].toDouble();
    _discountType = json['discount_type'];
    _currentStock = json['current_stock'];
    if(json['minimum_order_qty'] != null){
      _minimumOrderQty = int.parse(json['minimum_order_qty'].toString());
    }else{
      _minimumOrderQty = 1;
    }

    _details = json['details'];
    _freeShipping = json['free_shipping'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _status = json['status'];
    _featuredStatus = json['featured_status'];
    _metaTitle = json['meta_title']??'';
    _metaDescription = json['meta_description']??'';
    _metaImage = json['meta_image'];
    _requestStatus = int.parse(json['request_status'].toString());
    _deniedNote = json['denied_note']??'';
    _shippingCost = json['shipping_cost'].toDouble();
    _multiplyQty = json['multiply_qty'];
    _code = json['code'];
    _reviewsCount = int.parse(json['reviews_count'].toString());
    _averageReview = json['average_review'].toString();
    if (json['reviews'] != null) {
      _reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        _reviews.add(new Reviews.fromJson(v));
      });
    }
    _seller = (json['seller'] != null ? new Seller.fromJson(json['seller']) : Seller())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['added_by'] = this._addedBy;
    data['user_id'] = this._userId;
    data['name'] = this._name;
    data['slug'] = this._slug;
    data['product_type'] = this._productType;
    if (this._categoryIds != null) {
      data['category_ids'] = this._categoryIds.map((v) => v.toJson()).toList();
    }
    data['brand_id'] = this._brandId;
    data['unit'] = this._unit;
    data['min_qty'] = this._minQty;
    data['refundable'] = this._refundable;
    data['digital_product_type'] = this._digitalProductType;
    data['digital_file_ready'] = this._digitalFileReady;
    data['images'] = this._images;
    data['thumbnail'] = this._thumbnail;
    data['featured'] = this._featured;
    data['video_provider'] = this._videoProvider;
    data['video_url'] = this._videoUrl;
    if (this._colors != null) {
      data['colors_formatted'] = this._colors.map((v) => v.toJson()).toList();
    }
    data['variant_product'] = this._variantProduct;
    data['attributes'] = this._attributes;
    if (this._choiceOptions != null) {
      data['choice_options'] =
          this._choiceOptions.map((v) => v.toJson()).toList();
    }
    if (this._variation != null) {
      data['variation'] = this._variation.map((v) => v.toJson()).toList();
    }
    data['published'] = this._published;
    data['unit_price'] = this._unitPrice;
    data['purchase_price'] = this._purchasePrice;
    data['tax'] = this._tax;
    data['tax_model'] = this._taxModel;
    data['tax_type'] = this._taxType;
    data['discount'] = this._discount;
    data['discount_type'] = this._discountType;
    data['current_stock'] = this._currentStock;
    data['minimum_order_qty'] = this._minimumOrderQty;
    data['details'] = this._details;
    data['free_shipping'] = this._freeShipping;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['status'] = this._status;
    data['featured_status'] = this._featuredStatus;
    data['meta_title'] = this._metaTitle;
    data['meta_description'] = this._metaDescription;
    data['meta_image'] = this._metaImage;
    data['request_status'] = this._requestStatus;
    data['denied_note'] = this._deniedNote;
    data['shipping_cost'] = this._shippingCost;
    data['multiply_qty'] = this._multiplyQty;
    data['code'] = this._code;
    data['reviews_count'] = this._reviewsCount;
    data['average_review'] = this._averageReview;
    if (this._reviews != null) {
      data['reviews'] = this._reviews.map((v) => v.toJson()).toList();
    }
    if (this._seller != null) {
      data['seller'] = this._seller.toJson();
    }

    return data;
  }
}

class CategoryIds {
  late String _id;
  late int _position;

  CategoryIds({required String id, required int position}) {
    if (id != null) {
      this._id = id;
    }
    if (position != null) {
      this._position = position;
    }
  }

  String get id => _id;
  int get position => _position;


  CategoryIds.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['position'] = this._position;
    return data;
  }
}

class Colors {
  late String _name;
  late String _code;

  Colors({required String name, required String code}) {
    if (name != null) {
      this._name = name;
    }
    if (code != null) {
      this._code = code;
    }
  }

  String get name => _name;
  String get code => _code;


  Colors.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['code'] = this._code;
    return data;
  }
}



class Reviews {
  late int _id;
  late int _productId;
  late  int _customerId;
  late  String _comment;
  late  String _attachment;
  late  int _rating;
  late int _status;
  late String _createdAt;
  late String _updatedAt;
  late Customer _customer;

  Reviews(
      {required int id,
        required int productId,
        required int customerId,
        required String comment,
        required String attachment,
        required int rating,
        required int status,
        required String createdAt,
        required String updatedAt,
        required Customer customer}) {
    if (id != null) {
      this._id = id;
    }
    if (productId != null) {
      this._productId = productId;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (comment != null) {
      this._comment = comment;
    }
    if (attachment != null) {
      this._attachment = attachment;
    }
    if (rating != null) {
      this._rating = rating;
    }
    if (status != null) {
      this._status = status;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (customer != null) {
      this._customer = customer;
    }
  }

  int get id => _id;
  int get productId => _productId;
  int get customerId => _customerId;
  String get comment => _comment;
  String get attachment => _attachment;
  int get rating => _rating;
  int get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  Customer get customer => _customer;


  Reviews.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _productId = json['product_id'];
    _customerId = json['customer_id'];
    _comment = json['comment'];
    _attachment = json['attachment'];
    _rating = json['rating'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _customer = (json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['product_id'] = this._productId;
    data['customer_id'] = this._customerId;
    data['comment'] = this._comment;
    data['attachment'] = this._attachment;
    data['rating'] = this._rating;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._customer != null) {
      data['customer'] = this._customer.toJson();
    }
    return data;
  }
}

class Customer {
  late int _id;
  late String _fName;
  late String _lName;
  late String _phone;
  late  String _image;
  late String _email;

  Customer(
      {required int id,
        required String fName,
        required String lName,
        required String phone,
        required String image,
        required String email,
      }) {
    if (id != null) {
      this._id = id;
    }
    if (fName != null) {
      this._fName = fName;
    }
    if (lName != null) {
      this._lName = lName;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (image != null) {
      this._image = image;
    }
    if (email != null) {
      this._email = email;
    }

  }

  int get id => _id;
  String get fName => _fName;
  String get lName => _lName;
  String get phone => _phone;
  String get image => _image;
  String get email => _email;


  Customer.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _fName = json['f_name'];
    _lName = json['l_name'];
    _phone = json['phone'];
    _image = json['image'];
    _email = json['email'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['f_name'] = this._fName;
    data['l_name'] = this._lName;
    data['phone'] = this._phone;
    data['image'] = this._image;
    data['email'] = this._email;

    return data;
  }
}
