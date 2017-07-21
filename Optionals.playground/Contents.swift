import Cocoa

var errorCode: String
errorCode = "404"
//print(errorCode)

var errorCodeString: String?
errorCodeString = "404"
//print(errorCodeString!)

var errorDescription: String?

if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404 {
    errorDescription = ("\(errorCodeInteger + 200): nie znaleziono żądanego zasobu.")
    
} else {
    print("odczytano nil")
}


var upCaseErrorDescription = errorDescription?.uppercased()
upCaseErrorDescription?.append(" PROSZĘ SPRÓBOWAĆ PONOWNIE.")
upCaseErrorDescription

errorDescription = nil
let description = errorDescription ?? "Brak błędu"