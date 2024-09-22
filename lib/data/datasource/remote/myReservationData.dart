import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class MyReservationData {
  Crud crud;
  MyReservationData(this.crud);
  myReservationData(String token) async {
    var response = await crud.getData(AppLink.myReservation, {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
