import 'dart:async';
import 'package:flutter_application/domain/domain.dart';

abstract class TopJobsRepositoryInterface {
  Future<List<Article>> getTopJobs();
}
