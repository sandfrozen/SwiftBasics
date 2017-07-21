//: Playground - noun: a place where people can play

import Cocoa

var statusCode: Int = 404
var errorString: String

switch statusCode {
case 400:
    errorString = "Nieprawidlowe żądanie"
case 401:
    errorString = "Brak autoryzaji"
case 403:
    errorString = "Brak dostępu"
case 404:
    errorString = "Nie znaleziono"
default:
    errorString = "Inny błąd"
}


switch statusCode {
case 400, 401, 402, 403, 404:
    errorString = "Wystąpił błąd podczas wykonania żądania."
    fallthrough
default:
    errorString += " Spróbuj ponownie."
}

statusCode = 404
errorString = "Żądanie zakończyło się niepoowdzeniem z powodu: "


switch statusCode {
case 100, 101:
    errorString += "Informacyjny, \(statusCode)."
case 204:
    errorString += "Sukces, ale brak treści, \(statusCode)."
case 300...307:
    errorString += "Przekierowanie, \(statusCode)."
case 400...417:
    errorString += "Błąd po stronie kilenta, \(statusCode)."
case 500...505:
    errorString += "Błąd po stronie servera, \(statusCode)."
case let unknownCode:
    errorString += "Nieznany kod, \(statusCode)."
default:
    errorString += "Nieznany błąd. Proszę przeanalizować i spóbowac ponownie, kod błędu: \(statusCode)."
}

let error = (code: statusCode, message: errorString)
error.0
error.code
error.1
error.message

let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case (404, 404):
    print("Nie znaleziono elementów")
case (404, _):
    print("Nie znaleziono pierwszego elementu")
case (_, 404):
    print("Nie znaleziono drugiego elementu")
default:
    print("Znaleziono wszystkie elementy")
}
