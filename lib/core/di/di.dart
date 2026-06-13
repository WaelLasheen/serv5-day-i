import 'package:day_i/core/database/objectbox_service.dart';
import 'package:day_i/core/networking/api_service.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/router/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

Future<void> setUpLocators() async {
  await _setupLocalization();
  await _setupObjectBox();

  getIt.registerLazySingleton<IApiService>(
    () => ApiServiceImpl()..initialize(),
  );

  getIt.registerSingleton<AppRouter>(AppRouter());
}

Future<void> _setupLocalization() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path,
          ),
  );
}

Future<void> _setupObjectBox() async {
  final objectBoxService = await ObjectBoxServiceImpl.create();
  getIt.registerLazySingleton<IObjectBoxService>(() => objectBoxService);
}
