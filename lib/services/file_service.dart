import 'dart:io';
import 'package:note_app/models/note_model.dart';

class FileService {
  Directory directory = Directory(Directory.current.path + "\\assets\\files");

  Future<void> init() async {
    bool isDirectoryCreated = await directory.exists();
    if(!isDirectoryCreated) {
      await directory.create();
    }
  }

  Future<String> createFile(Note note) async {
    File file = File(directory.path + "\\${note.title}.note");
    bool isFileCreated = await file.exists();
    if(isFileCreated) {
      /// this below code will be edited when I set language service
      throw Exception("This file already created please try create new file");
    }
    await file.create();
    await file.writeAsString("${note.title}\n${note.content}");
    await file.setLastModified(DateTime.parse(note.time));
    return file.path;
  }
}