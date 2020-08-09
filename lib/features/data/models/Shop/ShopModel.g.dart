// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShopModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopModel _$ShopModelFromJson(Map<String, dynamic> json) {
  return ShopModel(
    shop_name: json['shop_name'] as String,
    shop_address: json['shop_address'] as String,
    shop_number: json['shop_number'] as String,
    allow_imports: json['allow_imports'] as String,
    bank_account: json['bank_account'] as String,
    bank_name: json['bank_name'] as String,
    bank_user_name: json['bank_user_name'] as String,
    mpesa_number: json['mpesa_number'] as String,
  );
}

Map<String, dynamic> _$ShopModelToJson(ShopModel instance) => <String, dynamic>{
      'shop_name': instance.shop_name,
      'shop_address': instance.shop_address,
      'shop_number': instance.shop_number,
      'allow_imports': instance.allow_imports,
      'bank_account': instance.bank_account,
      'bank_name': instance.bank_name,
      'bank_user_name': instance.bank_user_name,
      'mpesa_number': instance.mpesa_number,
    };
