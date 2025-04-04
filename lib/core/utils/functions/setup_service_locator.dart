import 'package:bookyapp/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookyapp/features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:bookyapp/features/home/data/repos/home_repo_imp.dart';
import 'package:bookyapp/main.dart';
import 'package:dio/dio.dart';

import '../api_services.dart';

void setupServiceLocator() {
  getit.registerSingleton<ApiServices>(ApiServices(Dio()));
  getit.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      homeRemoteDataSource: HomeRemoteDataSourcesImpl(getit.get<ApiServices>()),
      homeLocalDataSource: HomeLocalDataSourcesImpl(),
    ),
  );
}
