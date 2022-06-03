import 'package:ping/Core/Services/navigation_service.dart';
import 'package:ping/Core/states/base_viewmodel.dart';
import 'package:ping/Routes/navigator_routes.dart';

class MessagesViewModel extends BaseViewModel {
  final NavigationService _navigationService = NavigationService.instance;
  toContactsView() async {
    await _navigationService.navigateTo(NavigatorRoutes.contactsView);
  }
}
