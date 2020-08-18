// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) {
  return ProductsModel(
    id: json['id'] as int,
    added_by: json['added_by'] as String,
    name: json['name'] as String,
    user_id: json['user_id'] as int,
    category_id: json['category_id'] as int,
    sub_category_id: json['sub_category_id'] as int,
    sub_sub_category_id: json['sub_sub_category_id'] as int,
    brand_id: json['brand_id'] as int,
    photos: json['photos'] as String,
    thumbnail_img: json['thumbnail_img'] as String,
    flash_deal_img: json['flash_deal_img'] as String,
    video_provider: json['video_provider'] as String,
    video_link: json['video_link'] as String,
    tags: json['tags'] as String,
    description: json['description'] as String,
    unit_price: json['unit_price'] as String,
    purchase_price: json['purchase_price'] as String,
    choice_options: json['choice_options'] as String,
    colors: json['colors'] as String,
    variations: json['variations'] as String,
    todays_deals: json['todays_deals'] as String,
    published: json['published'] as String,
    shop_status: json['shop_status'] as String,
    featured: json['featured'] as String,
    current_stock: json['current_stock'] as String,
    discount: json['discount'] as String,
    discount_type: json['discount_type'] as String,
    tax: json['tax'] as String,
    tax_type: json['tax_type'] as String,
    shipping_type: json['shipping_type'] as String,
    shipping_cost: json['shipping_cost'] as String,
    meta_title: json['meta_title'] as String,
    whats_in_box: json['whats_in_box'] as String,
    slug: json['slug'] as String,
    sku: json['sku'] as String,
    approval_status: json['approval_status'] as String,
    num_of_sales: json['num_of_sales'] as String,
    rating: json['rating'] as String,
  );
}

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'added_by': instance.added_by,
      'name': instance.name,
      'user_id': instance.user_id,
      'category_id': instance.category_id,
      'sub_category_id': instance.sub_category_id,
      'sub_sub_category_id': instance.sub_sub_category_id,
      'brand_id': instance.brand_id,
      'photos': instance.photos,
      'thumbnail_img': instance.thumbnail_img,
      'flash_deal_img': instance.flash_deal_img,
      'video_provider': instance.video_provider,
      'video_link': instance.video_link,
      'tags': instance.tags,
      'description': instance.description,
      'unit_price': instance.unit_price,
      'purchase_price': instance.purchase_price,
      'choice_options': instance.choice_options,
      'colors': instance.colors,
      'variations': instance.variations,
      'todays_deals': instance.todays_deals,
      'published': instance.published,
      'shop_status': instance.shop_status,
      'featured': instance.featured,
      'current_stock': instance.current_stock,
      'discount': instance.discount,
      'discount_type': instance.discount_type,
      'tax': instance.tax,
      'tax_type': instance.tax_type,
      'shipping_type': instance.shipping_type,
      'shipping_cost': instance.shipping_cost,
      'meta_title': instance.meta_title,
      'whats_in_box': instance.whats_in_box,
      'slug': instance.slug,
      'sku': instance.sku,
      'approval_status': instance.approval_status,
      'num_of_sales': instance.num_of_sales,
      'rating': instance.rating,
    };
