//Created By Rishabh Jain.
//Created On Jan 3, 2022

import 'package:demo/Models/user.dart';
import 'package:demo/Services/Api/common.dart';

class CommonHelper {
  Future<int> getCompleteUserData(String num) async {
    return await CommonApi().getCompleteData(num);
  }

  Future<void> addUpdateUser(UserModel? model) async {
    await CommonApi().addUpdateUser(model);
  }
}
