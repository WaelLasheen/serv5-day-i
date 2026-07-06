class OrderParams {
  final String search;
  final String status;
  final String employeeName;
  final int page;
  final int perPage;

  OrderParams({
    this.search = '',
    this.status = 'all',
    this.employeeName = '',
    this.page = 1,
    this.perPage = 10,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> queryParams = {};
    if (search.isNotEmpty) queryParams['search'] = search;
    if (status.isNotEmpty) queryParams['status'] = status;
    if (employeeName.isNotEmpty) {
      queryParams['employee_name'] = employeeName;
    }
    queryParams['page'] = page;
    queryParams['per_page'] = perPage;

    return queryParams;
  }

  OrderParams copyWith({
    String? search,
    String? status,
    String? employeeName,
    int? page,
    int? perPage,
  }) {
    return OrderParams(
      search: search ?? this.search,
      status: status ?? this.status,
      employeeName: employeeName ?? this.employeeName,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }
}
