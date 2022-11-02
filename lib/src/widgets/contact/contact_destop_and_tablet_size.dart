import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_project_v2/src/modules/contact/controllers/contact_controller.dart';
import 'package:portfolio_project_v2/src/modules/contact/screens/contact_screen.dart';
import 'package:portfolio_project_v2/src/widgets/contact/comment_textfield.dart';
import 'package:portfolio_project_v2/src/widgets/contact/custom_animated_send_button.dart';
import 'package:portfolio_project_v2/src/widgets/contact/textfield_with_label.dart';

class ContactDesktopAndTabletSize extends StatefulWidget {
  const ContactDesktopAndTabletSize({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  State<ContactDesktopAndTabletSize> createState() =>
      _ContactDesktopAndTabletSizeState();
}

class _ContactDesktopAndTabletSizeState
    extends State<ContactDesktopAndTabletSize> {
  bool isButtonHover = false;
  bool isEmailValid = true;

  var contactController = Get.put(ContactController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
          visible: widget.screenWidth >= 800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: widget.screenWidth * 0.15,
                    right: widget.screenWidth * 0.15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Get in touch 👋',
                      style: TextStyle(
                          fontSize: widget.screenWidth > 1000 ? 28 : 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans'),
                    ),
                    Text(
                      'Love to hear from you',
                      style: TextStyle(
                          fontSize: widget.screenWidth > 1000 ? 28 : 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              // color: Colors.yellow,
                              width: double.infinity,
                              height: 80,
                              child: TextfieldWithLabel(
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
                                ? const Text(
                                    '* Please tell me your name',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  )
                                : const SizedBox()
                          ],
                        )),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              // color: Colors.yellow,
                              width: double.infinity,
                              height: 80,
                              child: TextfieldWithLabel(
                                onChanged: (value) {
                                  setState(() {
                                    isEmailValid = EmailValidator.validate(
                                        contactController
                                            .emailController.value.text);
                                  });
                                },
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
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  )
                                : !isEmailValid
                                    ? const Text(
                                        '* Please input valid email',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12),
                                      )
                                    : const SizedBox(),
                          ],
                        )),
                      ],
                    ),
                    /////
                    contactController.isNameInvalid.value == true ||
                            contactController.isEmailInvalid.value == true
                        ? const SizedBox(
                            height: 10,
                          )
                        : const SizedBox(),
                    Text(
                      "Message",
                      style: TextStyle(
                          fontSize: widget.screenWidth > 1000 ? 15 : 13),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: CommentTextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        textEditingController:
                            contactController.commentController.value,
                        screenWidth: widget.screenWidth,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
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

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: value == 'OK'
                                        ? Colors.green
                                        : Colors.red,
                                    content: Text(
                                      value == 'OK'
                                          ? 'Your message has been sent.'
                                          : 'Opp! Something went wrong.',
                                      textAlign: TextAlign.center,
                                    ),
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    width: 220.0,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                );
                              })
                            : const SizedBox();
                        setState(() {});
                      },
                      screenWidth: widget.screenWidth,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
