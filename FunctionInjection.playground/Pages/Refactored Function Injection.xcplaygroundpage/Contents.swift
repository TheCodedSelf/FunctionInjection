import Foundation
import XCTest

struct Greeter {
    
    func greet(name: String,
               isNonEmpty: (String) -> Bool = { $0.isNonEmpty() == false })
        throws -> String {
            
            guard isNonEmpty(name) else { throw GreetingError.invalidName }
            return "Welcome, \(name)! Have you seen the specials on offer?"
    }
    
}

enum GreetingError: Error {
    case invalidName
}

class GreeterTests: XCTestCase {
    
    func testGreetingReturnsGreetingStringWhenNotEmpty() {
        let expected = "Welcome, Caroline! Have you seen the specials on offer?"
        let actual = try? Greeter().greet(name: "Caroline", isNonEmpty: { _ in true })
        XCTAssertEqual(expected, actual)
    }
    
    func testGreetingThrowsInvalidNameErrorWhenEmpty() {
        
        do {
            try Greeter().greet(name: "asdf", isNonEmpty: { _ in false })
            XCTFail("An error should have been thrown")
        } catch GreetingError.invalidName {
            return
        } catch {
            XCTFail("Incorrect error type was thrown")
        }
    }
    
}

GreeterTests.defaultTestSuite.run()
