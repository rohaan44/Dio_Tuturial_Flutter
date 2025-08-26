import 'package:fake_store/presentation/controllers/Post_Api_call/post_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostApiScree extends StatelessWidget {
  const PostApiScree({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<PostApiController>(builder: (context, controller, _) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: [
                        TextFormField(
                          controller: controller.emailController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.passController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.userNameController,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              controller.postData();
                            },
                            child: const SizedBox(
                              width: 350,
                              child: Center(
                                child: Text("Continue"),
                              ),
                            )),
                        if (controller.model != null) ...[
                          const SizedBox(
                            height: 30,
                          ),
                          Text("ID: ${controller.model!.id}",
                              style: const TextStyle(fontSize: 18)),
                          Text("Username: ${controller.model!.username}",
                              style: const TextStyle(fontSize: 18)),
                          Text("Email: ${controller.model!.email}",
                              style: const TextStyle(fontSize: 18)),
                          Text("Password: ${controller.model!.password}",
                              style: const TextStyle(fontSize: 18)),
                          Text("Phone: ${controller.model!.phone}",
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 12),
                          const Text("Address:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(
                              "City: ${controller.model!.address?.city ?? ""}"),
                          Text(
                              "Street: ${controller.model!.address?.street ?? ""}"),
                          Text(
                              "Number: ${controller.model!.address?.number ?? ""}"),
                          Text(
                              "Zipcode: ${controller.model!.address?.zipcode ?? ""}"),
                          Text(
                              "Lat: ${controller.model!.address?.geolocation?.lat ?? ""}"),
                          Text(
                              "Long: ${controller.model!.address?.geolocation?.long ?? ""}"),
                        ]
                      ])))
            ]);
      }),
    ));
  }
}
