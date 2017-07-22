import Cocoa

func printPersonGreeting(name: String) {
    print("\(name), witaj w pliku typu playground!")
}

printPersonGreeting(name: "Tomek")

func divisionDescription(num: Double, den: Double) {
    print("\(num) dzielone przez \(den) wynosi \(num / den)")
}

divisionDescription(num: 9.0, den: 2.0)


// NAZWY PARAMETRÓW
func divisionDescriptio2(forNumerator num: Double, andDenominator den: Double) {
    print("\(num) dzielone przez \(den) wynosi \(num / den)")
}

divisionDescriptio2(forNumerator: 9.0, andDenominator: 2.0)


// PARAMETRY WARIADYCZNE - nieokreślona tablica
func printPersonalGreetings(names: String...) {
    for name in names {
        print("Witaj, \(name)")
    }
}

printPersonalGreetings(names: "Tomek","Szymon","Daniel","Adam")


// WARTOŚCI DOMYSLNE
func divisionDescription3(forNumerator num: Double, andDenominator den: Double, withPunctuation punctuation: String = ".") {
    print("\(num) dzielone przez \(den) wynosi \(num / den)\(punctuation)")
}

divisionDescription3(forNumerator: 4.0, andDenominator: 2.0)
divisionDescription3(forNumerator: 3.0, andDenominator: 2.0, withPunctuation: "?")


// IN-OUT
var error = "Żądanie zakończyło się niepowidzeniem:"
func appendErrorCode(code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " nieprawidłowe żądanie."
    }
}

appendErrorCode(code: 400, toErrorString: &error)


// RETURN
func divisionDescription4(forNumerator num: Double, andDenominator den: Double, withPunctuation punctuation: String = ".") -> String {
    return "\(num) dzielone przez \(den) wynosi \(num / den)\(punctuation)"
}

print(divisionDescription4(forNumerator: 5.0, andDenominator: 2.5, withPunctuation: "!"))


// ZWROT WIELU WARTOŚCI
func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evenz = [Int]()
    var oddz = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evenz.append(number)
        } else {
            oddz.append(number)
        }
    }
    return (evenz, oddz)
}

let aBunchOfNumbers = [10,1,4,3,57,43,84,27,156,111]
let theSortedNumbers = sortEvenOdd(numbers: aBunchOfNumbers)
print("Liczby parzyste: \(theSortedNumbers.evens); liczby nieparzyste: \(theSortedNumbers.odds)")

func giveSomeValues() -> (a: [Int], b: [Int], c: [Int], d: [Int]){
    var a = [Int]()
    a.append(1)
    
    return (a, a, a, a)
}


// Wartość zwrotna typu Optional

func grabMiddleName(name: (String, String?, String)) -> String? {
    return name.1
}

if let theName = grabMiddleName(name: ("Tomek", nil, "Buslowski")) {
    print(theName)
}

// guard
func grabByMiddleName(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle else {
        print("Witaj!")
        return
    }
    print("\(middleName), witaj!")
}
grabByMiddleName(name: (first: "Tomek", middle: "Frozen", last: "Busłowski"))


// Przypisanie Funkcji
//let evenOddFunction = sortEvenOdd
let evelOddFunction: ([Int]) -> ([Int], [Int]) = sortEvenOdd
