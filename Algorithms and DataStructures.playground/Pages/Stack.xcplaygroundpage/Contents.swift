//: [Previous](@previous)

import Foundation
import XCTest

class Node {
    
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class LinkedList {
    
    var head: Node?
    
    init(head: Node?) {
        self.head = head
    }
    
    func append(_ node: Node) {
        
        guard head != nil else {
            head = node
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        current?.next = node
    }
    
    func getNode(atPosition position: Int) -> Node? {
        guard position > 0 else {
            return nil
        }
        
        var counter = 1
        var current = head
        
        while current != nil && counter <= position {
            if counter == position {
                return current
            }
            current = current?.next
            counter += 1
        }
        return nil
    }
    
    func insertNode(_ node: Node, at position: Int) {
        guard position > 0 else {
            return
        }
        
        var counter = 1
        var current = head
        
        if position > 1 {
            while current != nil && counter < position {
                if counter == position - 1 {
                    node.next = current?.next
                    current?.next = node
                }
                current = current?.next
                counter += 1
            }
        } else if position == 1 {
            node.next = head
            head = node
        }
    }
    
    func deleteNode(withValue value: Int) {
        var current = head
        var previous: Node?
        
        while current?.value != value && current?.next != nil {
            previous = current
            current = current?.next
        }
        
        if current?.value == value {
            if previous != nil {
                previous?.next = current?.next
            } else {
                head = current?.next
            }
        }
    }
}

class Stack {
    
    var ll: LinkedList
    
    init(top: Node?) {
        self.ll = LinkedList(head: top)
    }
    
    // add a node to the top of the stack
    func push(_ node: Node) {
        ll.insertNode(node, at: 1)
    }
    
    // remove and return the topmost node from the stack
    func pop() -> Node? {
        guard let node = ll.getNode(atPosition: 1) else { return nil }
        
        ll.deleteNode(withValue: node.value)
        
        return node
    }
}

final class StackTests: XCTestCase {
    let n2 = Node(value: 2)
    let n3 = Node(value: 3)
    let n4 = Node(value: 4)
    
    var stack: Stack!
    
    override func setUp() {
        super.setUp()
        
        let n1 = Node(value: 1)

        // Start setting up a Stack
        stack = Stack(top: n1)
    }
    
    func testPush() {
        stack.push(n2)
        stack.push(n3)
        
        
        XCTAssertEqual(stack.pop()?.value, 3) // Should be 3
        XCTAssertEqual(stack.pop()?.value, 2) // Should be 2
        XCTAssertEqual(stack.pop()?.value, 1) // Should be 1
        XCTAssertNil(stack.pop()?.value)      // Should be nil
        
        stack.push(n4)
        
        XCTAssertEqual(stack.pop()?.value, 4) // Should be 4
    }
}


StackTests.defaultTestSuite.run()


//: [Next](@next)
