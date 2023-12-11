import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController controller1 = TextEditingController();
  var code = '+92';
  // ignore: prefer_typing_uninitialized_variables
  var url;
  var phone = '';
  //////////////
  void openwhatsapp() async {
    String phone = controller1.text.trim();

    switch (phone.length) {
      case 11:
        // phone = phone.substring(1);
        phone = phone.replaceFirst('0', '');
        code = code.replaceAll('+', '');
        url = 'https://wa.me/$code$phone';
        launchUrl(Uri.parse(url));
        break;
      case 10:
        code = code.replaceAll('+', "");
        //  phone = phone.replaceFirst('0', '');

        String url = 'https://wa.me/$code$phone';
        launchUrl(Uri.parse(url));
        break;
      case 13:
        // code = code.replaceAll('+92', "");
        phone = phone.replaceFirst('92', '');

        String url = 'https://wa.me/$code$phone';
        launchUrl(Uri.parse(url));
        break;
      default:
        throw 'could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 32, 87, 60),
            title: const Center(
              child: Text(
                'CLick to Chat',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: ListView(children: [
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Container(
                      height: 140,
                      width: 150,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/bb.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Container(
                    height: 600,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 23, 32, 36),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 19, 31, 36),
                                boxShadow: const [
                                  BoxShadow(
                                    //  color: Color(0xffd9d9d9),
                                    spreadRadius: 5,
                                    blurRadius: 4,
                                    offset: Offset(0, 8),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(12)),
                            child: CountryCodePicker(
                              textStyle: const TextStyle(
                                  fontSize: 26, color: Colors.white38),

                              onChanged: (val) {
                                code = val.toString();
                              },
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: 'PK',
                              favorite: ['+92', 'PK'],
                              // optional. Shows only country name and flag
                              showCountryOnly: false,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              // optional. aligns the flag and the Text left
                              alignLeft: false,
                              flagWidth: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45, right: 45),
                          child: TextField(
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white54),
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              phone = value;
                            },
                            controller: controller1,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 2)),
                              fillColor: Colors.white,
                              hintText: 'Enter Number',
                              hintStyle: TextStyle(color: Colors.white60),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Enter a Number without save in SmartPhone only Click Button to Directly Open WhatsApp. ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            openwhatsapp();
                          },
                          child: Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 37, 127, 82),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                'Click Button',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Powered By Moavia Chail',
                          style: TextStyle(color: Colors.white38),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
