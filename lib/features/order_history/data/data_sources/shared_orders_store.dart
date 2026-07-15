import 'package:day_i/features/order_history/data/models/order_model.dart';

class SharedOrdersStore {
  static final List<OrderModel> orders = [
    OrderModel(
      id: 1,
      code: 'ORD-2041#',
      title: 'إدارة حملة إعلانية - فيسبوك',
      category: 'تسويق الكتروني',
      date: '22 يوليو 2026',
      status: 'pending',
      budget: 899.0,
      platform: 'facebook',
      serviceId: 1,
      executionDays: 7,
    ),
    OrderModel(
      id: 2,
      code: 'ORD-2042#',
      title: 'تصميم واجهات المستخدم UI/UX',
      category: 'تصميم جرافيك',
      date: '18 يوليو 2026',
      status: 'approved',
      budget: 1200.0,
      platform: 'instagram',
      serviceId: 2,
      executionDays: 14,
    ),
    OrderModel(
      id: 3,
      code: 'ORD-2043#',
      title: 'تحسين محركات البحث SEO',
      category: 'تسويق الكتروني',
      date: '10 يوليو 2026',
      status: 'completed',
      budget: 500.0,
      platform: 'google',
      serviceId: 3,
      executionDays: 30,
    ),
    OrderModel(
      id: 4,
      code: 'ORD-2044#',
      title: 'برمجة تطبيقات الهاتف المحمول',
      category: 'تطوير الويب والتطبيقات',
      date: '05 يوليو 2026',
      status: 'late',
      budget: 3000.0,
      platform: 'google',
      serviceId: 4,
      executionDays: 45,
    ),
    OrderModel(
      id: 5,
      code: 'ORD-2045#',
      title: 'إدارة حسابات التواصل الاجتماعي',
      category: 'تسويق الكتروني',
      date: '01 يوليو 2026',
      status: 'completed',
      budget: 650.0,
      platform: 'instagram',
      serviceId: 5,
      executionDays: 30,
    ),
  ];

  static OrderModel? getOrderById(String orderIdString) {
    final intId = int.tryParse(orderIdString);
    try {
      if (intId != null) {
        return orders.firstWhere((o) => o.id == intId);
      }
      return orders.firstWhere(
        (o) => o.code == orderIdString || o.id.toString() == orderIdString,
      );
    } catch (_) {
      return orders.isNotEmpty ? orders.first : null;
    }
  }

  static OrderModel addNewOrder({
    required String serviceName,
    required String priceString,
    required String executionTime,
    int? serviceId,
    String? category,
  }) {
    final double budgetVal =
        double.tryParse(priceString.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
    final int execDays =
        int.tryParse(executionTime.replaceAll(RegExp(r'[^0-9]'), '')) ?? 7;
    final int newId =
        (orders.isNotEmpty
            ? orders.map((e) => e.id).reduce((a, b) => a > b ? a : b)
            : 100) +
        1;

    String platform = 'facebook';
    if (serviceName.toLowerCase().contains('instagram') ||
        serviceName.contains('انستجرام')) {
      platform = 'instagram';
    } else if (serviceName.toLowerCase().contains('google') ||
        serviceName.contains('seo') ||
        serviceName.contains('بحث')) {
      platform = 'google';
    } else if (serviceName.contains('تصميم') ||
        serviceName.contains('ui') ||
        serviceName.contains('تطبيقات')) {
      platform = 'instagram';
    }

    final newOrder = OrderModel(
      id: newId,
      code: 'ORD-${2040 + newId}#',
      title: serviceName,
      category: category ?? 'الخدمات المميزة',
      date: 'الآن (جديد)',
      status: 'pending',
      budget: budgetVal,
      platform: platform,
      serviceId: serviceId ?? newId,
      executionDays: execDays,
    );

    orders.insert(0, newOrder);
    return newOrder;
  }
}
