import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:practice_project_flutter/app/app.dart';
import 'package:practice_project_flutter/hover_effect/on_hover_effect.dart';
import 'package:practice_project_flutter/modal/user_modal.dart';
import 'package:practice_project_flutter/neumorphisum/Neumorphism.dart';
import 'package:practice_project_flutter/neumorphisum/concave_decoration.dart';
import 'package:practice_project_flutter/provider/user_controller.dart';
import 'package:provider/provider.dart';

class FadingListViewWidget extends StatefulWidget {
  @override
  State<FadingListViewWidget> createState() => _FadingListViewWidgetState();
}

class _FadingListViewWidgetState extends State<FadingListViewWidget> {
  bool isAssending = true;
  bool isNeumorphism = false;

  final scroll_controller = ScrollController();
  List<Data>? userList;

  @override
  void initState() {
    super.initState();
    getUser();

    scroll_controller.addListener(() {
      setState(() {});
    });
  }

  getUser() {
    var userController = Provider.of<UserController>(
        App.materialkey.currentContext!,
        listen: false);
    userController.getUsers();
  }

  @override
  void dispose() {
    scroll_controller.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.white;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: InkWell(
            onTap: () {
              isNeumorphism = !isNeumorphism;
              setState(() {});
            },
            borderRadius: BorderRadius.circular(20),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceOut,
              width: 150,
              height: 150,
              decoration: isNeumorphism
                  ? ConcaveDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      depression: 20,
                      colors: [
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                        ])
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primaryColor,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(-8, -8),
                          blurRadius: 5,
                          color: isNeumorphism
                              ? Colors.grey.shade300
                              : Colors.grey.withOpacity(0.3),
                          // inset: isNeumorphism,
                        ),
                        BoxShadow(
                          offset: Offset(10, 10),
                          blurRadius: 8,
                          color: isNeumorphism
                              ? Colors.grey.shade200
                              : Colors.grey.withOpacity(0.3),
                          // inset: isNeumorphism,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
      // child: Scaffold(
      //   body: Consumer<UserController>(builder: (context, userController, _) {
      //     //       return userController.loading
      //     //           ? const Center(child: CircularProgressIndicator())
      //     //           : Column(
      //     //               children: [
      //     //                 IconButton(
      //     //                     onPressed: () =>
      //     //                         setState(() => isAssending = !isAssending),
      //     //                     icon: const Icon(Icons.sort)),
      //     //                 Expanded(
      //     //                   child: ReorderableListView.builder(
      //     //                     // controller: scroll_controller,
      //     //
      //     //                     onReorder: (int oldIndex, int newIndex) => setState(() {
      //     //                       final index =
      //     //                           newIndex > oldIndex ? newIndex - 1 : newIndex;
      //     //                       final user = userList?.removeAt(oldIndex);
      //     //                       userList?.insert(index, user as Data);
      //     //                     }),
      //     //
      //     //                     itemCount: userController.userModal?.data?.length ?? 0,
      //     //                     itemBuilder: (BuildContext context, int index) {
      //     //                       userList = userController.userModal?.data;
      //     //                       // userList?.sort((a, b) => isAssending
      //     //                       //     ? a.firstName
      //     //                       //         .toString()
      //     //                       //         .compareTo(b.firstName.toString())
      //     //                       //     : b.firstName
      //     //                       //         .toString()
      //     //                       //         .compareTo(a.firstName.toString()));
      //     //
      //     //                       return Card(
      //     //                         key: ValueKey("${userList?[index].id}"),
      //     //                         color: Colors.orangeAccent,
      //     //                         child: ListTile(
      //     //                           leading: CircleAvatar(
      //     //                             backgroundImage:
      //     //                                 NetworkImage("${userList?[index].avatar}"),
      //     //                           ),
      //     //                           title: Text("${userList?[index].firstName}"),
      //     //                         ),
      //     //                       );
      //     //                     },
      //     //                   ),
      //     //                 ),
      //     //               ],
      //     //             );
      //     //     }),
      //     //   ),
      //     // );
      //
      //     return Stack(
      //       fit: StackFit.loose,
      //       children: [
      //         ListView.builder(
      //           controller: scroll_controller,
      //           itemCount: userController.userModal?.data?.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             final fstName = userController.userModal?.data;
      //             fstName?.sort((a, b) =>
      //                 a.firstName.toString().compareTo(b.firstName.toString()));
      //
      //             return OnHoverEffect(
      //               child: (isHover) {
      //                 return Padding(
      //                   padding: const EdgeInsets.symmetric(vertical: 4.0),
      //                   child: Card(
      //                     color: isHover ? Colors.orange : Colors.orangeAccent,
      //                     child: ListTile(
      //                       title: Text(
      //                         "${fstName?[index].firstName}",
      //                         style: TextStyle(
      //                           color: isHover ? Colors.white : Colors.black,
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 );
      //               },
      //             );
      //           },
      //         ),
      //         // if (scroll_controller.hasClients)
      //         //   if (scroll_controller.position.pixels !=
      //         //       scroll_controller.position.maxScrollExtent)
      //         Positioned(
      //           bottom: 0,
      //           left: 0,
      //           right: 0,
      //           child: Container(
      //             height: 20,
      //             width: double.infinity,
      //             color: Colors.red,
      //             // child: BackdropFilter(
      //             //   filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      //             //   child: Container(
      //             //     height: 20,
      //             //     color: Colors.transparent,
      //             //     // width: double.infinity,
      //             //     // height: 20,
      //             //   ),
      //             // ),
      //           ),
      //         ),
      //       ],
      //     );
      //   }),
      // ),
    );
  }
}
