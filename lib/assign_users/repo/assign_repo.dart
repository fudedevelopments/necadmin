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

addUserToClassroom({
  required ClassRoom classRoom,
  required String role,
  required List user,
}) async {
  List<bool> result = [];

  if (role == "HOD") {
    for (int i = 0; i < user.length; i++) {
      final hod =
          Hod(hodname: user[i].sub, email: user[i].email, classRoom: classRoom);
      final hodrequest = ModelMutations.create(hod);
      final hodResponse =
          await Amplify.API.mutate(request: hodrequest).response;
      if (hodResponse.hasErrors) {
        result.add(false);
      } else {
        result.add(true);
      }
    }
  }

  if (role == "ACADEMIC COORDINATOR") {
    for (int i = 0; i < user.length; i++) {
      final ac =
          Ac(acname: user[i].sub, email: user[i].email, classRoom: classRoom);
      final acrequest = ModelMutations.create(ac);
      final acResponse = await Amplify.API.mutate(request: acrequest).response;
      if (acResponse.hasErrors) {
        result.add(false);
      } else {
        result.add(true);
      }
    }
  }

  if (role == "PROCTOR") {
    for (int i = 0; i < user.length; i++) {
      final proctor = Proctor(
          proctorname: user[i].sub, email: user[i].email, classRoom: classRoom);
      final proctorrequest = ModelMutations.create(proctor);
      final proctorResponse =
          await Amplify.API.mutate(request: proctorrequest).response;
      if (proctorResponse.hasErrors) {
        result.add(false);
      } else {
        result.add(true);
      }
    }
  }

  if (role == "STUDENTS") {
    for (int i = 0; i < user.length; i++) {
      final student = Student(
          studentname: user[i].sub, email: user[i].email, classRoom: classRoom);
      final studentrequest = ModelMutations.create(student);
      final studentResponse =
          await Amplify.API.mutate(request: studentrequest).response;
      safePrint(studentResponse);
      if (studentResponse.hasErrors) {
        result.add(false);
      } else {
        result.add(true);
      }
    }
  }
  return result;
}

getAllClassroomUsersFunction({required String classroomid}) async {
  final hod = ModelQueries.list<Hod>(Hod.classType,
      where: Hod.CLASSROOM.eq(classroomid));
  final ac =
      ModelQueries.list<Ac>(Ac.classType, where: Ac.CLASSROOM.eq(classroomid));
  final proctor = ModelQueries.list<Proctor>(Proctor.classType,
      where: Proctor.CLASSROOM.eq(classroomid));
  final student = ModelQueries.list<Student>(Student.classType,
      where: Student.CLASSROOM.eq(classroomid));
  final hodresponse = await Amplify.API.query(request: hod).response;
  final acresponse = await Amplify.API.query(request: ac).response;
  final proctorresponse = await Amplify.API.query(request: proctor).response;
  final studentresponse = await Amplify.API.query(request: student).response;

  if (hodresponse.hasErrors ||
      acresponse.hasErrors ||
      proctorresponse.hasErrors ||
      studentresponse.hasErrors) {
    return [500, null, null, null, null];
  } else {
    // HOD List
    final List<Hod?>? hods = hodresponse.data?.items;
    List<Hod> hodsList = [];
    if (hods != null) {
      for (int i = 0; i < hods.length; i++) {
        hodsList.add(hods[i]!);
      }
    }
    // AC List
    final List<Ac?>? acs = acresponse.data?.items;
    List<Ac> acsList = [];
    if (acs != null) {
      for (int i = 0; i < acs.length; i++) {
        acsList.add(acs[i]!);
      }
    }
    // Proctor List
    final List<Proctor?>? proctors = proctorresponse.data?.items;
    List<Proctor> proctorsList = [];
    if (proctors != null) {
      for (int i = 0; i < proctors.length; i++) {
        proctorsList.add(proctors[i]!);
      }
    }
    // Student List
    final List<Student?>? students = studentresponse.data?.items;
    List<Student> studentsList = [];
    if (students != null) {
      for (int i = 0; i < students.length; i++) {
        studentsList.add(students[i]!);
      }
    }
    return [200, hodsList, acsList, proctorsList, studentsList];
  }
}

deleteClassRoomUserFunction(
    {required String role, required String userid}) async {
  dynamic deleteRequest;

  switch (role) {
    case 'STUDENTS':
      deleteRequest = ModelMutations.deleteById(
          Student.classType, StudentModelIdentifier(id: userid));
      break;
    case 'HOD':
      deleteRequest = ModelMutations.deleteById(
          Hod.classType, HodModelIdentifier(id: userid));
      break;
    case 'ACADEMIC COORDINATOR':
      deleteRequest = ModelMutations.deleteById(
          Ac.classType, AcModelIdentifier(id: userid));
      break;
    case 'PROCTOR':
      deleteRequest = ModelMutations.deleteById(
          Proctor.classType, ProctorModelIdentifier(id: userid));
      break;
    default:
      throw Exception('Invalid role');
  }

  final response = await Amplify.API.mutate(request: deleteRequest).response;

  if (response.errors.isNotEmpty) {
    throw Exception('Error deleting user: ${response.errors.first.message}');
  }
  List res = graphqlresponsehandle(response: response, function: () {});

  return res;
}

deleteClassRoom({required ClassRoom classroom}) async {
  final deleteClassRoom = ModelMutations.delete(classroom);
  final response = await Amplify.API.mutate(request: deleteClassRoom).response;
  List res = graphqlresponsehandle(response: response, function: () {});
  return res;
}

addStudentundertheproctorfunction(
    {required List<Student> students, required Proctor proctor}) async {
  List<bool> result = [];
  for (int i = 0; i < students.length; i++) {
    final proctoraddstudents = students[i].copyWith(proctor: proctor);
    final request = ModelMutations.update(proctoraddstudents);
    final response = await Amplify.API.mutate(request: request).response;
    if (response.hasErrors) {
      result.add(false);
    } else {
      result.add(true);
    }
  }
  return result;
}

getallStudentsByProctor({required Proctor proctor}) async {
  final request = ModelQueries.list<Student>(Student.classType,
      where: Student.PROCTOR.eq(proctor.id));
  final response = await Amplify.API.query(request: request).response;
  List<Student?>? students = response.data?.items;
  List res = graphqlresponsehandle(
    emptyListresponse: students,
      response: response,
      function: () {
        List<Student> studentsList = [];
        if (students != null) {
          for (int i = 0; i < students.length; i++) {
            studentsList.add(students[i]!);
          }
        }
        return studentsList;
      });
  return res;
}
