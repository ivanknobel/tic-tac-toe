import 'package:get_it/get_it.dart';
import 'package:tic_tac_toe/game/game.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerFactory<GameUseCase>(() => GameUseCase());
}
