import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final int id;
  final String added_by;
  final String name;
  final int user_id;
  final int category_id;
  final int sub_category_id;
  final int sub_sub_category_id;
  final int brand_id;
  final String photos;
  final String thumbnail_img;
  final String flash_deal_img;
  final String video_provider;
  final String video_link;
  final String tags;
  final String description;
  final String unit_price;
  final String purchase_price;
  final String choice_options;
  final String colors;
  final String variations;
  final String todays_deals;
  final String published;
  final String shop_status;
  final String featured;
  final String current_stock;
  final String discount;
  final String discount_type;
  final String tax;
  final String tax_type;
  final String shipping_type;
  final String shipping_cost;
  final String meta_title;
  final String whats_in_box;
  final String slug;
  final String sku;
  final String approval_status;
  final String num_of_sales;
  final String rating;

  Products({
    this.id,
    this.added_by,
    this.name,
    this.user_id,
    this.category_id,
    this.sub_category_id,
    this.sub_sub_category_id,
    this.brand_id,
    this.photos,
    this.thumbnail_img,
    this.flash_deal_img,
    this.video_provider,
    this.video_link,
    this.tags,
    this.description,
    this.unit_price,
    this.purchase_price,
    this.choice_options,
    this.colors,
    this.variations,
    this.todays_deals,
    this.published,
    this.shop_status,
    this.featured,
    this.current_stock,
    this.discount,
    this.discount_type,
    this.tax,
    this.tax_type,
    this.shipping_type,
    this.shipping_cost,
    this.meta_title,
    this.whats_in_box,
    this.slug,
    this.sku,
    this.approval_status,
    this.num_of_sales,
    this.rating,
  });
  @override
  List<Object> get props => [
        id,
        added_by,
        name,
        user_id,
        category_id,
        sub_category_id,
        sub_sub_category_id,
        brand_id,
        photos,
        thumbnail_img,
        flash_deal_img,
        video_provider,
        video_link,
        tags,
        description,
        unit_price,
        purchase_price,
        choice_options,
        colors,
        variations,
        todays_deals,
        published,
        shop_status,
        featured,
        current_stock,
        discount,
        discount_type,
        tax,
        tax_type,
        shipping_type,
        shipping_cost,
        meta_title,
        whats_in_box,
        slug,
        sku,
        approval_status,
        num_of_sales,
        rating,
      ];
}
