enum Skill { FLUTTER, DART, OTHER }

class Address {
  String? _street;
  String? _city;
  String? _zipcode;
  Address(this._city, this._street, this._zipcode);
  
  @override
  String toString() {
    return ("Address : Street $_street , City $_city ,Zipcode $_zipcode");
  }
}

class Employee {
  String? _name;
  List<Skill>? skill;
  double? _baseSalary = 40000;
  int? _yoe;
  int? bonus;

  Employee(this._name, this._baseSalary, this._yoe);

  double? get salary {
    return _baseSalary;
  }


  int? get yearofexperience {
    return _yoe;
  }

  List<Skill>? get skills {
    return skill;
  }

  Employee.mobiledeveloper(Skill skill) {
    this.skill = [skill]; 
  }


  void setYearOfExperience(int yoe) {
    this._yoe = yoe;
    this._baseSalary = _baseSalary! + (yoe * 2000);
  }


  void skillbonus(Skill skill) {
    if (skill == Skill.FLUTTER) {
      this._baseSalary = _baseSalary! + 5000;
    } else if (skill == Skill.DART) {
      this._baseSalary = _baseSalary! + 3000;
    } else {
      this._baseSalary = _baseSalary! + 1000;
    }
  }

  Employee operator +(Employee other) {
    var newSalary = this._baseSalary! + other._baseSalary!;
    var newYoe = this._yoe! + other._yoe!;
    return Employee(this._name, newSalary, newYoe);
  }

  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}, Years of Experience: $_yoe');
  }
}

void main() {
  Employee emp1 = Employee('Sokea', 40000, 3);
  emp1.skillbonus(Skill.FLUTTER);
  emp1.printDetails();

  Employee emp2 = Employee('Ronan', 45000, 4);
  emp2.skillbonus(Skill.DART);
  emp2.printDetails();

}
