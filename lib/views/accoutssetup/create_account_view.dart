import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:Gamegig/views/accoutssetup/pages/form1.dart';
import 'package:Gamegig/views/accoutssetup/pages/form2.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return PageView(
      children: [AccountSetup()],
    );
  }
}
