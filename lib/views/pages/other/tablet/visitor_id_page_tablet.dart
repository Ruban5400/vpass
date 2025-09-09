import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../../constants/constants.dart';
import 'package:pdf/pdf.dart';

class VisitorIdPageTablet extends StatefulWidget {
  const VisitorIdPageTablet({Key? key, this.visitorData}) : super(key: key);
  final dynamic visitorData;

  @override
  State<VisitorIdPageTablet> createState() => _VisitorIdPageTabletState();
}

class _VisitorIdPageTabletState extends State<VisitorIdPageTablet> {
  final GlobalKey keys = GlobalKey();

  void _printScreen() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      // Capture the widget with the GlobalKey as an image
      final capturedImage = await WidgetWrapper.fromKey(
        key: keys,
        pixelRatio: 2.0,
      );

      doc.addPage(
        pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(capturedImage),
            );
          },
        ),
      );

      return doc.save();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1133, 744),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'visitor_id'.tr,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                color: AppColor.primaryColor,
              ),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Image.asset(Images.back),
              onPressed: () => Get.back(),
            ),
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: 100.h, bottom: 20.w),
              child: Center(
                child: SizedBox(
                  height: 500.h,
                  width: 320.w,
                  // 👇 Wrap with RepaintBoundary and GlobalKey
                  child: RepaintBoundary(
                    key: keys,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColor.textButtonColor,
                                offset: Offset(0.0, 1.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.5,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Image.asset(
                                    Images.logo,
                                    height: 60,
                                    fit: BoxFit.contain,
                                  ),
                                ),

                                // 🔹 Visitor Photo
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 20),
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    image: DecorationImage(
                                      image: NetworkImage(widget.visitorData['image'].toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 20),
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                        image: NetworkImage(widget.visitorData['image'].toString()),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  widget.visitorData['name'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: AppColor.titleColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'phone_lbl'.tr +
                                      widget.visitorData['country_code'] +
                                      widget.visitorData['phone'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColor.titleColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'id#'.tr + widget.visitorData['reg_no'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColor.titleColor,
                                  ),
                                ),
                                const SizedBox(height: 18),
                                const Text(
                                  'Visited To',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: AppColor.titleColor,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'host'.tr + widget.visitorData['employee'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColor.titleColor,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Divider(height: 2, color: AppColor.hintColor),
                                const SizedBox(height: 24),
                                Text(
                                  widget.visitorData['site_name'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColor.titleColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  widget.visitorData['site_address'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColor.titleColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'email_lbl'.tr + widget.visitorData['site_email'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColor.titleColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 320,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: _printScreen,
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: AppColor.primaryColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: Text(
                                    'print'.tr,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


// old code
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:printing/printing.dart';
// import 'package:pdf/widgets.dart' as pw;
// import '../../../../constants/constants.dart';
// import 'package:pdf/pdf.dart';
//
// class VisitorIdPageTablet extends StatefulWidget {
//   const VisitorIdPageTablet({Key? key, this.visitorData}) : super(key: key);
//   final dynamic visitorData;
//
//   @override
//   State<VisitorIdPageTablet> createState() => _VisitorIdPageTabletState();
// }
//
// class _VisitorIdPageTabletState extends State<VisitorIdPageTablet> {
//   final GlobalKey<State<StatefulWidget>> keys = GlobalKey();
//   void _printScreen() {
//     Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
//       final doc = pw.Document();
//
//       final image = await WidgetWrapper.fromKey(
//         key: keys,
//         pixelRatio: 2.0,
//       );
//
//       doc.addPage(pw.Page(
//           pageFormat: format,
//           build: (pw.Context context) {
//             return pw.Center(
//               child: pw.Expanded(
//                 child: pw.Image(image),
//               ),
//             );
//           }));
//
//       return doc.save();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(1133, 744),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (BuildContext context, Widget? child) {
//         return Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               title: Text(
//                 'visitor_id'.tr,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 20.sp,
//                   color: AppColor.primaryColor,
//                 ),
//               ),
//               centerTitle: true,
//               elevation: 0,
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                 icon: Image.asset(Images.back),
//                 onPressed: () {
//                   Get.back();
//                 },
//               ),
//             ),
//             body: SingleChildScrollView(
//               physics: const NeverScrollableScrollPhysics(),
//               child: Padding(
//                 padding: EdgeInsets.only(top: 100.h, bottom: 20.w),
//                 child: Center(
//                   child: SizedBox(
//                     height: 500.h,
//                     width: 320.w,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: AppColor.textButtonColor,
//                                 offset: Offset(
//                                   0.0,
//                                   1.0,
//                                 ), //Offset
//                                 blurRadius: 10.0,
//                                 spreadRadius: 0.5,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
//                               ), //BoxShadow
//                             ],
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 20, bottom: 20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Center(
//                                   child: Container(
//                                     margin: const EdgeInsets.symmetric(
//                                         vertical: 20),
//                                     width: 120,
//                                     height: 120,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(60),
//                                       image: DecorationImage(
//                                           image: NetworkImage(widget
//                                               .visitorData['image']
//                                               .toString()),
//                                           fit: BoxFit.cover),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   widget.visitorData['name'].toString(),
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 18,
//                                     color: AppColor.titleColor,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   'phone_lbl'.tr +
//                                       widget.visitorData['country_code'] +
//                                       widget.visitorData['phone'].toString(),
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16,
//                                     color: AppColor.titleColor,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   'id#'.tr +
//                                       widget.visitorData['reg_no'].toString(),
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16,
//                                     color: AppColor.titleColor,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 18),
//                                 const Text(
//                                   'Visited To',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 20,
//                                     color: AppColor.titleColor,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 12),
//                                 Text(
//                                   'host'.tr +
//                                       widget.visitorData['employee'].toString(),
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 14,
//                                     color: AppColor.titleColor,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 24),
//                                 const Divider(
//                                   height: 2,
//                                   color: AppColor.hintColor,
//                                 ),
//                                 const SizedBox(height: 24),
//                                 Text(
//                                   widget.visitorData['site_name'].toString(),
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 16,
//                                     color: AppColor.titleColor,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   widget.visitorData['site_address'].toString(),
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 16,
//                                     color: AppColor.titleColor,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   'email_lbl'.tr +
//                                       widget.visitorData['site_email']
//                                           .toString(),
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16,
//                                     color: AppColor.titleColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 48,
//                           width: double.infinity,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 width: 320,
//                                 height: 48,
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     _printScreen();
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                       foregroundColor: Colors.white,
//                                       backgroundColor: AppColor.primaryColor,
//                                       elevation: 0,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(50),
//                                       )),
//                                   child: Text(
//                                     'print'.tr,
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ));
//       },
//     );
//   }
// }
