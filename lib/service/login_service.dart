import 'package:get/get.dart';

class LoginService extends GetxController {
  var email = "".obs;
  var password = "".obs;
  var emailerror = Rx<String?>(null);
  var pasworderror = Rx<String?>(null);
  bool loginvalidate() {
    bool vaild = true;
    if (!email.value.contains("@") || !email.value.contains(".")) {
      emailerror.value = "Enter a valid email";
      vaild = false;
    } else {
      emailerror.value = null;
    }
    if (password.value.length < 6) {
      pasworderror.value = "Password must be at least 6 characters";
      vaild = false;
    } else {
      pasworderror.value = null;
    }
    return vaild;
  }
}
