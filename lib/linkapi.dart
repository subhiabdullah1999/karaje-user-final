class AppLink {
  static const String server = "https://ac.ka-ad.sy/api";
  static const String imagesServer = "https://ac.ka-ad.sy/uploads/";
//================================================================
  static String token = '';
  static String idNumber = '';
  static const String search = "$server/trip/home";
  static const String tripForCompany = "$server/trip/Company";
  static const String myReservation = "$server/client/completedRes";
  static const String completedRes = "$server/reservation/Completed";
  static const String getAllCompanies = "$server/company/get";
  static const String getMyProfile = "$server/client/profile";
  static const String updateMyProfile = "$server/client/update";
  static const String addReservation = "$server/reservation/Create";
  // ================================= Auth ========================== //
  static const String signUp = "$server/client/register";
  static const String signIn = "$server/client/login";
  static const String checkCode = "$server/client/checkCode";
  static const String deleteAcount = "$server/client/delete/";
  static const String updateApp = "$server/get-version";

  // ================================= Home ========================== //
  static const String getSlides = "$server/slide/get";
  static const String searchtrip = "$server/trip/Search";
  static const String getcity = "$server/city/get";
  static const String imageststatic = "https://ac.ka-ad.sy/uploads/slides";
  static const String notificationsLink = "$server/notification/client";
}
