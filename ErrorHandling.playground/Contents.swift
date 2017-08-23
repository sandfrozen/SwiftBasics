//: Playground - noun: a place where people can play

import UIKit

enum Token {
    case Number(Int)
    case Plus
    case Minus
}

class Lexer {
    enum theError: Error {
        case NieprawidłowyZnak(Character)
    }
    
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "Nie można wykroczyć poza dane wejściowe!")
        // If I want assertion in release mode:
        //precondition(position < input.endIndex, "Nie można wykroczyć poza dane wejściowe!")
        position = input.index(after: position)
    }
    
    func getNumber() -> Int {
        var value = 0
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                let digitalValue = Int(String(nextCharacter))!
                value = 10*value + digitalValue
                advance()
            default:
                return value
            }
        }
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                let value = getNumber()
                tokens.append(.Number(value))
            case "+":
                tokens.append(.Plus)
                advance()
            case "-":
                tokens.append(.Minus)
                advance()
            case " ":
                advance()
            default:
                throw theError.NieprawidłowyZnak(nextCharacter)
            }
        }
        return tokens
    }
}

class Parser {
    enum theError: Error {
        case NieoczekiwanyKoniecDanychWejsciowych
        case NieprawidłowyToken(Token)
    }

    
    let tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        let token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw theError.NieoczekiwanyKoniecDanychWejsciowych
        }
        
        switch token {
        case .Number(let value):
            return value
        case .Plus,
             .Minus:
            throw theError.NieprawidłowyToken(token)
        }
    }
    
    func parse() throws -> Int {
        // First is number
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
                // Plus after Number
            case .Plus:
                let nextNumber = try getNumber()
                value += nextNumber
            case .Minus:
                let nextNumber = try getNumber()
                value -= nextNumber
            case .Number:
                print(token)
                throw theError.NieprawidłowyToken(token)
            }
        }
        return value
    }
}

func evaluate(input: String) {
    print("Obliczanie: \(input)")
    let lexer = Lexer(input: input)
    do {
        let tokens = try lexer.lex()
        //print("Dane wejściowe analizatora leksykalnego: \(tokens).")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Dane wyjsciowe analizatora składni: \(result).")
    } catch Lexer.theError.NieprawidłowyZnak(let character) {
        print("Dane wejściowe zawierają nieprawidłowy znak: \(character)")
    } catch Parser.theError.NieoczekiwanyKoniecDanychWejsciowych {
        print("Nieoczekiwany koniec danych wejsciowych podczas przetwarzania.")
    } catch Parser.theError.NieprawidłowyToken(let token) {
        print("Nieprawidłowy token podczas przetwarzania: \(token)")
    } catch {
        print("Wystąpił błąd: \(error).")
    }
}

evaluate(input: "10 + 4 3 - 14")