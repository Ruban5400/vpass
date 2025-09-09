import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../../constants/constants.dart';
import 'home_page.dart';

class VisitorIdPage extends StatefulWidget {
  const VisitorIdPage({Key? key, required this.visitorData}) : super(key: key);
  final dynamic visitorData;

  @override
  State<VisitorIdPage> createState() => _VisitorIdPageState();
}

class _VisitorIdPageState extends State<VisitorIdPage> {
  /// Generate PDF for printing
  Future<void> _printScreen() async {
    final doc = pw.Document();

    // Load logo image (from assets)
    final logo = await imageFromAssetBundle('assets/images/logo.png');

    // Load visitor photo (from network)
    final visitorPhoto = await networkImage(widget.visitorData['image'].toString());

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a6, // Small badge size
        margin: const pw.EdgeInsets.all(16),
        build: (pw.Context context) {
          return pw.Container(
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.grey, width: 1),
              borderRadius: pw.BorderRadius.circular(10),
            ),
            child: pw.Padding(
              padding: const pw.EdgeInsets.all(12),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  // Top Logo
                  pw.Image(logo, height: 40),
                  pw.SizedBox(height: 12),

                  // Visitor photo
                  pw.Container(
                    width: 90,
                    height: 90,
                    decoration: pw.BoxDecoration(
                      shape: pw.BoxShape.circle,
                      image: pw.DecorationImage(image: visitorPhoto, fit: pw.BoxFit.cover),
                    ),
                  ),
                  pw.SizedBox(height: 12),

                  // Visitor name
                  pw.Text(
                    widget.visitorData['name'].toString(),
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 6),

                  // Phone
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text("Phone: ", style: const pw.TextStyle(fontSize: 12)),
                      pw.Text(
                        "${widget.visitorData['country_code']}${widget.visitorData['phone']}",
                        style: const pw.TextStyle(fontSize: 12),
                      ),
                    ],
                  ),

                  // ID Number
                  pw.Text(
                    "ID#: ${widget.visitorData['reg_no']}",
                    style: const pw.TextStyle(fontSize: 12),
                  ),
                  pw.SizedBox(height: 10),

                  // Divider
                  pw.Divider(),

                  // Visited To
                  pw.Text(
                    "Visited To",
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(widget.visitorData['employee'].toString()),

                  pw.SizedBox(height: 10),
                  pw.Divider(),

                  // Site Details
                  pw.Text(
                    widget.visitorData['site_name'].toString(),
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(widget.visitorData['site_address'].toString(),
                      textAlign: pw.TextAlign.center, style: const pw.TextStyle(fontSize: 11)),
                  pw.SizedBox(height: 4),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text("Email: ", style: const pw.TextStyle(fontSize: 12)),
                      pw.Text(
                        widget.visitorData['site_email'].toString(),
                        style: const pw.TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(onLayout: (format) async => doc.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'visitor_id'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColor.primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Preview Card (UI only, not printed)
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
                ],
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(widget.visitorData['image'].toString()),
                  ),
                  const SizedBox(height: 15),

                  // Visitor Name
                  Text(
                    widget.visitorData['name'].toString(),
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),

                  // Phone & ID
                  Text("📞 +${widget.visitorData['country_code']}${widget.visitorData['phone']}"),
                  Text("ID#: ${widget.visitorData['reg_no']}"),
                  const SizedBox(height: 10),

                  Divider(),

                  // Visited To
                  const Text(
                    "Visited To",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(widget.visitorData['employee'].toString()),

                  const SizedBox(height: 10),
                  Divider(),

                  // Site Details
                  Text(
                    widget.visitorData['site_name'].toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.visitorData['site_address'].toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 11),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "📧 ${widget.visitorData['site_email']}",
                    style: const TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),


            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Get.off(() => HomePage()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColor.primaryColor,
                    side: const BorderSide(color: AppColor.borderColor),
                  ),
                  child: Text('home'.tr),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed: _printScreen,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('print'.tr),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:printing/printing.dart';
// import 'package:visitor_pass/views/pages/other/mobile/home_page.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import '../../../../constants/constants.dart';
//
// class VisitorIdPage extends StatefulWidget {
//   const VisitorIdPage({Key? key, required this.visitorData}) : super(key: key);
//   final dynamic visitorData;
//
//   @override
//   State<VisitorIdPage> createState() => _VisitorIdPageState();
// }
//
// class _VisitorIdPageState extends State<VisitorIdPage> {
//   final GlobalKey<State<StatefulWidget>> keys = GlobalKey();
//
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
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text(
//             'visitor_id'.tr,
//             style: const TextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 20,
//               color: AppColor.primaryColor,
//             ),
//           ),
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: Colors.white,
//         ),
//         body: SingleChildScrollView(
//           physics: const NeverScrollableScrollPhysics(),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
//             child: SizedBox(
//               height: ScreenSize(context).mainHeight / 1.2,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   RepaintBoundary(
//                     key: keys,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: AppColor.textButtonColor,
//                             offset: Offset(
//                               0.0,
//                               1.0,
//                             ), //Offset
//                             blurRadius: 10.0,
//                             spreadRadius: 0.5,
//                           ), //BoxShadow
//                           BoxShadow(
//                             color: Colors.white,
//                             offset: Offset(0.0, 0.0),
//                             blurRadius: 0.0,
//                             spreadRadius: 0.0,
//                           ), //BoxShadow
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 20, bottom: 40),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: Container(
//                                 margin:
//                                     const EdgeInsets.symmetric(vertical: 20),
//                                 width: 120,
//                                 height: 120,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(60),
//                                   image: DecorationImage(
//                                       image: NetworkImage(widget
//                                           .visitorData['image']
//                                           .toString()),
//                                       fit: BoxFit.cover),
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               widget.visitorData['name'].toString(),
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 18,
//                                 color: AppColor.titleColor,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               'phone_lbl'.tr +
//                                   widget.visitorData['country_code']
//                                       .toString() +
//                                   widget.visitorData['phone'].toString(),
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16,
//                                 color: AppColor.titleColor,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               'id#'.tr +
//                                   widget.visitorData['reg_no'].toString(),
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16,
//                                 color: AppColor.titleColor,
//                               ),
//                             ),
//                             const SizedBox(height: 18),
//                             const Text(
//                               'Visited To',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 20,
//                                 color: AppColor.titleColor,
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             Text(
//                               'host'.tr +
//                                   widget.visitorData['employee'].toString(),
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 14,
//                                 color: AppColor.titleColor,
//                               ),
//                             ),
//                             const SizedBox(height: 24),
//                             const Divider(
//                               height: 2,
//                               color: AppColor.hintColor,
//                             ),
//                             const SizedBox(height: 24),
//                             Text(
//                               widget.visitorData['site_name'].toString(),
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                                 color: AppColor.titleColor,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               widget.visitorData['site_address'].toString(),
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                                 color: AppColor.titleColor,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               'email_lbl'.tr +
//                                   widget.visitorData['site_email'].toString(),
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16,
//                                 color: AppColor.titleColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 48,
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: 120,
//                           height: 48,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Get.off(() => HomePage());
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 foregroundColor: AppColor.primaryColor,
//                                 backgroundColor: Colors.white,
//                                 elevation: 0,
//                                 shape: RoundedRectangleBorder(
//                                   side: const BorderSide(
//                                       color: AppColor.borderColor),
//                                   borderRadius: BorderRadius.circular(5),
//                                 )),
//                             child: Text(
//                               'home'.tr,
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 50,
//                         ),
//                         SizedBox(
//                           width: 126,
//                           height: 48,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               _printScreen();
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 foregroundColor: Colors.white,
//                                 backgroundColor: AppColor.primaryColor,
//                                 elevation: 0,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5),
//                                 )),
//                             child: Text(
//                               'print'.tr,
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
