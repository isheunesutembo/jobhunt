// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyImpl _$$CompanyImplFromJson(Map json) => _$CompanyImpl(
      companyId: json['companyId'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      logo: json['logo'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      siteLink: json['siteLink'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'name': instance.name,
      'address': instance.address,
      'logo': instance.logo,
      'phoneNumber': instance.phoneNumber,
      'siteLink': instance.siteLink,
      'email': instance.email,
    };
