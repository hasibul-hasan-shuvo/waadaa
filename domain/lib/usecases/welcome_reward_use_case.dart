import 'package:di/di.dart';
import 'package:domain/repositories/home_repository.dart';

@lazySingleton
class WelcomeRewardUseCase {
  final HomeRepository _homeRepository;

  WelcomeRewardUseCase(this._homeRepository);

  Future<String> getWelcomeReward() {
    return _homeRepository.getWelcomeReward();
  }
}
