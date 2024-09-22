import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignInData {
  Crud crud;

  SignInData(this.crud);

  postdata(
    String mobile,
  ) async {
    var response = await crud.postData(AppLink.signIn, {
      "mobile": mobile,
    }, {});
    return response.fold((l) => l, (r) => r);
  }
}
