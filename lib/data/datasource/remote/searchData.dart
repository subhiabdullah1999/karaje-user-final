import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  searchData(String idStart, String idEnd, String date) async {
    var response = await crud.postData(AppLink.search,
        {"start_id": idStart, "end_id": idEnd, "date": date}, {});
    return response.fold((l) => l, (r) => r);
  }

  getcities() async {
    var response = await crud
        .getData(AppLink.getcity, {'Authorization': 'Bearer ${AppLink.token}'});
    return response.fold((l) => l, (r) => r);
  }
}
