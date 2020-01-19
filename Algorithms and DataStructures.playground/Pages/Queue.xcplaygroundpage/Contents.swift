//: [Previous](@previous)

import Foundation
import XCTest

class Queue {
    
    var storage: [Int]
    
    init(head: Int) {
        storage = [head]
    }
    
    // add the element to the queue
    func enqueue(_ element: Int) {
        storage.append(element)
    }
    
    // return the next element to be dequeued from the queue
    // if the queue is empty, return nil
    func peek() -> Int? {
        return storage.first
    }
    
    // remove and return the next element to be dequeued
    func dequeue() -> Int? {
        guard !storage.isEmpty else { return nil }
        
        return storage.removeFirst()
    }
}

final class QueueTests: XCTestCase {
    
    var q: Queue!
    
    override func setUp() {
        super.setUp()
        
        q = Queue(head: 1)
        q.enqueue(2)
        q.enqueue(3)
    }
    
    func testPeek() {
        XCTAssertEqual(q.peek(), 1)
    }
    
    func testDequeue() {
        XCTAssertEqual(q.dequeue(), 1)
    }
    
    func testEnqueue() {
        XCTAssertEqual(q.dequeue(), 1)
        
        q.enqueue(4)
        XCTAssertEqual(q.dequeue(), 2) // Should be 2
        XCTAssertEqual(q.dequeue(), 3) // Should be 3
        XCTAssertEqual(q.dequeue(), 4) // Should be 4
        
        q.enqueue(5)
        XCTAssertEqual(q.peek(), 5)
    }
}


QueueTests.defaultTestSuite.run()

//: [Next](@next)
