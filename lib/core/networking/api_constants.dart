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
  static const String homeServices = "/home/services";

  // Plans
  static const String plans = "/plans";
  static const String planComparisons = "/plan-comparisons";

  // FAQs
  static const String faqs = "/faqs";

  // Notifications
  static const String notifications = "/notifications";
  static const String unreadNotifications = "/notifications/unread";
  static const String unreadNotificationsCount = "/notifications/unread-count";

  // Payments
  static const String paymentMethods = "/payments/methods";
  static const String paymentSuccess = "/payments/success";
  static const String paymentCancel = "/payments/cancel";

  // Orders
  static const String orders = "/orders";
  static const String orderStats = "/orders/stats";
  // Contacts
  static const String contactMessages =
      "https://serve5.cust.iptvdemo.serv5group.com/api/send-message";
  static const String contactInfo =
      "https://serv5.cust.iptvdemo.serv5group.com/api/information-contact";

  static const String nominatimSearchURL =
      "https://nominatim.openstreetmap.org/search";
}
