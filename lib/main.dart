import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/Components/Consts/blockObserver.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/Screens/notes_screen.dart';
import 'package:note_app/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:note_app/cubits/cubit/notes_cubit.dart';
import 'package:toast/toast.dart';

import 'Components/Consts/constants.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(noteBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    ToastContext().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNotesCubit(),
        ),
        BlocProvider(
          create: (context) => NotesCubit()..showNotes(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          brightness: Brightness.dark,
        ),
        home: NoteScreen(),
      ),
    );
  }
}
