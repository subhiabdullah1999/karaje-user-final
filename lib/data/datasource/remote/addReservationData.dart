import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class AddReservationData {
  Crud crud;
  AddReservationData(this.crud);
  addReservationData(String token, String idTrip, List chairs, String name,String idNumber,
      String date) async {
    Map data = {};
    for (int i = 0; i < chairs.length; i++) {
      data["num_chairs[$i]"] = chairs[i].toString();
    }
    data['trip_id'] = idTrip.toString();
    data['name'] = name.toString();
    data['date'] = date.toString();
    data['idNumber'] = idNumber.toString();
    print(data);

    var response = await crud.postData(
        AppLink.addReservation, data, {'Authorization': 'Bearer $token'});
    return response.fold((l) => l, (r) => r);
  }

   completedResData( String idTrip,
      ) async {
    Map data = {};
   
    data['reservation_id'] = idTrip.toString();

    print(data);

    var response = await crud.postData(
        AppLink.completedRes, data, {});
    return response.fold((l) => l, (r) => r);
  }
}
