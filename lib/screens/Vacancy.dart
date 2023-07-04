import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_app/Model/VacancyModel.dart';
import 'package:pixel_app/Model/relevent_job_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/VacancyController.dart';

class VacancyPage extends StatefulWidget {
  const VacancyPage({Key? key}) : super(key: key);

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  int index = 0;
  // late Future<vacancyModel> allVacancies;
  // late Future<vacancyModel> relevantVacancies;
  List<String> data = ['NoId'];
  @override
  void initState() {
    GetData1();
    // TODO: implement initState
    super.initState();
  }

  Future<void> GetData() async {
    // allVacancies = VacancyController().GetAll();
    // relevantVacancies = VacancyController().GetRelevant();
  }

  GetData1() async {
    await GetData();
  }

  getApplied() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var a = await pref.getStringList('Vacancy');
    if (a == null) {
      data = ['No data'];
    } else {
      data = a;
    }
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    getApplied();
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Text(
          'Vacancies',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: 844.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      child: SizedBox(
                        height: 60.h,
                        width: 700.w,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 0;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: index == 0
                                        ? Colors.pink
                                        : Colors.grey.shade100,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade400,
                                          spreadRadius: 1,
                                          blurRadius: 10)
                                    ],
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      bottomLeft: Radius.circular(6),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Relevant',
                                      style: TextStyle(
                                          color: index == 1
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 1;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: index == 1
                                        ? Colors.pink
                                        : Colors.grey.shade100,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      )
                                    ],
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(6),
                                      bottomRight: Radius.circular(6),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'All',
                                      style: TextStyle(
                                          color: index == 0
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: index == 0,
                      child: Column(
                        children: [
                          //// This builder is for relevent jobs
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: FutureBuilder<RelevantModel>(
                                future: VacancyController().GetRelevant(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data?.data == null) {
                                      return Center(
                                          child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  20, 20, 20, 10),
                                              child: const Text(
                                                  "No Relevant Vacancy Available")));
                                    } else {
                                      return ListView.builder(
                                          itemCount:
                                              snapshot.data!.data!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.w,
                                                  right: 20.w,
                                                  top: 20.h),
                                              child: Container(
                                                width: 700.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    color: Colors.grey.shade100,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors
                                                              .grey.shade400,
                                                          spreadRadius: 1,
                                                          blurRadius: 10)
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.w,
                                                          right: 10.w,
                                                          top: 10.h),
                                                      child: Row(
                                                        children: [
                                                          /// calendar image
                                                          const Flexible(
                                                              child: Image(
                                                                  image: AssetImage(
                                                                      'assets/images/calendar2.png'))),
                                                          SizedBox(width: 12.w),
                                                          Container(
                                                            height: 80.h,
                                                            width: 1.w,
                                                            color: Colors.grey,
                                                          ),
                                                          SizedBox(width: 12.w),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              /// changes in vacancies
                                                              SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.6,
                                                                  child: Text(
                                                                    // jhb
                                                                    '${snapshot.data?.data?.elementAt(index).careHome!.name}',
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  )),

                                                              SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.6,
                                                                  child: Text(
                                                                    // jhb
                                                                    '${snapshot.data?.data?.elementAt(index).title}',
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  )),

                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                child: Text(
                                                                  'No of Staff: ${snapshot.data?.data!.elementAt(index).noOfStaff.toString()}',
                                                                  maxLines: 3,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  // style:
                                                                  // TextStyle(
                                                                  //   color: Colors
                                                                  //       .grey,
                                                                  //   fontSize:
                                                                  //   12.sp,
                                                                  // ),
                                                                ),
                                                              ),

                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                child: Text(
                                                                  'Time: ${snapshot.data?.data?.elementAt(index).timeStart} - ${snapshot.data?.data?.elementAt(index).timeEnd}',
                                                                  maxLines: 3,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  // style:
                                                                  // TextStyle(
                                                                  //   color: Colors
                                                                  //       .grey,
                                                                  //   fontSize:
                                                                  //   12.sp,
                                                                  // ),
                                                                ),
                                                              ),

                                                              //time star & time end
                                                              // SizedBox(
                                                              //   width: MediaQuery.of(
                                                              //               context)
                                                              //           .size
                                                              //           .width *
                                                              //       0.6,
                                                              //   child: Text(
                                                              //     'Time Start: ${snapshot.data?.data?.elementAt(index).timeStart}',
                                                              //     maxLines: 3,
                                                              //     overflow:
                                                              //         TextOverflow
                                                              //             .ellipsis,
                                                              //     // style:
                                                              //     // TextStyle(
                                                              //     //   color: Colors
                                                              //     //       .grey,
                                                              //     //   fontSize:
                                                              //     //   12.sp,
                                                              //     // ),
                                                              //   ),
                                                              // ),
                                                              // SizedBox(
                                                              //   width: MediaQuery.of(
                                                              //               context)
                                                              //           .size
                                                              //           .width *
                                                              //       0.6,
                                                              //   child: Text(
                                                              //     'Time End: ${snapshot.data?.data?.elementAt(index).timeEnd}',
                                                              //     maxLines: 3,
                                                              //     overflow:
                                                              //         TextOverflow
                                                              //             .ellipsis,
                                                              //     // style:
                                                              //     // TextStyle(
                                                              //     //   color: Colors
                                                              //     //       .grey,
                                                              //     //   fontSize:
                                                              //     //   12.sp,
                                                              //     // ),
                                                              //   ),
                                                              // ),

                                                              SizedBox(
                                                                  height: 5.h),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .access_time,
                                                                    color: const Color(
                                                                        0xff687bb9),
                                                                    size: 20.sp,
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          5.w),
                                                                  Text(
                                                                    // '${snapshot.data?.data!.elementAt(index).date.toString().substring(0, 10)} - ${snapshot.data?.data!.elementAt(index).jobEndDate.toString().substring(0, 11)}',
                                                                    '${snapshot.data?.data!.elementAt(index).date.toString().substring(0, 10)} -${snapshot.data?.data!.elementAt(index).jobEndDate.toString()} ',
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Color(
                                                                          0xff687bb9),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        await apply(
                                                                snapshot, index)
                                                            .then((value) {
                                                          setState(() {
                                                            getApplied();
                                                          });
                                                        });

                                                        // await VacancyController()
                                                        //     .Apply(snapshot
                                                        //         .data!
                                                        //         .data!
                                                        //         .first
                                                        //         .id);
                                                      },
                                                      child: Container(
                                                          child: Center(
                                                              child: Text(
                                                            '${data.contains(snapshot.data!.data!.elementAt(index).id.toString()) ? 'Applied' : 'Apply'}',
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                          )),
                                                          height: 40,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: data.contains(snapshot
                                                                    .data!.data!
                                                                    .elementAt(
                                                                        index)
                                                                    .id
                                                                    .toString())
                                                                ? Colors.blue
                                                                : Colors.pink,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  } else {
                                    return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      width: MediaQuery.of(context).size.width,
                                      child: const Center(
                                        child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: CircularProgressIndicator(
                                            color: Color(0xfffaeaea),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: index == 1,
                      child:
                          // data[0] == "No data"
                          //     ? Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //             Center(
                          //                 child: Container(
                          //                     margin: const EdgeInsets.fromLTRB(
                          //                         20, 200, 20, 10),
                          //                     child: Text(
                          //                         "No Relavent Vacancy Available")))
                          //           ])
                          //     :
                          Column(
                        children: [
                          //this builder is for all jobsss
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: FutureBuilder<RelevantModel>(
                                future: VacancyController().GetAll(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data!.data == null) {
                                      return Center(
                                          child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  20, 20, 20, 10),
                                              child: const Text(
                                                  "No Vacancy Available")));
                                    } else {
                                      return ListView.builder(
                                          itemCount:
                                              snapshot.data!.data!.length,
                                          itemBuilder: (context, index) {
                                            print(
                                                "okkkkk${snapshot.data?.data?.elementAt(index).noOfStaff}");
                                            // start setting date
                                            String? date = '';
                                            if (snapshot.data!.data!
                                                    .elementAt(index)
                                                    .date !=
                                                null) {
                                              date = snapshot.data!.data!
                                                  .elementAt(index)
                                                  .date
                                                  .toString()
                                                  .substring(0, 10);
                                            }
                                            if (snapshot.data!.data!
                                                    .elementAt(index)
                                                    .jobEndDate !=
                                                null) {
                                              date = "${date} - ";
                                              date = date +
                                                  snapshot.data!.data!
                                                      .elementAt(index)
                                                      .jobEndDate
                                                      .toString();
                                            }
                                            // end setting date

                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.w,
                                                  right: 20.w,
                                                  top: 20.h),
                                              child: Container(
                                                width: 700.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    color: Colors.grey.shade100,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors
                                                              .grey.shade400,
                                                          spreadRadius: 1,
                                                          blurRadius: 10)
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.w,
                                                          right: 10.w,
                                                          top: 10.h),
                                                      child: Row(
                                                        children: [
                                                          const Flexible(
                                                              child: Image(
                                                            image: AssetImage(
                                                                'assets/images/calendar2.png'),
                                                            height: 44,
                                                            width: 44,
                                                          )),
                                                          SizedBox(width: 12.w),
                                                          Container(
                                                            height: 80.h,
                                                            width: 1.w,
                                                            color: Colors.grey,
                                                          ),
                                                          SizedBox(width: 12.w),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.6,
                                                                  child: Text(
                                                                    // jhb
                                                                    '${snapshot.data?.data?.elementAt(index).careHome!.name}',
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  )),
                                                              SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.6,
                                                                  child: Text(
                                                                    // jhb
                                                                    '${snapshot.data?.data?.elementAt(index).title}',
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  )),
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                child: Text(
                                                                  'No of Staff: ${snapshot.data?.data!.elementAt(index).noOfStaff.toString()}',
                                                                  maxLines: 3,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  // style:
                                                                  // TextStyle(
                                                                  //   color: Colors
                                                                  //       .grey,
                                                                  //   fontSize:
                                                                  //   12.sp,
                                                                  // ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                child: Text(
                                                                  'Time: ${snapshot.data?.data?.elementAt(index).timeStart} - ${snapshot.data?.data?.elementAt(index).timeEnd}',
                                                                  maxLines: 3,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  // style:
                                                                  // TextStyle(
                                                                  //   color: Colors
                                                                  //       .grey,
                                                                  //   fontSize:
                                                                  //   12.sp,
                                                                  // ),
                                                                ),
                                                              ),

                                                              //Time start & Time End
                                                              // SizedBox(
                                                              //   width: MediaQuery.of(
                                                              //               context)
                                                              //           .size
                                                              //           .width *
                                                              //       0.6,
                                                              //   child: Text(
                                                              //     "Time Start : ${snapshot.data?.data?.elementAt(index).timeStart}",
                                                              //   ),
                                                              // ),
                                                              // SizedBox(
                                                              //   width: MediaQuery.of(
                                                              //               context)
                                                              //           .size
                                                              //           .width *
                                                              //       0.6,
                                                              //   child: Text(
                                                              //     "Time End : ${snapshot.data?.data?.elementAt(index).timeEnd}",
                                                              //   ),
                                                              // ),
                                                              SizedBox(
                                                                  height: 5.h),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .access_time,
                                                                    color: const Color(
                                                                        0xff687bb9),
                                                                    size: 20.sp,
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          5.w),
                                                                  Text(
                                                                    date.toString(),
                                                                    // '${snapshot.data?.data!.elementAt(index).date.toString().substring(0,10)} - ${snapshot.data?.data!.elementAt(index).jobEndDate.toString().substring(0,11)}',
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Color(
                                                                          0xff687bb9),
                                                                    ),
                                                                  ),
                                                                  // Text(
                                                                  //   '${snapshot.data?.data!.elementAt(index).timeStart}-${snapshot.data?.data!.elementAt(index).timeEnd}',
                                                                  //   style:
                                                                  //       TextStyle(
                                                                  //     color: Color(
                                                                  //         0xff687bb9),
                                                                  //   ),
                                                                  // ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        await apply(
                                                                snapshot, index)
                                                            .then((value) {
                                                          setState(() {
                                                            getApplied();
                                                          });
                                                        });
                                                      },
                                                      child: Container(
                                                          child: Center(
                                                              child: Text(
                                                            '${data.contains(snapshot.data!.data!.elementAt(index).id.toString()) ? 'Applied' : 'Apply'}',
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                          )),
                                                          height: 40,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: data.contains(snapshot
                                                                    .data!.data!
                                                                    .elementAt(
                                                                        index)
                                                                    .id
                                                                    .toString())
                                                                ? Colors.blue
                                                                : Colors.pink,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  } else {
                                    return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      width: MediaQuery.of(context).size.width,
                                      child: const Center(
                                        child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: CircularProgressIndicator(
                                            color: Color(0xfffaeaea),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future apply(snapshot, index) async {
    // SharedPreferences pref=await SharedPreferences.getInstance();
    // pref.setStringList('Vacancy',[]);
    await VacancyController().Apply(snapshot.data!.data!.elementAt(index).id);
  }
}
