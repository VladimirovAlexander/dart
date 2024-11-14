import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  Article({
    required this.id,
    required this.title,
    required this.city,
    required this.company,
    required this.salary,
    required this.description,
    required this.logoUrls,
  });

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name') // Название вакансии
  final String title;

  @JsonKey(name: 'area') // Объект города
  final City city;

  @JsonKey(name: 'employer') // Объект работодателя (компании)
  final Company company;

  @JsonKey(name: 'salary') // Объект зарплаты
  final Salary? salary;

  final String description; // Описание вакансии
  
  @JsonKey(name: 'logo_urls') // Логотипы компании
  final LogoUrls logoUrls;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] as String? ?? '',
      title: json['name'] as String? ?? 'No title',
      city: City.fromJson(json['area'] ?? {}),
      company: Company.fromJson(json['employer'] ?? {}),
      salary: json['salary'] != null ? Salary.fromJson(json['salary']) : null,
       description: json['snippet'] != null 
        ? json['snippet']['responsibility'] as String? ?? 'No description' 
        : 'No description',
      logoUrls: LogoUrls.fromJson(json['employer']['logo_urls'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class City {
  City({
    required this.name,
  });

  final String name;

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'] as String? ?? 'Unknown city',
    );
  }

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Company {
  Company({
    required this.name,
  });

  final String name;

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] as String? ?? 'Unknown company',
    );
  }

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class Salary {
  Salary({
    this.from,
    this.to,
    this.currency,
  });

  final int? from;
  final int? to;
  final String? currency;

  factory Salary.fromJson(Map<String, dynamic> json) {
    return Salary(
      from: json['from'] as int?,
      to: json['to'] as int?,
      currency: json['currency'] as String?,
    );
  }

  Map<String, dynamic> toJson() => _$SalaryToJson(this);
}

@JsonSerializable()
class LogoUrls {
  LogoUrls({
    required this.original,
    required this.small,
    required this.medium,
  });

  @JsonKey(name: 'original')
  final String original;

  @JsonKey(name: '240')
  final String medium;

  @JsonKey(name: '90')
  final String small;

  factory LogoUrls.fromJson(Map<String, dynamic> json) {
    return LogoUrls(
      original: json['original'] as String? ?? '',
      medium: json['240'] as String? ?? '',
      small: json['90'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => _$LogoUrlsToJson(this);
}