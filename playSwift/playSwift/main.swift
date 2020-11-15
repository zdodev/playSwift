/// Automatic Reference Counting

/// How ARC Works

/// ARC in Action

class Human {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Human?
var reference2: Human?
var reference3: Human?

reference1 = Human(name: "ARC John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
print(reference3!.name)
reference3 = nil
// print: John Appleseed is being deinitialized

/// Strong Reference Cycles between Class Instances

class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Person \(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john?.apartment = unit4A
unit4A?.tenant = john

john = nil
unit4A = nil

//john?.apartment = unit4A

/// Resolving Strong Reference Cycles between Class Instances

/// Weak References

//class Apartment {
//    let unit: String
//    weak var tenant: Person?
//
//    init(unit: String) {
//        self.unit = unit
//    }
//
//    deinit {
//        print("Apartment \(unit) is being deinitialized")
//    }
//}

var grace: Person?
var weakUnit4A: Apartment?

grace = Person(name: "Grace Appleseed")
weakUnit4A = Apartment(unit: "4A")

grace?.apartment = weakUnit4A
weakUnit4A?.tenant = grace

func ee() {
    class ff {
        var gg: Int = 3
    }
    
    let a = ff()
    print(a.gg)
}

//grace = nil

/// Unowned References

/// Unowned Optional References

/// Unowned References and Implicitly Unwrapped Optional Properties

/// Strong Reference Cycles for Closures

/// Resolving Strong Reference Cycles for Closures

/// Defining a Capture List

/// Weak and Unowned References
