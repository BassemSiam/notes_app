import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/Components/Consts/constants.dart';
import 'package:note_app/Components/Widgets/Custom_text_filed.dart';
import 'package:note_app/cubits/add_note_cubit/add_notes_cubit.dart';

import 'Custom_Notes_items.dart';

class NoteViweBody extends StatelessWidget {
  const NoteViweBody({super.key});
  final data = const [Colors.amber];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(
                  height: 8,
                ),
                itemBuilder: (context, index) {
                  return NoteItem();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 28),
        ),
        const Spacer(),
        Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.07),
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  size: 30,
                ))),
      ],
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController? titleControler,
      subTitleControler = TextEditingController();

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNotesCubit, AddNotesStates>(
      listener: (context, state) {
        if (state is AddNotesSuccessState) {
          Navigator.pop(context);
        }
        if (state is AddNotesErrorState) {
          print('filled : ${state.error}');
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ModalProgressHUD(
            inAsyncCall: state is AddNotesLoadingState ? true : false,
            child: ListView(
              children: [
                Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      CustomTextFiled(
                        controler: titleControler,
                        onSaved: (value) {
                          title = value;
                        },
                        hintText: 'Title',
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      CustomTextFiled(
                        controler: subTitleControler,
                        onSaved: (value) {
                          subTitle = value;
                        },
                        hintText: 'Content',
                        maxLine: 5,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            //setState(() {});
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context)
            .size
            .width, // >> same like the double.infinty but has diffrent errors,
        height: 50,
        decoration: BoxDecoration(),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(primaryColor),
              shape: MaterialStatePropertyAll(
                ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(55),
                ),
              ),
            ),
            onPressed: onTap,
            child: Text(
              'Add',
              style: TextStyle(fontSize: 22, color: Colors.black),
            )));
  }
}
