import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:wafed/Screens/choose_topic_page.dart';
import 'package:wafed/Screens/t_key.dart';
import 'package:wafed/cubits/login_cubit/login_cubit.dart';
import 'package:wafed/helper/shared_preferences.dart';
import 'package:wafed/helper/show_snack_bar.dart';

class Log_in_Page extends StatefulWidget {
  @override
  State<Log_in_Page> createState() => _Log_in_PageState();
}

class _Log_in_PageState extends State<Log_in_Page> {
  String? email, password;

  bool isLoading = false;

  CacheData cacheData = CacheData();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    email = await cacheData.getEmail();
    password = await cacheData.getPassword();
    if (email != null && password != null) {
      // ignore: use_build_context_synchronously
      BlocProvider.of<LoginCubit>(context)
          .loginUser(context: context, email: email!, password: password!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSucsessState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Choose_Topic_Page()),
          );
          // Navigator.pushNamed(context, PeopleScreen.id, argument
          //s: email);
          isLoading = false;
        } else if (state is LoginFailureState) {
          showSnackBar(
              context: context,
              text: state.errMessage,
              icon: Icons.error,
              backColor: Colors.red);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/all/Frame_41-removebg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 80.sp,
                      ),
                      Text(
                        TKeys.login1.translate(context),
                        style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF909090),
                          fontSize: 30.sp,
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Text(
                        TKeys.login2.translate(context),
                        style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF432C1E),
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(height: 20.sp),
                      TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          hintText: "ID",
                          icon: Icon(
                            Icons.account_box_outlined,
                            color: Color.fromARGB(245, 67, 44, 30),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.sp),
                      TextField(
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          icon: Icon(
                            Icons.lock,
                            color: Color.fromARGB(245, 67, 44, 30),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.sp),
                      Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(245, 67, 44, 30),
                                elevation: 3,
                                padding: EdgeInsets.only(
                                  left: 40.sp,
                                  right: 40.sp,
                                ),
                                shape: StadiumBorder(),
                              ),
                              onPressed: () {
                                //to login user
                                BlocProvider.of<LoginCubit>(context).loginUser(
                                  context: context,
                                  email: email!,
                                  password: password!,
                                );

                                //to register user

                                // BlocProvider.of<RegisterCubit>(context)
                                //     .registerUser(
                                //         context: context,
                                //         name: 'Rewan  ',
                                //         email: email!,
                                //         password: password!,
                                //         confirmPassword: password!);

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Choose_Topic_Page()),
                                // );
                              },
                              child: Text(
                                TKeys.login3.translate(context),
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Graduate',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                ),
                              ))),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(245, 67, 44, 30),
                                elevation: 3,
                                padding: EdgeInsets.only(
                                  left: 40.sp,
                                  right: 40.sp,
                                ),
                                shape: StadiumBorder(),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Choose_Topic_Page()),
                                );
                              },
                              child: Text(
                                TKeys.login4.translate(context),
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Graduate',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                ),
                              ))),
                      SizedBox(height: 30),
                      Center(
                          // Centering the GestureDetector
                          // child: GestureDetector(
                          //   onTap: () {
                          //     // Handle forget password action
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => Forget_Password_Page()),
                          //     );
                          //   },
                          //   // child: Text(
                          //   //   'Forgot Password',
                          //   //   style: TextStyle(
                          //   //     color: Color.fromARGB(255, 67, 44, 30),
                          //   //     fontSize: 18.sp,
                          //   //   ),
                          //   // ),
                          // ),
                          )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
