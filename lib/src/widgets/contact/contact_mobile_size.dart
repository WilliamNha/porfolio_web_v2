import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_project_v2/src/modules/contact/controllers/contact_controller.dart';
import 'package:portfolio_project_v2/src/modules/contact/screens/contact_screen.dart';
import 'package:portfolio_project_v2/src/widgets/contact/comment_textfield.dart';
import 'package:portfolio_project_v2/src/widgets/contact/custom_animated_send_button.dart';
import 'package:portfolio_project_v2/src/widgets/contact/textfield_with_label.dart';

class ContactMobileSize extends StatefulWidget {
  const ContactMobileSize({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  State<ContactMobileSize> createState() => _ContactMobileSizeState();
}

class _ContactMobileSizeState extends State<ContactMobileSize> {
  bool isEmailValid = true;
  @override
  Widget build(BuildContext context) {
    var contactController = Get.put(ContactController());
    return Obx(() => Visibility(
          visible: widget.screenWidth < 800,
          child: Padding(
            padding: EdgeInsets.only(
                left: widget.screenWidth * 0.10,
                right: widget.screenWidth * 0.10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                const Text(
                  'Get in touch 👋',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans'),
                ),
                const Text(
                  'Love to hear from you',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans'),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      // color: Colors.yellow,
                      width: double.infinity,
                      height: 80,
                      child: TextfieldWithLabel(
                        fontSize: 15,
                        onChanged: (value) {},
                        textEditingController:
                            contactController.nameController.value,
                        screenWidth: widget.screenWidth,
                        hintText: "Full Name",
                        labelText: 'Your Name',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    contactController.isNameInvalid.value
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                '* Please tell me your name',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          )
                        : const SizedBox()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      // color: Colors.yellow,
                      width: double.infinity,
                      height: 80,
                      child: TextfieldWithLabel(
                        fontSize: 15,
                        onChanged: (value) {},
                        textEditingController:
                            contactController.emailController.value,
                        hintText: "Your Email",
                        labelText: 'Email',
                        screenWidth: widget.screenWidth,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    contactController.isEmailInvalid.value
                        ? const Text(
                            '* Don\'t forget to input your email',
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          )
                        : !isEmailValid
                            ? const Text(
                                '* Please input valid email',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )
                            : const SizedBox(),
                    contactController.isNameInvalid.value == true ||
                            contactController.isEmailInvalid.value == true
                        ? const SizedBox(
                            height: 10,
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Message",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: CommentTextField(
                        onChanged: (value) {},
                        textEditingController:
                            contactController.commentController.value,
                        screenWidth: widget.screenWidth,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    contactController.isCommentInvalid.value
                        ? const Text(
                            '* Tell me something',
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomAnimatedSendButton(
                      onTab: () async {
                        contactController.nameController.value.text.isEmpty
                            ? contactController.isNameInvalid.value = true
                            : contactController.isNameInvalid.value = false;
                        debugPrint('${contactController.isNameInvalid.value}');
                        contactController.emailController.value.text.isEmpty
                            ? contactController.isEmailInvalid.value = true
                            : contactController.isEmailInvalid.value = false;

                        contactController.commentController.value.text.isEmpty
                            ? contactController.isCommentInvalid.value = true
                            : contactController.isCommentInvalid.value = false;
                        contactController
                                    .nameController.value.text.isNotEmpty &&
                                contactController
                                    .emailController.value.text.isNotEmpty &&
                                contactController
                                    .commentController.value.text.isNotEmpty &&
                                isEmailValid == true
                            ? await sendEmail(
                                    name: contactController
                                        .nameController.value.text,
                                    email: contactController
                                        .emailController.value.text,
                                    message: contactController
                                        .commentController.value.text)
                                .then((value) {
                                debugPrint('value $value');
                                value == 'OK'
                                    ? contactController
                                        .clearControllerAndValidate()
                                    : const SizedBox();
                              })
                            : const SizedBox();
                        setState(() {});
                      },
                      screenWidth: widget.screenWidth,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
