import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application/domain/repository/model/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Переход к подробной странице вакансии, передаем объект через extra
        context.push('/home/article/${article.id}', extra: article);
      },
      borderRadius: BorderRadius.circular(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Логотип компании
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              article.logoUrls.small, 
              width: MediaQuery.of(context).size.width * 0.25, 
              height: MediaQuery.of(context).size.width * 0.25, 
              fit: BoxFit.cover, 
            ),
          ),
          const SizedBox(width: 20), // Отступ
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Название вакансии
                Text(
                  article.title, // Используем название вакансии
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5), // Отступ между текстами
                // Зарплата
                Text(
                  _getSalaryText(article.salary), // Функция для отображения зарплаты
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 5), // Отступ
                // Город и Компания
                Text(
                  '${article.city.name}, ${article.company.name}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Функция для обработки отображения зарплаты
  String _getSalaryText(Salary? salary) {
    if (salary == null) {
      return 'Зарплата не указана';
    } else {
      final from = salary.from != null ? '${salary.from} ${salary.currency}' : '';
      final to = salary.to != null ? '${salary.to} ${salary.currency}' : '';
      if (from.isNotEmpty && to.isNotEmpty) {
        return '$from - $to';
      } else if (from.isNotEmpty) {
        return '$from и выше';
      } else if (to.isNotEmpty) {
        return 'До $to';
      } else {
        return 'Зарплата не указана';
      }
    }
  }
}