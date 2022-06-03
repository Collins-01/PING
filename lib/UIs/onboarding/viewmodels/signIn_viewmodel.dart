import 'package:ping/Core/Services/navigation_service.dart';
import 'package:ping/Core/states/base_viewmodel.dart';
import 'package:ping/Routes/navigator_routes.dart';

class SignInViewModel extends BaseViewModel {
  final NavigationService _navigationService = NavigationService.instance;

  toVerificationView() async {
    await _navigationService.navigateTo(NavigatorRoutes.verificationView);
  }
}
