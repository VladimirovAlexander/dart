import 'package:flutter_application/data/dio/set_up.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../app/features/features.dart';
import '../domain/domain.dart';

final getIt = GetIt.instance;
final talker = TalkerFlutter.init();
final Dio dio = Dio();

Future<void> setupLocator() async {
  setUpDio();

  getIt.registerSingleton<Dio>(dio);

  getIt.registerSingleton(TopJobsRepository(dio: getIt<Dio>()));
  getIt.registerSingleton(HomeBloc(getIt.get<TopJobsRepository>()));
}
