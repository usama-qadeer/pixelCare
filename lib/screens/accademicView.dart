import 'package:flutter/material.dart';
import 'package:pixel_app/Model/AccademicQualModel.dart';

import '../Constants/Constant.dart';
import '../Controller/AuthController.dart';
import '../widgets/bottomNavigationBar/BottomNavigation.dart';
import 'AcademicQualification.dart';
import 'Profile.dart';

class AccademicView extends StatefulWidget {
  const AccademicView({Key? key}) : super(key: key);

  @override
  State<AccademicView> createState() => _AccademicViewState();
}

class _AccademicViewState extends State<AccademicView> {
  GlobalKey<ScaffoldState> key = new GlobalKey();
  @override
  void initState() {
    // TODO: implement initState

    academicnav = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        bottomNavigationBarState.selectedIndex = 0;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const ProfilePage()),
            (Route route) => false);
        return false as Future<bool>;
      },
      child: Scaffold(
        key: key,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ProfilePage()));
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),

          // GestureDetector(
          //     onTap: () {
          //       Navigator.of(context).pushReplacement(
          //           MaterialPageRoute(builder: (context) => ProfilePage()));
          //     },
          //     child: Icon(
          //       Icons.arrow_back,
          //       color: Colors.black,
          //     )),
          actions: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    academicnav = true;
                  });
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const AcademicPage()));
                },
                child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    padding: const EdgeInsets.all(05),
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: const [
                        Text(
                          ' Add New Qualification ',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ))),
          ],
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<AccademicQualModel>(
              future: AuthController().GetQual(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.data!.length != 0) {
                    return Column(
                      children: [
                        const SizedBox(height: 10),
                        Column(
                            children: List.generate(
                                snapshot.data!.data!.length,
                                (index) => Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade400,
                                                spreadRadius: 1,
                                                blurRadius: 10)
                                          ]),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Degree: ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                        '${snapshot.data?.data?.elementAt(index).degree}',
                                                        style:
                                                            const TextStyle()),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                      onTap: () async {
                                                        showDialog<void>(
                                                          context: context,
                                                          barrierDismissible:
                                                              false, // user must tap button!
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Are you sure?'),
                                                              content:
                                                                  SingleChildScrollView(
                                                                child: ListBody(
                                                                  children: const <
                                                                      Widget>[
                                                                    Text(
                                                                        'This action cannot be undone.'),
                                                                  ],
                                                                ),
                                                              ),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                  child: const Text(
                                                                      'Cancel',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .green,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                                TextButton(
                                                                  child:
                                                                      const Text(
                                                                    'Delete',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    // Perform the delete action here
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(const SnackBar(
                                                                            content: Text(
                                                                      "Deletion is in progress...",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    )));
                                                                    var response = await AuthController().DeleteQual(snapshot
                                                                        .data
                                                                        ?.data
                                                                        ?.elementAt(
                                                                            index)
                                                                        .id);
                                                                    setState(
                                                                        () {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(SnackBar(
                                                                              content: Text(
                                                                        response,
                                                                        style: const TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      )));
                                                                    });

                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    Navigator
                                                                        .pushReplacement(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              const AccademicView()),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      ))
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 05,
                                          ),
                                          Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'University: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Flexible(
                                                    child: Text(
                                                        '${snapshot.data?.data?.elementAt(index).university}',
                                                        style:
                                                            const TextStyle())),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Passing Year: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Flexible(
                                                    child: Text(
                                                        '${snapshot.data?.data?.elementAt(index).passingYear}',
                                                        style:
                                                            const TextStyle())),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))),
                      ],
                    );
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(
                          'No qualification added yet!',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    );
                  }
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: Colors.pinkAccent.shade100.withOpacity(0.5),
                      ),
                    )),
                  );
                }
              }),
        ),
      ),
    );
  }
}
