import 'package:get_it/get_it.dart';
import 'package:servisgo/features/auth/data/datasources/firebase_remote_datasource.dart';
import 'package:servisgo/features/auth/data/repositories/firebase_repository_impl.dart';
import 'package:servisgo/features/auth/domain/repositories/firebase_repository.dart';
import 'package:servisgo/features/auth/domain/usecases/create_current_user_usecase.dart';
import 'package:servisgo/features/auth/domain/usecases/get_current_uid_usecase.dart';
import 'package:servisgo/features/auth/domain/usecases/is_signin_usecase.dart';
import 'package:servisgo/features/auth/domain/usecases/signin_usecase.dart';
import 'package:servisgo/features/auth/domain/usecases/signup_usecase.dart';
import 'package:servisgo/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Features bloc,
  sl.registerFactory(() =>
      AuthCubit(isSigninUsecase: sl.call(), getCurrentUidUsecase: sl.call()));

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

  //repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(firebaseRemoteDatasource: sl.call()));

  //datasource
  sl.registerLazySingleton<FirebaseRemoteDatasource>(
      () => FirebaseRemoteDataSourceImpl());

  //external
  //e.g final shared Preference = await SharedPreferences.getInstance();
}
