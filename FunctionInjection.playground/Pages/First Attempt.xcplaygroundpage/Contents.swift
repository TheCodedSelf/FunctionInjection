import Foundation
import XCTest

struct Greeter {
    
    func greet(name: String) throws -> String {
        guard name.isNonEmpty() else { throw GreetingError.invalidName }
        return "Welcome, \(name)! Have you seen the specials on offer?"
    }

}

enum GreetingError: Error {
    case invalidName
}

class GreeterTests: XCTestCase {
    
    func testGreetingWithValidNameReturnsGreetingString() {
        let expected = "Welcome, Caroline! Have you seen the specials on offer?"
        let actual = try? Greeter().greet(name: "Caroline")
        XCTAssertEqual(expected, actual)
    }
    
    func testGreetingWithEmptyNameThrowsInvalidNameError() {
        verifyGreetingErrorIsThrown(whenGiven: "")
    }
    
    func testGreetingWithBlankSpaceNameThrowsInvalidNameError() {
        verifyGreetingErrorIsThrown(whenGiven: "   ")
    }
    
    func testGreetingWithNewlineCharacterNameThrowsInvalidNameError() {
        verifyGreetingErrorIsThrown(whenGiven: "  \n ")
    }
    
    func verifyGreetingErrorIsThrown(whenGiven name: String) {
        do {
            try Greeter().greet(name: name)
            XCTFail("An error should have been thrown")
        } catch GreetingError.invalidName {
            return
        } catch {
            XCTFail("Incorrect error type was thrown")
        }
    }
}

GreeterTests.defaultTestSuite.run()

