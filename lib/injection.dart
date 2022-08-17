
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ealmashi/features/Screen/Chat/api/delete_conversation_api.dart';
import 'package:ealmashi/features/Screen/Chat/api/get_messages_chat_api.dart';
import 'package:ealmashi/features/Screen/Chat/api/send_messages.dart';
import 'package:ealmashi/features/Screen/Policies/policies.dart';
import 'package:ealmashi/features/Screen/bank_transfer/api/getPackages.dart';
import 'package:ealmashi/features/Screen/bank_transfer/api/subscriptions_remote.dart';
import 'package:ealmashi/features/Screen/bank_transfer/bloc/subscriptionsBloc.dart';
import 'package:ealmashi/features/Screen/contact_us/bloc/ContactUsBloc.dart';
import 'package:ealmashi/features/Screen/home/bloc/PagesBloc.dart';
import 'package:ealmashi/features/Screen/loginScreen/api/password_remote.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/constants.dart';

import 'features/Screen/AboutUs/api/aboutUS_api.dart';
import 'features/Screen/AboutUs/bloc/AboutUsBloc.dart';
import 'features/Screen/Chat/api/create_message_remote.dart';
import 'features/Screen/Chat/api/getAll_conversations_remote.dart';
import 'features/Screen/MyAccount/api/delete_notification_api.dart';
import 'features/Screen/MyAccount/api/notifications_remote.dart';
import 'features/Screen/MyAccount/api/social_links_remote.dart';
import 'features/Screen/MyAccount/api/user_details_remote.dart';
import 'features/Screen/Policies/api/Policies_api.dart';
import 'features/Screen/Policies/bloc/PoliciesBloc.dart';
import 'features/Screen/bank_transfer/api/mybank_remote.dart';
import 'features/Screen/contact_us/api/contactUs_api.dart';
import 'features/Screen/home/api/categorie_api.dart';
import 'features/Screen/home/api/get_category_id_api.dart';
import 'features/Screen/loginScreen/api/log_in_remote.dart';
import 'features/Screen/loginScreen/bloc/LoginBloc.dart';
import 'features/Screen/register/api/register_remote.dart';
import 'features/Screen/register/bloc/RegisterBloc.dart';




final sl = GetIt.instance;

///
/// The [init] function is responsible for adding the instances to the graph
///
Future<void> init() async {
  //! External


  /// Adding the [Dio] instance to the graph to be later used by the local data sources
  sl.registerLazySingleton(
    () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: 120000,
          receiveTimeout: 120000,
          sendTimeout: 120000,
          baseUrl: Endpoints.BASE_URL,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true,
        ),
      );

      return dio;
    },
  );

  /// Adding the [DataConnectionChecker] instance to the graph to be later used by the [NetworkInfoImpl]
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton<FirebaseMessaging>(() => FirebaseMessaging.instance);

  //datasource
  sl.registerLazySingleton<LogInRemoteDataSource>(
    () => LogInRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<NotificationRemoteDataSource>(
        () => NotificationRemoteDataSourceImpl(dio: sl(), networkInfo: sl()
    ),
  );
  sl.registerLazySingleton<UserDetailsRemoteDataSource>(
        () => UserDetailsRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<RegisterRemoteDataSource>(
        () => RegisterRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<CategoryRemoteDataSource>(
        () => CategoryRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<CategoryIdRemoteDataSource>(
        () => CategoryIdRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<PackagesRemoteDataSource>(
        () => PackagesRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<MyBankRemoteDataSource>(
        () => MyBankRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<SubscriptionRemoteDataSource>(
        () => SubscriptionRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<ContactUsRemoteDataSource>(
        () => ContactUsRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<ForgotPasswordRemoteDataSource>(
        () => ForgotPasswordRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<GetAllConversationsRemoteDataSource>(
        () => GetAllConversationsRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<CreateConversationRemoteDataSource>(
        () => CreateConversationRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),);

  sl.registerLazySingleton<GetConversationChatRemoteDataSource>(
        () => GetConversationChatRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),);

  sl.registerLazySingleton<SendMessageRemoteDataSource>(
        () => SendMessageRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),);

  sl.registerLazySingleton<AboutUSRemoteDataSource>(
        () => AboutUSRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),);

  sl.registerLazySingleton<PoliciesRemoteDataSource>(
        () => PoliciesRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),);

  sl.registerLazySingleton<SocialLinksRemoteDataSource>(
        () => SocialLinksRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),);
  sl.registerLazySingleton<DeleteNotificationRemoteDataSource>(
        () => DeleteNotificationRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),);
  sl.registerLazySingleton<DeleteConversationRemoteDataSource>(
        () => DeleteConversationRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),);
  // Bloc
  sl.registerLazySingleton(() => LoginBloc(logInRemoteDataSource: sl(),forgotPasswordRemoteDataSource: sl()));
  sl.registerLazySingleton(() => ContactUsBloc(contactUsRemoteDataSource: sl()));
  sl.registerLazySingleton(() => RegisterBloc( registerRemoteDataSource: sl()));
  sl.registerLazySingleton(() => PagesBloc(deleteConversationRemoteDataSource: sl(),deleteNotificationRemoteDataSource: sl(),sendMessageRemoteDataSource: sl(),createConversationRemoteDataSource: sl(),categoryRemoteDataSource: sl(),categoryIdRemoteDataSource: sl(),notificationRemoteDataSource: sl(), userDetailsRemoteDataSource: sl(),getAllConversationsRemoteDataSource: sl(),getConversationChatRemoteDataSource: sl(),socialLinksRemoteDataSource: sl()));
  sl.registerLazySingleton(() => SubscriptionsBloc(packagesRemoteDataSource:sl() ,myBankRemoteDataSource: sl(),subscriptionRemoteDataSource: sl()));
  sl.registerLazySingleton(() => AboutUsBloc( aboutUSRemoteDataSource: sl() ));
  sl.registerLazySingleton(() => PoliciesBloc( policiesRemoteDataSource: sl() ));


}
