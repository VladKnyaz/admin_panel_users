import 'package:flutter/material.dart';
import 'package:users_app/src/services/user.service.dart';
import 'package:users_app/src/widgets/person_edit_component.dart';

void showModalPersonSheet(BuildContext context, userInfo, getData) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      context: context,
      builder: (context) {
        String userName = userInfo['info']['name'];
        String userLogin = userInfo['info']['login'];
        String userPassword = userInfo['info']['password'];
        bool isLoading = false;
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            void changeName(String name) {
              setState(() {
                userName = name;
              });
            }

            void changeLogin(String login) {
              setState(() {
                userLogin = login;
              });
            }

            void changePassword(String password) {
              setState(() {
                userPassword = password;
              });
            }

            void changeLoading(bool isLoadingArg) {
              setState(() {
                isLoading = isLoadingArg;
              });
            }

            return Container(
              padding: EdgeInsets.only(left: 42, top: 40, right: 42),
              height: MediaQuery.of(context).size.height * 0.84,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Text(
                  'ID: ${userInfo["id"]}',
                  style: TextStyle(fontSize: 24),
                ),
                ModalInputComponent(
                  "Имя",
                  null,
                  onChangeFunction: changeName,
                ),
                ModalInputComponent(
                  "Логин",
                  EdgeInsets.only(top: 25),
                  onChangeFunction: changeLogin,
                ),
                ModalInputComponent(
                  "Пароль",
                  EdgeInsets.only(top: 25),
                  onChangeFunction: changePassword,
                ),
                Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonInModal(
                        "Сохранить",
                        onPressed: () {
                          Navigator.pop(context);
                          BuildContext ctxLoader = context;
                          UserService.updateUser(userInfo['id'],
                                  name: userName,
                                  login: userLogin,
                                  password: userPassword)
                              .then((res) {
                            print(res);
                            getData();
                            
                            Navigator.of(ctxLoader).pop();
                          });
                          showDialog(
                            barrierDismissible: false,
                            builder: (ctx) {
                              ctxLoader = ctx;
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            },
                            context: context,
                          );
                          getData();
                        },
                        // isLoading: isLoading,
                      ),
                      ButtonInModal(
                        "Отменить",
                        onPressed: () {
                          Navigator.pop(context);
                          getData();
                        },
                      ),
                    ],
                  ),
                )
              ]),
            );
          },
        );
      });
}
