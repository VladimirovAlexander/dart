import 'package:flutter/material.dart';
import 'package:flutter_application/domain/repository/model/article.dart'; // Импортируем модель Article

class DetailsScreen extends StatelessWidget {
  final Article? article;

  // Конструктор принимает объект Article
  const DetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    // Если article не передан, можно вывести сообщение об ошибке
    if (article == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Ошибка'),
        ),
        body: const Center(
          child: Text('Данные о вакансии не найдены'),
        ),
      );
    }

    // Если объект article передан, отображаем его данные
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Детали вакансии'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Область для изображения (например, логотип компании)
            Container(
              height: 200,
              color: Colors.grey[300], // Серый фон для изображения
              child: Image.network(
                article!.logoUrls.original, // Логотип компании
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Название вакансии
            Text(
              article!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            // Город
            Text(
              'Город: ${article!.city.name}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            // Название компании
            Text(
              'Компания: ${article!.company.name}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            // Зарплата
            article!.salary != null
                ? Text(
                    'Зарплата: от ${article!.salary!.from} до ${article!.salary!.to} ${article!.salary!.currency}',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                : const Text('Зарплата не указана'),
            const SizedBox(height: 20),
            // Описание вакансии
            Text(
              'Описание: ${article!.description}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}