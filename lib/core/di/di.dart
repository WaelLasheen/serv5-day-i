import 'package:day_i/core/services/notification_service_impl.dart';
import 'package:day_i/features/pricing_plans/data/repos/pricing_plans_repo.dart';
import 'package:day_i/features/pricing_plans/presentation/manger/pricing_palns_cubit.dart';
import 'package:day_i/features/privacy/presentation/manager/privacy_cubit.dart';
import 'package:day_i/features/contacts/data/repos/contacts_repo.dart';
import 'package:day_i/core/database/database_service.dart';
import 'package:day_i/core/database/shared_preferences_service.dart';
import 'package:day_i/core/networking/api_service.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/router/app_router.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/features/auth/data/data_source/remote_data_source.dart';
import 'package:day_i/features/auth/data/data_source/remote_data_source_impl.dart';
import 'package:day_i/features/auth/data/repository/repository_impl.dart';
import 'package:day_i/features/auth/domain/repository/repository.dart';
import 'package:day_i/features/auth/domain/use_case/change_password_use_case.dart';
import 'package:day_i/features/auth/domain/use_case/login_use_case.dart';
import 'package:day_i/features/auth/domain/use_case/register_use_case.dart';
import 'package:day_i/features/auth/domain/use_case/send_otp_use_case.dart';
import 'package:day_i/features/auth/domain/use_case/verify_use_case.dart';
import 'package:day_i/features/maps/data/datasources/maps_remote_data_source.dart';
import 'package:day_i/features/maps/data/repos/maps_repository_impl.dart';
import 'package:day_i/features/maps/domain/repos/maps_repository.dart';
import 'package:day_i/features/maps/domain/usecases/search_places_usecase.dart';
import 'package:day_i/features/services/data/data_source/remote_data_source.dart';
import 'package:day_i/features/services/data/data_source/remote_data_source_impl.dart';
import 'package:day_i/features/services/data/repository/repository_impl.dart';
import 'package:day_i/features/services/domain/repository/repository.dart';
import 'package:day_i/features/services/domain/use_case/get_services_use_case.dart';
import 'package:day_i/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:day_i/core/services/notification_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:day_i/features/order_history/data/data_sources/order_history_remote_data_source.dart';
import 'package:day_i/features/order_history/data/data_sources/order_history_remote_data_source_impl.dart';
import 'package:day_i/features/order_history/data/repositories/order_history_repository_impl.dart';
import 'package:day_i/features/order_history/domain/repositories/order_history_repository.dart';
import 'package:day_i/features/order_history/domain/use_cases/get_orders_use_case.dart';
import 'package:day_i/features/order_history/domain/use_cases/get_order_stats_use_case.dart';
import 'package:day_i/features/order_history/presentation/order_history_cubit/order_history_cubit.dart';


final getIt = GetIt.instance;

Future<void> setUpLocators() async {
  await _setupHydratedBlocStorage();
  await _setupDatabaseService();
  await _setupNotificationService();

  getIt.registerLazySingleton<IApiService>(
    () => ApiServiceImpl()..initialize(),
  );

  getIt.registerLazySingleton<ImagePath>(() => ImagePath());

  // Maps Feature
  getIt.registerLazySingleton<MapsRemoteDataSource>(
    () => MapsRemoteDataSourceImpl(getIt<IApiService>()),
  );
  getIt.registerLazySingleton<MapsRepository>(
    () => MapsRepositoryImpl(remoteDataSource: getIt<MapsRemoteDataSource>()),
  );
  getIt.registerLazySingleton<SearchPlacesUseCase>(
    () => SearchPlacesUseCase(getIt<MapsRepository>()),
  );

  // Auth feature
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(apiService: getIt<IApiService>()),
  );
  getIt.registerLazySingleton<Repository>(
    () => RepositoryImpl(remoteDataSource: getIt<RemoteDataSource>()),
  );
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(repository: getIt<Repository>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(repository: getIt<Repository>()),
  );

  // change password
  getIt.registerLazySingleton<SendOtpUseCase>(
    () => SendOtpUseCase(repository: getIt<Repository>()),
  );
  getIt.registerLazySingleton<VerifyUseCase>(
    () => VerifyUseCase(repository: getIt<Repository>()),
  );
  getIt.registerLazySingleton<ChangePasswordUseCase>(
    () => ChangePasswordUseCase(repository: getIt<Repository>()),
  );

  getIt.registerSingleton<AppRouter>(AppRouter());

  // Services
  getIt.registerLazySingleton<ServiceRemoteDataSource>(
    () => ServiceRemoteDataSourceImpl(apiService: getIt<IApiService>()),
  );
  getIt.registerLazySingleton<ServiceRepository>(
    () => ServiceRepositoryImpl(
      remoteDataSource: getIt<ServiceRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<GetServicesUseCase>(
    () => GetServicesUseCase(repository: getIt<ServiceRepository>()),
  );

  // Pricing Plans
  getIt.registerLazySingleton<PricingPlansRepo>(() => PricingPlansRepo(getIt<IApiService>()));
  getIt.registerFactory<PricingPlansCubit>(() => PricingPlansCubit(getIt()));

  // Privacy
  getIt.registerFactory<PrivacyCubit>(() => PrivacyCubit());

  // Contacts
  getIt.registerLazySingleton<ContactsRepo>(
    () => ContactsRepo(apiService: getIt<IApiService>()),
  );

  // Order History
  getIt.registerLazySingleton<OrderHistoryRemoteDataSource>(
    () => OrderHistoryRemoteDataSourceImpl(apiService: getIt<IApiService>()),
  );
  getIt.registerLazySingleton<OrderHistoryRepository>(
    () => OrderHistoryRepositoryImpl(remoteDataSource: getIt<OrderHistoryRemoteDataSource>()),
  );
  getIt.registerLazySingleton<GetOrdersUseCase>(
    () => GetOrdersUseCase(getIt<OrderHistoryRepository>()),
  );
  getIt.registerLazySingleton<GetOrderStatsUseCase>(
    () => GetOrderStatsUseCase(getIt<OrderHistoryRepository>()),
  );
  getIt.registerFactory<OrderHistoryCubit>(
    () => OrderHistoryCubit(
      getOrdersUseCase: getIt<GetOrdersUseCase>(),
      getOrderStatsUseCase: getIt<GetOrderStatsUseCase>(),
    ),
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

Future<void> _setupNotificationService() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final notificationService = NotificationServiceImpl();
  getIt.registerSingleton<NotificationService>(notificationService);

  await notificationService.initialize();

  String? token = await notificationService.getToken();
  if (kDebugMode) {
    print("\n================== 🚀 DI FCM TOKEN 🚀 ==================");
    print(token);
    print("========================================================\n");
  }
}
