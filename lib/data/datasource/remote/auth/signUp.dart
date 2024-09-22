import 'dart:io';
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  postdata(
    String name,
    String mobile,
    String idNumber,
    String type_id,
    String date_birth,
    File proofPhoto,
    File idPhoto,
  ) async {
    var response = await crud.postFileAndDataSignUp(
        AppLink.signUp,
        {
          "name": name,
          "mobile": mobile,
          "idNumber": idNumber,
          "type_id": type_id,
          "date_birth": date_birth,
        },
        {},
        proofPhoto,
        idPhoto
    );
    return response.fold((l) => l, (r) => r);
  }
}
