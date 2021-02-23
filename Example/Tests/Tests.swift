import XCTest
import MobilliumDateFormatter

extension Date.Format {
    static let dateTime = Date.Format.custom(rawValue: "yyyy-MM-dd HH:mm:ss")
}

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStringToDate() {
        // Value
        let dateString = "2001-01-01 01:01:00"
        
        // Create a Date
        let date = Date.from(dateString, format: .dateTime)
        
        // Check
        XCTAssertNotNil(date)
    }
    
    func testDateToString() {
        // Value
        let date = Date()
        
        // Create a String
        let dateString = date.to(.MMMM)
        
        // Check
        XCTAssertNotNil(dateString)
    }
    
    func testTimeIntervalToString() {
        // Value
        let timeInterval = TimeInterval(exactly: 1549611277)!
        
        // Create a Date
        let date = Date.from(timeInterval)
        
        // Check
        XCTAssertNotNil(date)
    }
    
    func testDifference() {
        // Value
        let date = Date(timeIntervalSince1970: 1549611277) // 2019-02-08 07:34:37
        let date2 = Date(timeIntervalSince1970: 1581149677) //2020-02-08 08:14:37
        let minuteDifference = 40
        let yearDifference = 1
        let monthDifference = 0
        
        // Create Difference
        let diff = date.difference(date: date2)
        
        // Check
        XCTAssertEqual(yearDifference, diff.year)
        XCTAssertEqual(monthDifference, diff.month)
        XCTAssertEqual(minuteDifference, diff.minute)
    }
    
}
