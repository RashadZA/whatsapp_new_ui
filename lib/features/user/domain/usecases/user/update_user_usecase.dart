
import 'package:whatsapp_new_ui/features/user/domain/entities/user_entity.dart';
import 'package:whatsapp_new_ui/features/user/domain/repository/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository repository;

  UpdateUserUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.updateUser(user);
  }

}