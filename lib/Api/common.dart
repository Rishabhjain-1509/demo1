import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/Functions/functions_extra.dart';
import 'package:demo/Models/user.dart';
import 'package:demo/core/store.dart';
import 'package:demo/shared/shared.dart';

class CommonApi {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  DocumentReference getDocRef() {
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(SharedPrefData.getUserDetails()!.number);
  }

  //getting user data
  Future<int> getCompleteData(String num) async {
    int i = 0;
    Map<String, dynamic> map = {};
    try {
      await getUserDoc(num).get().then((value) => {
            if (value.exists)
              {
                // ignore: avoid_print
                print("value exist"),
                map = value.data() as Map<String, dynamic>,
                // print("mao us nao $map"),
                AddUserModel(UserModel.fromMap(map)),
                i = 1,
              }
            else
              {
                // ignore: avoid_print
                print("value no "),
                i = 2,
              }
          });
    } catch (e) {
      // ignore: avoid_print
      print("error of data is $e");
      i = 3;
    }
    return i;
  }

  //add or update user data
  Future<void> addUpdateUser(UserModel? mainModel) async {
    userCollection.doc(mainModel!.number).set(mainModel.toMap());
  }
}
