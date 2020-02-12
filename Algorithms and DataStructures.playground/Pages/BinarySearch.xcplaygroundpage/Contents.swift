//: [Previous](@previous)

import Foundation
import XCTest

/// Correct way to implement Binary Search
/// See in https://zhu45.org/posts/2018/Jan/12/how-to-write-binary-search-correctly/#binary-search-variations
extension RandomAccessCollection where Index == Int, Element: Comparable {
    func binarySearch(value: Element) -> Index? {
        var lower = startIndex
        var higher = endIndex - 1
        
        while lower <= higher {
            let midle = lower + (higher - lower) / 2
            
            if value == self[midle] {
                return midle
            } else if value > self[midle] {
                lower = midle + 1
            } else {
                higher = midle - 1
            }
        }
        
        return nil
    }
}



final class BinarySearchTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testShouldFindNil() {
        let testArray = [1, 3, 9, 11, 15, 19, 29]

        let value = 25

        XCTAssertNil(testArray.binarySearch(value: value))
    }
    
    func testShouldFindCorrectIndex() {
        let testArray = [1, 3, 9, 11, 15, 19, 29]
        
        let value = 15
        
        XCTAssertEqual(testArray.binarySearch(value: value), 4)
    }
}


BinarySearchTests.defaultTestSuite.run()

//: [Next](@next)
