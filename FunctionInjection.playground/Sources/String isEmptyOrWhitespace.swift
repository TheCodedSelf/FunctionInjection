import Foundation
import XCTest

extension String {
    public func isNonEmpty() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
    }
}

class StringIsEmptyOrWhitespaceTests: XCTestCase {
    
    func testNoCharactersReturnsTrue() {
        XCTAssertFalse("".isNonEmpty())
    }
    
    func testOnlyBlankSpacesReturnsTrue() {
        XCTAssertFalse("         ".isNonEmpty())
    }
    
    func testNewlineReturnsTrue() {
        XCTAssertFalse("  \n   ".isNonEmpty())
    }
    
    func testNonEmptyStringReturnsFalse() {
        XCTAssertTrue("Hello there".isNonEmpty())
    }
}
