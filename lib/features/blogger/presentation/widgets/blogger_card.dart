import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart' as firebaseStorage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness/features/blogger/data/controllers/blogger_controller.dart';
import 'package:fitness/features/blogger/presentation/screens/course_information_screen.dart';
import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../internal/helpers/color_helper.dart';

class BloggerCard extends StatefulWidget {
  const BloggerCard({
    super.key,
  });

  @override
  State<BloggerCard> createState() => _BloggerCardState();
}

class _BloggerCardState extends State<BloggerCard> {
  late String imageUrl;
  final storage = FirebaseStorage.instance;

  // @override
  // void initState() {
  //   super.initState();

  //   imageUrl = "";
  //   getImageUrl();
  // }

  // Future<void> getImageUrl() async {
  //   final ref = storage.ref().child(("image1.jpg"));
  //   final url = await ref.getDownloadURL();
  //   setState(() {
  //     imageUrl = url;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BloggerController());
    return FutureBuilder(
        future: controller.getAllBloggers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.separated(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                itemBuilder: (context, index) {
                  return Container(
                    width: 353.w,
                    height: 160.h,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1,
                        color: ColorHelper.white10,
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                              snapshot.data![index].bloggerCardImage),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![index].bloggerCardName,
                          style: TextHelper.w700s16
                              .copyWith(color: ColorHelper.greyD1D3D3),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          snapshot.data![index].bloggerCourseName,
                          style: TextHelper.w700s16
                              .copyWith(color: ColorHelper.greyD1D3D3),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Spacer(),
                            Container(
                              width: 79.w,
                              height: 19.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color:
                                        ColorHelper.blue01DDEB.withOpacity(0.8),
                                  )
                                ],
                                color: ColorHelper.blue01DDEB.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              child: Text(
                                "Подробнее",
                                style: TextHelper.w400s11,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CourseInformationScreen();
                                }));
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: ColorHelper.greyD1D3D3,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => SizedBox(height: 30.h),
              );
            } else if (snapshot.hasError) {
              print("ERRRROOR=====${e.toString()}");
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
          } else {
            return const CircularProgressIndicator.adaptive();
          }
        });
  }
}
