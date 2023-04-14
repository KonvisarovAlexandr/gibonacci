//
//  FibonacciTests.swift
//  FibonacciTests
//
//  Created by Alexandr on 14.04.2023.
//

import XCTest
@testable import Fibonacci

final class FibonacciTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssertEqual(generateFibonacciSequence(length: 0), [])

        // Test case 2: length 1
        XCTAssertEqual(generateFibonacciSequence(length: 1), [0])

        // Test case 3: length 2
        XCTAssertEqual(generateFibonacciSequence(length: 2), [0, 1])

        // Test case 4: length 10
        XCTAssertEqual(generateFibonacciSequence(length: 10), [0, 1, 1, 2, 3, 5, 8, 13, 21, 34])

        // Test case 5: length 100
        let expectedSequence: [UInt64] = [
        0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89
        ]
        XCTAssertEqual(generateFibonacciSequence(length: 12), expectedSequence)

        XCTAssertEqual(generateFibonacciSequence(length: 1998).last, 12200160415121876738)
    }

    func generateFibonacciSequence(length: Int) -> [UInt64] {
        var sequence: [UInt64] = [0, 1]
        if length == 0 {
            return []
        } else if length == 1 {
            return [0]
        } else if length == 2 {
            return sequence
        }
        for i in 2..<length {
            let value = sequence[i-1].addingReportingOverflow(sequence[i-2])
            if !value.overflow {
                sequence.append(sequence[i-1] + sequence[i-2])
            } else {
                return sequence
            }
        }
        return sequence
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
