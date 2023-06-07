import 'package:flutter/material.dart';
import 'package:papi_network/constants/app_colors.dart';
import 'package:papi_network/providers/auth_provider.dart';
import 'package:papi_network/widgets/custom_button.dart';
import 'package:papi_network/widgets/custom_text_field.dart';
import 'package:papi_network/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class UpdateNickName extends StatefulWidget {
  const UpdateNickName({super.key});

  @override
  State<UpdateNickName> createState() => _UpdateNickNameState();
}

class _UpdateNickNameState extends State<UpdateNickName> {
  TextEditingController _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _userData = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: MyAppBar.appBar(
        context,
        txt: "Change nickname",
        onPressed: () {},
        backGroundColor: AppColors.pinkPurpleAppBar,
        textAndIconsColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: _userData.getUserNickName(),
                  builder: (context, snapshot) {
                    //  var data = snapshot.data!;
                    if (snapshot.hasData) {
                      return CustomTextField(
                          controller: _controller,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "NickName is empty";
                            }
                            return null;
                          },
                          hintText: snapshot.data!.profile!.nickName ?? "",
                          title: "");
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(hintText: "Loading...", title: ""),
                    );
                  },
                ),
              ),
              CustomButton(
                height: 40,
                width: 100,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    AuthProvider().createUserNickname();
                  }
                },
                title: "Save",
                btnColor: AppColors.pinkPurpleAppBar,
                borderRadius: 22,
              ),
              TextFormField(focusNode: FocusNode(debugLabel: "fff")),
            ],
          ),
        ),
      ),
    );
  }
}
