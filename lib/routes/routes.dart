import 'package:get/get.dart';
import 'package:visitor_pass/views/pages/appointment/mobile/appointment_page.dart';
import 'package:visitor_pass/views/pages/beenBefore/mobile/been_before_page.dart';
import 'package:visitor_pass/views/pages/appointment/tablet/appointment_page_tablet.dart';
import 'package:visitor_pass/views/pages/beenBefore/tablet/been_before_page_tablet.dart';
import 'package:visitor_pass/views/pages/other/tablet/take_photo_page_tablet.dart';
import 'package:visitor_pass/views/pages/other/tablet/visitor_id_page_tablet.dart';

import '../constants/constants.dart';
import '../views/pages/beenBefore/mobile/been_before_visitor_page.dart';
import '../views/pages/checkin/mobile/visitor_checkin_page.dart';
import '../views/pages/checkout/mobile/visitor_checkout_page.dart';
import '../views/pages/other/mobile/home_page.dart';
import '../views/pages/other/tablet/home_page_tablet.dart';
import '../views/pages/other/mobile/take_photo_page.dart';
import '../views/pages/other/mobile/visitor_id_page.dart';

abstract class Routes {
  static final pages = [
    GetPage(
        name: "/",
        page: () => box.read('isMobile') ? HomePage() : const HomePageTablet()),
    GetPage(
        name: "/AppointmentPage",
        page: () =>
            box.read('isMobile') ? AppointmentPage() : AppointmentPageTablet()),
    GetPage(
        name: "/BeenBeforePage",
        page: () =>
            box.read('isMobile') ? BeenBeforePage() : BeenBeforePageTablet()),
    GetPage(
        name: "/CheckInOnePage",
        page: () => box.read('isMobile')
            ? BeenBeforeVisitorDetailsPage()
            : BeenBeforeVisitorDetailsPage()),
    GetPage(
        name: "/VisitorCheckInPage",
        page: () =>
            box.read('isMobile') ? VisitorCheckInPage() : VisitorCheckInPage()),
    GetPage(
        name: "/TakePhotoPage",
        page: () => box.read('isMobile')
            ? TakePhotoPage(
                visitorData: null,
              )
            : TakePhotoPageTablet(
                visitorData: null,
              )),
    GetPage(
        name: "/VisitorIdPage",
        page: () => box.read('isMobile')
            ? const VisitorIdPage(
                visitorData: null,
              )
            : const VisitorIdPageTablet()),
    GetPage(name: "/VisitorCheckoutPage", page: () => VisitorCheckoutPage()),
  ];
}
