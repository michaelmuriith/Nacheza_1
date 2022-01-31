import 'package:flutter/cupertino.dart';

import '../locator.dart';
import '../services/services.dart';

class TemplateModel extends ChangeNotifier {
  final NavigationService navigationService = locator<NavigationService>();
}
