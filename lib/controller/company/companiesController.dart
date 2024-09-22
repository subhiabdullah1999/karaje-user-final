import 'package:get/get.dart';
import 'package:karajaapp/data/datasource/remote/tripesForCompanyData.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../view/screen/serach/resultSearchScreen.dart';

class CompaniesController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  TripesForCompanyData tripesForCompanyData = TripesForCompanyData(Get.find());
  List? allCompanies;
  @override
  void onInit() {
    getAllCompany();
    super.onInit();
  }

  getAllCompany() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await tripesForCompanyData.getAllCompaniesData();
    print("=============================== response $response ");
    print("=============================== statusRequest $statusRequest ");
    statusRequest = handlingData(response);
    update();
    Map data = {};
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      print(data['status']);
      if (data["status"] == true) {
        allCompanies = data['data']['Companies'];
      } else {}
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }

  goToTripeCompany(idCompany) async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await tripesForCompanyData.tripesForCompanyData(idCompany.toString());
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      Map data = {};
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        print(data['status']);
        if (data["status"] == true) {
          Get.to(const ResultSearchScreen(), arguments: {
            'data': data['data']['Trips'],
            'date':
                '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}'
          });
        } else {}
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("فشل", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {}
    }
  }
}
