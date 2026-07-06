class ApiConstants {
  static const String baseURL = "https://cust.iptvdemo.serv5group.com/api";
  
  // Auth
  static const String register = "/auth/register";
  static const String login = "/auth/login";
  static const String authRefresh = "/auth/refresh";
  static const String sendOtp = "/auth/send-otp";
  static const String verify = "/auth/verify-otp";
  static const String changePassword = "/auth/change-password";

  // Company
  static const String companies = "/companies";

  // Services 
  static const String services = "/services-page";
  
  // Plans
  static const String plans = "/plans";
  static const String planComparisons = "/plan-comparisons";
  
  // FAQs
  static const String faqs = "/faqs";
  

  static const String nominatimSearchURL = "https://nominatim.openstreetmap.org/search";

}
