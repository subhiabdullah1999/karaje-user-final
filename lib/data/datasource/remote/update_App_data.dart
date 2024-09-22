import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class UpdateAppData {
  Crud crud;
  UpdateAppData(this.crud);
  updateAppData() async {
    var response = await crud.getData(AppLink.updateApp, {});
    return response.fold((l) => l, (r) => r);
  }
}
