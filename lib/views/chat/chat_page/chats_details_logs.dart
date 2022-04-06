import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:chat/controllers/chat_controller/chat_message_controller.dart';
import 'package:chat/models/messages_model.dart';
import 'package:chat/services/firebase_services_collection/firebase_collection_stream.dart';
import 'package:chat/widget/app_bar/appbar.dart';
import 'package:chat/widget/chat_card/chat_card.dart';
import 'package:chat/widget/text/text_with_style.dart';
import 'package:chat/widget/textfields/textfield_chats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class ChatpageLogs extends StatelessWidget {
  const ChatpageLogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatMessageController>(
      init: ChatMessageController(),
      builder: (controller) => Scaffold(
        backgroundColor: decentWhite,
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: AppbarForall(
                namelabel: controller.nameuser.value,
                viewProfile: () {},
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: colorlessOther!,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: FooterLayout(
                  child: SizedBox(
                    child: controller.message.isEmpty
                        ? SizedBox(
                            child: Center(
                              child: TextWithStyle(
                                label: "Loading....",
                                textColor: black,
                                textSize: 11.sp,
                                fontFamiliy: metroRegular,
                              ),
                            ),
                          )
                        : SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child:
                                  GroupedListView<MessageViewModel, DateTime>(
                                shrinkWrap: true,
                                controller: controller.scroll,
                                elements: controller.message,
                                groupBy: (e) {
                                  var par = DateFormat("dd MMM yyyy hh:mm:ss a")
                                      .parse(e.dateTime!);
                                  return DateTime(par.year, par.month, par.day);
                                },
                                groupSeparatorBuilder: (e) => SizedBox(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              color: decentWhite,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: TextWithStyle(
                                                  label:
                                                      DateFormat("MMMM yy dd")
                                                          .format(e),
                                                  textColor: black,
                                                  textSize: 11.sp,
                                                  fontFamiliy: metroRegular,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                itemComparator: (e1, e2) =>
                                    DateFormat("dd MMM yyyy hh:mm:ss a")
                                        .parse(e1.dateTime!)
                                        .compareTo(
                                          DateFormat("dd MMM yyyy hh:mm:ss a")
                                              .parse(e2.dateTime!),
                                        ),
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ChatCard(
                                        images: [],
                                        message: index.message,
                                        uid: Firebaseconstant
                                            .firebaseAuth.currentUser!.uid
                                            .toString(),
                                        from: index.from,
                                        data: index.dateTime,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                  footer: SizedBox(
                    // height: 20.h,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: TextFieldForChatuse(
                                  inputType: TextInputType.multiline,
                                  controller: controller.chattext,
                                  capitalization: TextCapitalization.sentences,
                                  onchanged: (s) {},
                                  onsave: (s) {},
                                  validator: (s) {},
                                  hintText: "Message",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            GestureDetector(
                              onTap: () {},
                              behavior: HitTestBehavior.deferToChild,
                              child: Container(
                                height: 12.h,
                                width: 12.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: decentWhite,
                                ),
                                child: LineIcon(
                                  LineIcons.horizontalEllipsis,
                                  size: 5.h,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                controller.sendMessage();
                              },
                              behavior: HitTestBehavior.deferToChild,
                              child: Container(
                                height: 12.h,
                                width: 12.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: darkishColor!.withOpacity(0.3),
                                ),
                                child: LineIcon(
                                  LineIcons.paperPlane,
                                  size: 4.h,
                                  color: decentWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
