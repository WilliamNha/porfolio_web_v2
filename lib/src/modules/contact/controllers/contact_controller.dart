import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  var nameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var commentController = TextEditingController().obs;

  var isNameInvalid = false.obs;
  var isEmailInvalid = false.obs;
  var isCommentInvalid = false.obs;

  clearControllerAndValidate() {
    nameController.value.clear();
    emailController.value.clear();
    commentController.value.clear();

    isNameInvalid.value = false;
    isEmailInvalid.value = false;
    isCommentInvalid.value = false;
  }
}
