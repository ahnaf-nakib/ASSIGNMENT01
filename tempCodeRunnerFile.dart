abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;
  Role? role;

  Person(this.name, this.age, this.address, this.role);

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;

  @override
  void displayRole() {
    role?.displayRole();
  }
}

class Student extends Person {
  int studentID;
  String grade;
  List<int> courseScores = [];

  Student(String name, int age, String address, Role? role, this.studentID,
      this.grade)
      : super(name, age, address, role);

  @override
  void displayRole() {
    print("Role: Student");
  }

  void addCourseScore(int score) {
    courseScores.add(score);
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0.0;
    }
    double sum = courseScores.reduce((a, b) => a + b).toDouble();
    return sum / courseScores.length;
  }
}

class Teacher extends Person {
  int teacherID;
  List<String> coursesTaught = [];

  Teacher(String name, int age, String address, Role? role, this.teacherID)
      : super(name, age, address, role);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void addCourseTaught(String course) {
    coursesTaught.add(course);
  }

  void displayCoursesTaught() {
    print("Courses Taught:");
    for (String course in coursesTaught) {
      print("- $course");
    }
  }
}

class StudentManagementSystem {
  static void main() {
    Role studentRole =
        Student("John Doe", 20, "123 Main St", null, 123, "Sophomore");
    Student student = studentRole as Student;
    student.role = student;

    Role teacherRole = Teacher("Mrs. Smith", 35, "456 Oak St", null, 456);
    Teacher teacher = teacherRole as Teacher;
    teacher.role = teacher;

    student.addCourseScore(90);
    student.addCourseScore(85);
    student.addCourseScore(82);

    teacher.addCourseTaught("Math");
    teacher.addCourseTaught("English");
    teacher.addCourseTaught("Bangla");

    print("Student Information:");
    student.displayRole();
    print("Name: ${student.getName()}");
    print("Age: ${student.getAge()}");
    print("Address: ${student.getAddress()}");
    print("Average Score: ${student.calculateAverageScore()}\n");

    print("Teacher Information:");
    teacher.displayRole();
    print("Name: ${teacher.getName()}");
    print("Age: ${teacher.getAge()}");
    print("Address: ${teacher.getAddress()}");
    teacher.displayCoursesTaught();
  }
}

void main() {
  StudentManagementSystem.main();
}
