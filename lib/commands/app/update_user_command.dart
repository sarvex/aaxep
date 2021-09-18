import 'package:aaxep/commands/commands.dart';
import 'package:aaxep/data/app_user.dart';

class UpdateUserCommand extends BaseAppCommand {
  Future<void> run(AppUser user) async {
    if (appModel.currentUser == null) return;
    appModel.currentUser = user;
    await firebase.setUserData(user);
  }
}
