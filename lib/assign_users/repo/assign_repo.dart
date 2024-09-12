import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http/http.dart';
import 'package:necadmin/models/Class.dart';
import 'package:necadmin/utils.dart';

createclass({required String classname}) async {
  final createClass = Class(classname: classname);
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
  final request = ModelQueries.list(Class.classType);
  final responses = await Amplify.API.query(request: request).response;
  List res = graphqlresponsehandle(
      response: responses,
      function: () {
        List<Class?>? classes = responses.data?.items;
        if (classes != null) {
          List<Class> classeslist = [];
          for (int i = 0; i < classes.length; i++) {
            classeslist.add(classes[i]!);
          }
          safePrint(classeslist[0].classname);
          return classeslist;
        } else {
          safePrint('No classes found');
        }
      });
  return res;
}
