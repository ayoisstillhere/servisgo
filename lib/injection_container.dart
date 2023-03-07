import 'package:get_it/get_it.dart';
import 'features/auth/domain/usecases/google_signin_usecase.dart';
import 'features/auth/domain/usecases/google_signup_usecase.dart';
import 'features/auth/domain/usecases/set_phone_usecase.dart';
import 'features/auth/domain/usecases/sign_out_usecase.dart';
import 'features/auth/data/datasources/firebase_remote_datasource.dart';
import 'features/auth/data/repositories/firebase_repository_impl.dart';
import 'features/auth/domain/repositories/firebase_repository.dart';
import 'features/auth/domain/usecases/create_current_user_usecase.dart';
import 'features/auth/domain/usecases/get_current_uid_usecase.dart';
import 'features/auth/domain/usecases/is_signin_usecase.dart';
import 'features/auth/domain/usecases/signin_usecase.dart';
import 'features/auth/domain/usecases/signup_usecase.dart';
import 'features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'features/auth/presentation/bloc/signin_cubit/signin_cubit.dart';

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

  //repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(firebaseRemoteDatasource: sl.call()));

  //datasource
  sl.registerLazySingleton<FirebaseRemoteDatasource>(
      () => FirebaseRemoteDataSourceImpl());

  //external
  //e.g final shared Preference = await SharedPreferences.getInstance();
}
