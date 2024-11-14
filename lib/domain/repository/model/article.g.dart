// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      id: json['id'] as String,
      title: json['name'] as String,
      city: City.fromJson(json['area'] as Map<String, dynamic>),
      company: Company.fromJson(json['employer'] as Map<String, dynamic>),
      salary: json['salary'] == null
          ? null
          : Salary.fromJson(json['salary'] as Map<String, dynamic>),
      description: json['description'] as String,
      logoUrls: LogoUrls.fromJson(json['logo_urls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'area': instance.city,
      'employer': instance.company,
      'salary': instance.salary,
      'description': instance.description,
      'logo_urls': instance.logoUrls,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      name: json['name'] as String,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'name': instance.name,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      name: json['name'] as String,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
    };

Salary _$SalaryFromJson(Map<String, dynamic> json) => Salary(
      from: (json['from'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$SalaryToJson(Salary instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'currency': instance.currency,
    };

LogoUrls _$LogoUrlsFromJson(Map<String, dynamic> json) => LogoUrls(
      original: json['original'] as String,
      small: json['90'] as String,
      medium: json['240'] as String,
    );

Map<String, dynamic> _$LogoUrlsToJson(LogoUrls instance) => <String, dynamic>{
      'original': instance.original,
      '240': instance.medium,
      '90': instance.small,
    };
