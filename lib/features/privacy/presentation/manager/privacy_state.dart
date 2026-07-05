import 'package:equatable/equatable.dart';

class PrivacyState extends Equatable {
  final bool shareData;
  final bool improveService;
  final bool visibilityManager;
  final bool visibilityTeam;
  final bool alertNewLogin;
  final bool alertStatusChange;

  const PrivacyState({
    this.shareData = false,
    this.improveService = false,
    this.visibilityManager = false,
    this.visibilityTeam = false,
    this.alertNewLogin = false,
    this.alertStatusChange = false,
  });

  PrivacyState copyWith({
    bool? shareData,
    bool? improveService,
    bool? visibilityManager,
    bool? visibilityTeam,
    bool? alertNewLogin,
    bool? alertStatusChange,
  }) {
    return PrivacyState(
      shareData: shareData ?? this.shareData,
      improveService: improveService ?? this.improveService,
      visibilityManager: visibilityManager ?? this.visibilityManager,
      visibilityTeam: visibilityTeam ?? this.visibilityTeam,
      alertNewLogin: alertNewLogin ?? this.alertNewLogin,
      alertStatusChange: alertStatusChange ?? this.alertStatusChange,
    );
  }

  @override
  List<Object?> get props => [
        shareData,
        improveService,
        visibilityManager,
        visibilityTeam,
        alertNewLogin,
        alertStatusChange,
      ];
}
