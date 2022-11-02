import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_project_v2/main.dart';
import 'package:portfolio_project_v2/src/modules/contact/controllers/contact_controller.dart';
import 'package:portfolio_project_v2/src/modules/footer/screens/footer_section.dart';
import 'package:portfolio_project_v2/src/widgets/contact/contact_destop_and_tablet_size.dart';
import 'package:portfolio_project_v2/src/widgets/contact/contact_mobile_size.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/custom_animated_drawer.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/animated_transition_container.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/custom_app_bar.dart';
import 'package:http/http.dart' as http;

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

Future<String> sendEmail({
  required String name,
  required String email,
  required String message,
}) async {
  const serviceId = 'service_hrs5p28';
  const templateId = 'template_qjq5v1b';
  const userId = '-f5uBeRIeDTTR81pi';
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_message': message,
        }
      }));

  debugPrint("respon body :${response.body}");
  return response.body;
}

class _ContactScreenState extends State<ContactScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  var contactController = Get.put(ContactController());

  @override
  void initState() {
    showOverlayTransAboutScreen(context);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeIn,
    );
    contactController.clearControllerAndValidate();
    super.initState();
  }

  showOverlayTransAboutScreen(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context)!;
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(builder: (context) {
      return const AnimatedTransContainer();
    });
    setState(() {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => overlayState.insert(overlayEntry));
    });

    await Future.delayed(const Duration(milliseconds: 2100));

    setState(() {
      overlayEntry.remove();
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      drawer: CustomAnimatedDrawer(
          isContactHover: true,
          animation: animation,
          animationController: animationController),
      extendBody: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            animationController: animationController,
            globalKey: _key,
            itemHovered: itemHovered,
            isSelected: 3,
          )),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ContactDesktopAndTabletSize(
                screenWidth: screenWidth,
              ),
              ContactMobileSize(
                screenWidth: screenWidth,
              ),
              const SizedBox(
                height: 100,
              ),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
