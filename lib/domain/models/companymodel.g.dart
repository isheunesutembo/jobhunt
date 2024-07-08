// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companymodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyModelImpl _$$CompanyModelImplFromJson(Map<String, dynamic> json) =>
    _$CompanyModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      logo: json['logo'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      siteLink: json['siteLink'] as String?,
      email: json['email'] as String,
      approved: json['approved'] as bool?,
    );

Map<String, dynamic> _$$CompanyModelImplToJson(_$CompanyModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'logo': instance.logo,
      'phoneNumber': instance.phoneNumber,
      'siteLink': instance.siteLink,
      'email': instance.email,
      'approved': instance.approved,
    };
