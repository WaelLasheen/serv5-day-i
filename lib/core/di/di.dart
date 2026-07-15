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
import 'package:day_i/features/services/presentation/controller/service_cubit/service_cubit.dart';
import 'package:day_i/features/services/presentation/controller/service_details_cubit/service_details_cubit.dart';
import 'package:day_i/features/services/domain/use_case/get_services_use_case.dart';
import 'package:day_i/features/services/domain/use_case/get_service_details_use_case.dart';
import 'package:day_i/features/home/data/data_source/home_data_source.dart';
import 'package:day_i/features/home/data/repository/home_repository_impl.dart';
import 'package:day_i/features/home/domain/repository/home_repository.dart';
import 'package:day_i/features/home/domain/use_case/get_home_categories_use_case.dart';
import 'package:day_i/features/home/domain/use_case/get_home_suggested_services_use_case.dart';
import 'package:day_i/features/home/presentation/controller/home_cubit/home_cubit.dart';
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

import 'package:day_i/features/notification/data/data_sources/notification_remote_data_source.dart';
import 'package:day_i/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:day_i/features/notification/domain/repositories/notification_repository.dart';
import 'package:day_i/features/notification/domain/use_cases/get_notifications_use_case.dart';
import 'package:day_i/features/notification/domain/use_cases/get_unread_notifications_count_use_case.dart';
import 'package:day_i/features/notification/domain/use_cases/get_unread_notifications_use_case.dart';
import 'package:day_i/features/notification/presentation/controller/notification_cubit/notification_cubit.dart';

import 'package:day_i/features/order_details/data/data_sources/order_details_remote_data_source.dart';
import 'package:day_i/features/order_details/data/repositories/order_details_repository_impl.dart';
import 'package:day_i/features/order_details/domain/repositories/order_details_repository.dart';
import 'package:day_i/features/order_details/domain/use_cases/get_order_details_use_case.dart';
import 'package:day_i/features/order_details/presentation/cubit/order_details_cubit.dart';

import 'package:day_i/features/chatbot/data/data_source/chatbot_remote_data_source.dart';
import 'package:day_i/features/chatbot/data/data_source/chatbot_remote_data_source_impl.dart';
import 'package:day_i/features/chatbot/data/repository/chatbot_repository_impl.dart';
import 'package:day_i/features/chatbot/domain/repository/chatbot_repository.dart';
import 'package:day_i/features/chatbot/domain/use_case/send_message_use_case.dart';
import 'package:day_i/features/chatbot/presentation/controller/chatbot_cubit/chatbot_cubit.dart';

import 'package:day_i/features/payment/data/datasources/payment_remote_data_source.dart';
import 'package:day_i/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:day_i/features/payment/domain/repositories/payment_repository.dart';
import 'package:day_i/features/payment/domain/usecases/cancel_payment_use_case.dart';
import 'package:day_i/features/payment/domain/usecases/check_payment_success_use_case.dart';
import 'package:day_i/features/payment/domain/usecases/get_payment_methods_use_case.dart';
import 'package:day_i/features/payment/domain/usecases/get_payment_success_details_use_case.dart';
import 'package:day_i/features/payment/presentation/controller/payment_cubit.dart';

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
  getIt.registerLazySingleton<ServiceCubit>(
    () => ServiceCubit(getServicesUseCase: getIt<GetServicesUseCase>()),
  );
  getIt.registerLazySingleton<GetServiceDetailsUseCase>(
    () => GetServiceDetailsUseCase(repository: getIt<ServiceRepository>()),
  );
  getIt.registerFactory<ServiceDetailsCubit>(
    () => ServiceDetailsCubit(getIt<GetServiceDetailsUseCase>()),
  );

  // Pricing Plans
  getIt.registerLazySingleton<PricingPlansRepo>(
    () => PricingPlansRepo(getIt<IApiService>()),
  );
  getIt.registerFactory<PricingPlansCubit>(() => PricingPlansCubit(getIt()));

  // Home Feature
  getIt.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(apiService: getIt<IApiService>()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(dataSource: getIt<HomeDataSource>()),
  );
  getIt.registerLazySingleton<GetHomeCategoriesUseCase>(
    () => GetHomeCategoriesUseCase(getIt<HomeRepository>()),
  );
  getIt.registerLazySingleton<GetHomeSuggestedServicesUseCase>(
    () => GetHomeSuggestedServicesUseCase(getIt<HomeRepository>()),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getCategoriesUseCase: getIt<GetHomeCategoriesUseCase>(),
      getSuggestedServicesUseCase: getIt<GetHomeSuggestedServicesUseCase>(),
    ),
  );

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
    () => OrderHistoryRepositoryImpl(
      remoteDataSource: getIt<OrderHistoryRemoteDataSource>(),
    ),
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

  // Notifications
  getIt.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(apiService: getIt<IApiService>()),
  );
  getIt.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(
      remoteDataSource: getIt<NotificationRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<GetNotificationsUseCase>(
    () => GetNotificationsUseCase(repository: getIt<NotificationRepository>()),
  );
  getIt.registerLazySingleton<GetUnreadNotificationsUseCase>(
    () => GetUnreadNotificationsUseCase(repository: getIt<NotificationRepository>()),
  );
  getIt.registerLazySingleton<GetUnreadNotificationsCountUseCase>(
    () => GetUnreadNotificationsCountUseCase(repository: getIt<NotificationRepository>()),
  );
  getIt.registerFactory<NotificationCubit>(
    () => NotificationCubit(
      getNotificationsUseCase: getIt<GetNotificationsUseCase>(),
      getUnreadNotificationsUseCase: getIt<GetUnreadNotificationsUseCase>(),
      getUnreadNotificationsCountUseCase: getIt<GetUnreadNotificationsCountUseCase>(),
    ),
  );
  // Order Details
  getIt.registerLazySingleton<OrderDetailsRemoteDataSource>(
    () => OrderDetailsRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<OrderDetailsRepository>(
    () => OrderDetailsRepositoryImpl(
      getIt<OrderDetailsRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<GetOrderDetailsUseCase>(
    () => GetOrderDetailsUseCase(getIt<OrderDetailsRepository>()),
  );
  getIt.registerFactory<OrderDetailsCubit>(
    () => OrderDetailsCubit(getIt<GetOrderDetailsUseCase>()),
  );

  // Chatbot
  getIt.registerLazySingleton<ChatbotRemoteDataSource>(
    () => ChatbotRemoteDataSourceImpl(apiService: getIt<IApiService>()),
  );
  getIt.registerLazySingleton<ChatbotRepository>(
    () => ChatbotRepositoryImpl(remoteDataSource: getIt<ChatbotRemoteDataSource>()),
  );
  getIt.registerLazySingleton<SendMessageUseCase>(
    () => SendMessageUseCase(repository: getIt<ChatbotRepository>()),
  );
  getIt.registerFactory<ChatbotCubit>(
    () => ChatbotCubit(sendMessageUseCase: getIt<SendMessageUseCase>()),
  );

  // Payment
  getIt.registerLazySingleton<PaymentRemoteDataSource>(
    () => PaymentRemoteDataSourceImpl(apiService: getIt<IApiService>()),
  );
  getIt.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(remoteDataSource: getIt<PaymentRemoteDataSource>()),
  );
  getIt.registerLazySingleton<GetPaymentMethodsUseCase>(
    () => GetPaymentMethodsUseCase(repository: getIt<PaymentRepository>()),
  );
  getIt.registerLazySingleton<CheckPaymentSuccessUseCase>(
    () => CheckPaymentSuccessUseCase(repository: getIt<PaymentRepository>()),
  );
  getIt.registerLazySingleton<CancelPaymentUseCase>(
    () => CancelPaymentUseCase(repository: getIt<PaymentRepository>()),
  );
  getIt.registerLazySingleton<GetPaymentSuccessDetailsUseCase>(
    () => GetPaymentSuccessDetailsUseCase(repository: getIt<PaymentRepository>()),
  );
  getIt.registerFactory<PaymentCubit>(
    () => PaymentCubit(
      getPaymentMethodsUseCase: getIt<GetPaymentMethodsUseCase>(),
      checkPaymentSuccessUseCase: getIt<CheckPaymentSuccessUseCase>(),
      cancelPaymentUseCase: getIt<CancelPaymentUseCase>(),
      getPaymentSuccessDetailsUseCase: getIt<GetPaymentSuccessDetailsUseCase>(),
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
