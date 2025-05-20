import 'package:fitness/core/theme_cubit/theme_cubit.dart';
import 'package:fitness/features/exercise/presentation/bloc/ongoing_exercise/ongoing_exercise_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Cubits
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  sl.registerLazySingleton<OngoingExerciseCubit>(() => OngoingExerciseCubit());
}