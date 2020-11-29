//: [Previous](@previous)

import Foundation


extension Array {
    mutating func bubbleSort(by areInIncreasingOrder: (Element, Element) -> Bool) {
        var isSorted = false
        
        while !isSorted {
            isSorted = true
            
            for j in indices.dropFirst() {
                let i = j - 1
                let element = self[i]
                let nextElement = self[j]
                if !areInIncreasingOrder(element, nextElement) {
                    swapAt(i, j)
                    isSorted = false
                }
            }
        }
    }
    
    func bubbleSorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        var array = self
        array.bubbleSort(by: areInIncreasingOrder)
        return array
    }
}

extension Array where Element: Comparable {
    mutating func bubbleSort() {
        bubbleSort(by: <)
    }
    
    func bubbleSorted() -> [Element] {
        bubbleSorted(by: <)
    }
}

import XCTest

final class BubbleSortTests: XCTestCase {
    
    func testSort_withDegreaseOperator_shouldReturnSortArray() {
        var array = [1, 2, 3, 4].shuffled()
        array.bubbleSort(by: <)
        
        XCTAssertEqual(array, [1, 2, 3, 4])
    }
    
    func testSort_withoutDegreaseOperator_shouldReturnSortArray() {
        var array = [1, 2, 3, 4].shuffled()
        array.bubbleSort()
        
        XCTAssertEqual(array, [1, 2, 3, 4])
    }
}


BubbleSortTests.defaultTestSuite.run()

//: [Next](@next)
