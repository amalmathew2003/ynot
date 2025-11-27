import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ynot_machine_test/service/login_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginServicecontroller = Get.put(LoginService());

    return Scaffold(
      body: Center(
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //email.....................
                  Obx(
                    () => TextField(
                      onChanged: (v) => loginServicecontroller.email.value = v,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorText: loginServicecontroller.emailerror.value,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),
                  //password..........................
                  Obx(
                    () => TextField(
                      obscureText: true,
                      onChanged: (v) =>
                          loginServicecontroller.password.value = v,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorText: loginServicecontroller.pasworderror.value,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  ElevatedButton(
                    onPressed: () {
                      if (loginServicecontroller.loginvalidate()) {
                        Get.offAllNamed('/home');
                      }
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
