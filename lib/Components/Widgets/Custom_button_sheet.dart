import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Components/Widgets/Custom_button.dart';
import 'package:note_app/Components/Widgets/Custom_text_filed.dart';
import 'package:note_app/Components/Widgets/colorListViwe.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:note_app/cubits/cubit/notes_cubit.dart';

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNotesCubit, AddNotesStates>(
      listener: (context, state) {
        if (state is AddNotesSuccessState) {
          Navigator.pop(context);
          NotesCubit.get(context).showNotes();
        }
        if (state is AddNotesErrorState) {}
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNotesLoadingState ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: const addNoteForm(),
            ),
          ),
        );
      },
    );
  }
}

class addNoteForm extends StatefulWidget {
  const addNoteForm({super.key});

  @override
  State<addNoteForm> createState() => _addNoteFormState();
}

class _addNoteFormState extends State<addNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController? titleControler,
      subTitleControler = TextEditingController();

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
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
          const ColorListViwe(),
          const SizedBox(
            height: 25,
          ),
          BlocBuilder<AddNotesCubit, AddNotesStates>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNotesLoadingState ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    // var cuttentDate = DateTime.now();
                    // var formatedCurrentDate = DateFormat.yMEd().format(cuttentDate);

                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formatDate(
                            DateTime.now(), [dd, '/', mm, '/', yyyy]),
                        color: Colors.blue.value);
                    AddNotesCubit.get(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

