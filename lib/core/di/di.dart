import 'package:day_i/core/database/database_service.dart';
import 'package:day_i/core/database/shared_preferences_service.dart';
import 'package:day_i/core/networking/api_service.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/networking/token_manager/token_manager.dart';
import 'package:day_i/core/networking/token_manager/token_manager_impl.dart';
import 'package:day_i/core/router/app_router.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/services/notification_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

Future<void> setUpLocators() async {
  await _setupHydratedBlocStorage();
  await _setupDatabaseService();

  getIt.registerLazySingleton<ITokenManager>(
    () => TokenManagerImpl(const FlutterSecureStorage()),
  );

  getIt.registerLazySingleton<IApiService>(
    () => ApiServiceImpl()..initialize(),
  );
  getIt.registerLazySingleton<NotificationService>(
  () => NotificationService(getIt<IApiService>()),
);

  getIt.registerSingleton<AppRouter>(AppRouter());

  getIt.registerLazySingleton<ImagePath>(() => ImagePath());
}

Future<void> _setupHydratedBlocStorage() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path,
          ),
  );
}

Future<void> _setupDatabaseService() async {
  final databaseService = SharedPreferencesService();
  await databaseService.init();
  getIt.registerSingleton<DatabaseService>(databaseService);
}
