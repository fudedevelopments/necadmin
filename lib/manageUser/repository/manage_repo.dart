import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:necadmin/model/staffmodel.dart';
import 'package:necadmin/model/students.dart';
import 'package:necadmin/utils.dart';

addusertoGroup({required String role, required String userId}) async {
  const graphQLDocument = '''
                 mutation MyMutation(\$groupName: String!, \$userId : String!) {
                 addUserToGroup(groupName:\$groupName , userId:\$userId)
               }
           ''';
  final echoRequest = GraphQLRequest<String>(
    document: graphQLDocument,
    variables: <String, String>{"groupName": role, "userId": userId},
  );
  final response = await Amplify.API.query(request: echoRequest).response;
  List res = graphqlresponsehandle(response: response, function: () {});
  return res;
}

createUser({
  required String name,
  required String email,
  required String password,
}) async {
  const graphQLDocument =
      '''mutation MyMutation(\$email:AWSEmail!, \$password :String!, \$username : String! ) {
             createUser(email: \$email, password: \$password, username: \$username)
           }
            ''';
  final echoRequest = GraphQLRequest<String>(
    document: graphQLDocument,
    variables: <String, String>{
      "email": email,
      "password": password,
      "username": name
    },
  );
  final response = await Amplify.API.query(request: echoRequest).response;
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  List res = graphqlresponsehandle(
      response: response,
      function: () {
        String userId = jsonMap["createUser"];
        return userId;
      });
  return res;
}

listUsersInGroup() async {
  const graphQLDocument = '''query MyQuery {
              students: listUsersInGroup(groupName: "STUDENTS")
              staff: listUsersInGroup(groupName: "STAFF")
              }''';
  final echoRequest = GraphQLRequest<String>(
    document: graphQLDocument,
  );
  final response = await Amplify.API.query(request: echoRequest).response;
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  var res = graphqlresponsehandle(
      response: response,
      function: () {
        String studens = jsonMap['students'];
        List<dynamic> studentslist = jsonDecode(studens);
        List<Studentsmodel> studentsmodels = [];
        for (int i = 0; i < studentslist.length; i++) {
          Map<String, String> resultMapstudens = {
            for (var item in studentslist[i]) item['Name']!: item['Value']!
          };
          safePrint(resultMapstudens);
          Studentsmodel model = Studentsmodel.fromMap(resultMapstudens);
          studentsmodels.add(model);
        }
        //staff decode
        String staff = jsonMap['staff'];
        List<dynamic> stafflist = jsonDecode(staff);
        List<StaffModel> staffmodels = [];
        for (int i = 0; i < stafflist.length; i++) {
          Map<String, String> resultMapstaff = {
            for (var item in stafflist[i]) item['Name']!: item['Value']!
          };
          StaffModel model = StaffModel.fromMap(resultMapstaff);
          staffmodels.add(model);
        }
        return [studentsmodels, staffmodels];
      });
  return res;
}
