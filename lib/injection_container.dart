import 'package:get_it/get_it.dart';
import 'package:servisgo/features/chat/domain/usecases/get_messages_usecase.dart';
import 'package:servisgo/features/chat/domain/usecases/send_text_message_usecase.dart';
import 'package:servisgo/features/chat/presentation/bloc/chat_cubit/chat_cubit.dart';
import 'package:servisgo/features/home/domain/usecases/update_service_rating_usecase.dart';
import 'package:servisgo/features/home/domain/usecases/update_service_to_completed_usecase.dart';
import 'features/confirmBooking/domain/usecases/create_job_request_usecase.dart';
import 'features/confirmBooking/presentation/bloc/job_request_cubit/job_request_cubit.dart';
import 'features/home/domain/usecases/get_partners_usecase.dart';
import 'features/home/presentation/bloc/partner_cubit/partner_cubit.dart';
import 'features/tracker/presentation/bloc/accepted_service_cubit/accepted_service_cubit.dart';
import 'features/home/domain/usecases/get_users_usecase.dart';
import 'features/home/presentation/bloc/user_cubit/user_cubit.dart';
import 'features/menu/data/datasources/firebase_storage_remote_datasource.dart';
import 'features/menu/domain/repositories/firebase_storage_repository.dart';
import 'features/menu/domain/usecases/update_address_usecase.dart';
import 'features/menu/domain/usecases/update_name_usecase.dart';
import 'features/menu/domain/usecases/update_pfp_url_usecase.dart';
import 'features/menu/domain/usecases/update_phone_usecase.dart';
import 'features/menu/domain/usecases/upload_image_usecase.dart';
import 'features/menu/presentation/bloc/pfp_cubit/pfp_cubit.dart';

import 'features/auth/data/datasources/firebase_remote_datasource.dart';
import 'features/auth/data/repositories/firebase_repository_impl.dart';
import 'features/auth/domain/repositories/firebase_repository.dart';
import 'features/auth/domain/usecases/create_current_user_usecase.dart';
import 'features/auth/domain/usecases/get_current_uid_usecase.dart';
import 'features/auth/domain/usecases/google_signin_usecase.dart';
import 'features/auth/domain/usecases/google_signup_usecase.dart';
import 'features/auth/domain/usecases/is_signin_usecase.dart';
import 'features/auth/domain/usecases/reset_password_usecase.dart';
import 'features/auth/domain/usecases/set_phone_usecase.dart';
import 'features/auth/domain/usecases/sign_out_usecase.dart';
import 'features/auth/domain/usecases/signin_usecase.dart';
import 'features/auth/domain/usecases/signup_usecase.dart';
import 'features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'features/auth/presentation/bloc/signin_cubit/signin_cubit.dart';
import 'features/menu/data/repositories/firebase_Storage_repository_impl.dart';
import 'features/tracker/domain/usecases/get_accepted_requests_usecases.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Features bloc,
  sl.registerFactory<AuthCubit>(() =>
      AuthCubit(isSigninUsecase: sl.call(), getCurrentUidUsecase: sl.call()));
  sl.registerFactory<SigninCubit>(() => SigninCubit(
        signupUsecase: sl.call(),
        signinUsecase: sl.call(),
        createCurrentUserUsecase: sl.call(),
        signoutUsecase: sl.call(),
        googleSigninUsecase: sl.call(),
        googleSignupUsecase: sl.call(),
        setPhoneUsecase: sl.call(),
        resetPasswordUsecase: sl.call(),
      ));
  sl.registerFactory<UserCubit>(() => UserCubit(
        usersUsecase: sl.call(),
        updateAddressUsecase: sl.call(),
        updateNameUsecase: sl.call(),
        updatePhoneUsecase: sl.call(),
      ));
  sl.registerFactory<PfpCubit>(() => PfpCubit(
        uploadImageUsecase: sl.call(),
        updatePfpUrlUsecase: sl.call(),
      ));
  sl.registerFactory<PartnerCubit>(() => PartnerCubit(
        getPartnersUsecase: sl.call(),
      ));
  sl.registerFactory<JobRequestCubit>(
      () => JobRequestCubit(createJobRequestUsecase: sl.call()));
  sl.registerFactory<AcceptedServiceCubit>(() => AcceptedServiceCubit(
        getAcceptedRequestsUsecase: sl.call(),
        updateServiceToCompletedUsecase: sl.call(),
        updateServiceRatingUsecase: sl.call(),
      ));
  sl.registerFactory<ChatCubit>(() => ChatCubit(
        getMessagesUsecase: sl.call(),
        sendTextMessageUseCase: sl.call(),
      ));

  //!useCae
  sl.registerLazySingleton<IsSigninUsecase>(
      () => IsSigninUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUsecase>(
      () => GetCurrentUidUsecase(repository: sl.call()));
  sl.registerLazySingleton<CreateCurrentUserUsecase>(
      () => CreateCurrentUserUsecase(repository: sl.call()));
  sl.registerLazySingleton<SigninUsecase>(
      () => SigninUsecase(repository: sl.call()));
  sl.registerLazySingleton<SignupUsecase>(
      () => SignupUsecase(repository: sl.call()));
  sl.registerLazySingleton<SignoutUsecase>(
      () => SignoutUsecase(repository: sl.call()));
  sl.registerLazySingleton<GoogleSigninUsecase>(
      () => GoogleSigninUsecase(repository: sl.call()));
  sl.registerLazySingleton<GoogleSignupUsecase>(
      () => GoogleSignupUsecase(repository: sl.call()));
  sl.registerLazySingleton<SetPhoneUsecase>(
      () => SetPhoneUsecase(repository: sl.call()));
  sl.registerLazySingleton<ResetPasswordUsecase>(
      () => ResetPasswordUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetUsersUsecase>(
      () => GetUsersUsecase(repository: sl.call()));
  sl.registerLazySingleton<UpdateAddressUsecase>(
      () => UpdateAddressUsecase(repository: sl.call()));
  sl.registerLazySingleton<UpdateNameUsecase>(
      () => UpdateNameUsecase(repository: sl.call()));
  sl.registerLazySingleton<UpdatePhoneUsecase>(
      () => UpdatePhoneUsecase(repository: sl.call()));
  sl.registerLazySingleton<UploadImageUsecase>(
      () => UploadImageUsecase(firebaseStorageRepository: sl.call()));
  sl.registerLazySingleton<UpdatePfpUrlUsecase>(
      () => UpdatePfpUrlUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetPartnersUsecase>(
      () => GetPartnersUsecase(repository: sl.call()));
  sl.registerLazySingleton<CreateJobRequestUsecase>(
      () => CreateJobRequestUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetAcceptedRequestsUsecase>(
      () => GetAcceptedRequestsUsecase(repository: sl.call()));
  sl.registerLazySingleton<UpdateServiceToCompletedUsecase>(
      () => UpdateServiceToCompletedUsecase(repository: sl.call()));
  sl.registerLazySingleton<UpdateServiceRatingUsecase>(
      () => UpdateServiceRatingUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetMessagesUsecase>(
      () => GetMessagesUsecase(repository: sl.call()));
  sl.registerLazySingleton<SendTextMessageUseCase>(
      () => SendTextMessageUseCase(repository: sl.call()));

  //repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(firebaseRemoteDatasource: sl.call()));
  sl.registerLazySingleton<FirebaseStorageRepository>(() =>
      FirebaseStorageRepositoryImpl(
          firebaseStorageRemoteDatasource: sl.call()));

  //datasource
  sl.registerLazySingleton<FirebaseRemoteDatasource>(
      () => FirebaseRemoteDataSourceImpl());
  sl.registerLazySingleton<FirebaseStorageRemoteDatasource>(
      () => FirebaseStorageRemoteDataSourceImpl());

  //external
  //e.g final shared Preference = await SharedPreferences.getInstance();
}
