class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  log1() {
    console.log(this.name + " " + this.age + " yasinda");
  }

  log2() {
    return this.name + " " + this.age + " yasinda";
  }

  konus(message) {
    console.log(this.name + " " + message + " dedi");
  }
}

class Employee extends Person {
  constructor(name, age, salary) {
    super(name, age);
    this.salary = salary;
  }

  maasHesapla() {
    console.log(this.salary);
  }
}

class Sekil {
  constructor(kenar1, kenar2) {
    this.kenar1 = kenar1;
    this.kenar2 = kenar2;
  }

  alanHesapla();
}

class Dortgen extends Sekil {
  constructor(kenar1, kenar2) {
    super(kenar1,kenar2)
  }

  alanHesapla() {
    console.log(this.kenar1 * this.kenar2);
    return this.kenar1 * this.kenar2
  }
}

class Daire extends Sekil {}

const person = new Person();

const person1 = new Person();
person1.name = "Mustafa";
person1.age = 18;

const person2 = new Person("Celil", 20);
const employee1 = new Employee("Bulent", 21, 30000);

console.log(person1.log2());
console.log(person2.age);
person2.log1();
person2.konus("sizi cok seviyorum");

employee1.log1();
employee1.maasHesapla();
person1.maasHesapla();
