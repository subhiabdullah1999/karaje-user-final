import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class TripesForCompanyData {
  Crud crud;
  TripesForCompanyData(this.crud);
  tripesForCompanyData(String idCompany) async {
    var response = await crud.postData(AppLink.tripForCompany, {
      "company_id": idCompany.toString(),
    }, {});
    return response.fold((l) => l, (r) => r);
  }

  getAllCompaniesData() async {
    var response = await crud.getData(
      AppLink.getAllCompanies,
      {},
    );
    return response.fold((l) => l, (r) => r);
  }
}
