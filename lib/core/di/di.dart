import 'package:day_i/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:day_i/features/auth/presentation/manger/auth_cubit.dart';
import 'package:day_i/features/pricing_plans/data/repos/pricing_plans_repo.dart';
import 'package:day_i/features/pricing_plans/presentation/manger/pricing_palns_cubit.dart';
import 'package:day_i/core/database/database_service.dart';
import 'package:day_i/core/database/shared_preferences_service.dart';
import 'package:day_i/core/networking/api_service.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/networking/token_manager/token_manager.dart';
import 'package:day_i/core/networking/token_manager/token_manager_impl.dart';
import 'package:day_i/core/router/app_router.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/services/notification_service.dart';
import 'package:dio/dio.dart';
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

  // Pricing Plans
  getIt.registerLazySingleton<PricingPlansRepo>(() => PricingPlansRepo());
  getIt.registerFactory<PricingPlansCubit>(() => PricingPlansCubit(getIt()));

  // Auth
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  ); // Since AuthRemoteDataSourceImpl needs Dio directly
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(authRemoteDataSource: getIt()),
  );
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
