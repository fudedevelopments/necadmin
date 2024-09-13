import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:necadmin/models/ModelProvider.dart';
import 'package:necadmin/utils.dart';

createclass({required String classname}) async {
  final createClass = ClassRoom(classRoomname: classname);
  final classreq = ModelMutations.create(createClass);
  final response = await Amplify.API.mutate(request: classreq).response;
  List res = graphqlresponsehandle(
      response: response,
      function: () {
        return null;
      });
  return res;
}

getAllClasses() async {
  final request = ModelQueries.list(ClassRoom.classType);
  final responses = await Amplify.API.query(request: request).response;
  List<ClassRoom?>? classroom = responses.data?.items;
  List res = graphqlresponsehandle(
      response: responses,
      emptyListresponse: classroom,
      function: () {
        if (classroom != null) {
          List<ClassRoom> classroomlist = [];
          for (int i = 0; i < classroom.length; i++) {
            classroomlist.add(classroom[i]!);
          }
          return classroomlist;
        } else {
          safePrint('No classes found');
        }
      });
  return res;
 }
