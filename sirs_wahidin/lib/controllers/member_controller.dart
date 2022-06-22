import 'package:get/get.dart';
import 'package:sirs_wahidin/models/user.dart';
import 'package:sirs_wahidin/utils/my_sharedpreferences.dart';

class MemberController extends GetxController {
  var user = User(token: "", name: "").obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() async {
    var a = await loadPreference();
    user(a);
  }
}
