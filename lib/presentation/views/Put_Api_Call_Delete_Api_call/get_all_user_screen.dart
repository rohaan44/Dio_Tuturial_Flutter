import 'package:fake_store/presentation/controllers/Put_Api_Delete_Api/get_all_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetAllUserScreen extends StatelessWidget {
  const GetAllUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<GetAllUserController>(builder: (context, controller, _) {
        if (controller.model == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.model!.isEmpty) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: controller.model!.length,
              itemBuilder: (context, index) {
                final data = controller.model![index];
                return ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          final firstNameController = TextEditingController(
                              text: data.name?.firstname ?? "");
                          return AlertDialog(
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  controller.putApi({
                                    "name": {
                                      "firstname": firstNameController.text,
                                      "lastname": data.name.lastname,
                                    }
                                  }, data.id);
                                  Navigator.pop(context);
                                },
                                child: const Text("Done"),
                              ),
                            ],
                            title: const Text("Update User"),
                            content: Container(
                                width: 350,
                                height: 300,
                                decoration:
                                    BoxDecoration(color: Colors.grey[100]),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: firstNameController,
                                      decoration: const InputDecoration(
                                          hintText: "First Name"),
                                    ),
                                  ],
                                )),
                          );
                        });
                  },
                  title: Text(data.name.firstname.toString()),
                  subtitle: Text(data.name.lastname.toString()),
                  trailing: IconButton(
                      onPressed: () {
                        controller.deleteApi(data.id);
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            ))
          ],
        );
      }),
    ));
  }
}
