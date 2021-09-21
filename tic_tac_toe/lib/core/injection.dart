import 'package:get_it/get_it.dart';
import 'package:tic_tac_toe/game/game.dart';
import 'package:tic_tac_toe/settings/domain/usecases/theme_storage_usecase.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerFactory<GameUseCase>(() => GameUseCase());
  locator.registerFactory<ThemeStorageUseCase>(() => ThemeStorageUseCase());
}
