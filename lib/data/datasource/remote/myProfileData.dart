import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class MyProfileData {
  Crud crud;
  MyProfileData(this.crud);
  myProfileData(String token) async {
    var response = await crud.getData(AppLink.getMyProfile, {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }

  updateProfileData(
      String token, dateBirth, typeId, name, idNumber, image) async {
    print(token);
    var response;
    image == null
        ? response = await crud.postData(AppLink.updateMyProfile, {
            'name': name.toString(),
            'idNumber': idNumber.toString(),
            'id': typeId.toString(),
            'date_birth': dateBirth.toString()
          }, {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          })
        : response = await crud.postFileAndData(
            AppLink.updateMyProfile,
            {
              'name': name.toString(),
              'idNumber': idNumber.toString(),
              'id': typeId.toString(),
              'date_birth': dateBirth.toString()
            },
            {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
            image);
    return response.fold((l) => l, (r) => r);
  }
}
