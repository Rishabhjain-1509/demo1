import 'package:demo/Api/common.dart';
import 'package:demo/Models/user.dart';

class CommonHelper {
  Future<int> getCompleteUserData(String num) async {
    return await CommonApi().getCompleteData(num);
  }

  Future<void> addUpdateUser(UserModel? model) async {
    await CommonApi().addUpdateUser(model);
  }
}
