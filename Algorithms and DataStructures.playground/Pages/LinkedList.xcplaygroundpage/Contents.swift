import Foundation
import XCTest

final class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

final class LinkedList {
    
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
    
    // Get a node from a particular position.
    // Assume the first position is "1".
    // Return "nil" if position is not in the list.
    func getNode(atPosition position: Int) -> Node? {
        guard position > 0 else { return nil }
            
        var node: Node? = head
        var currentPosition = 1
        
        while node != nil {
            if currentPosition == position {
                return node
            }
            
            node = node?.next
            currentPosition += 1
        }
        
        return node
    }
    
    // Insert a new node at the given position.
    // Assume the first position is "1".
    // Inserting at position 3 means between
    // the 2nd and 3rd nodes.
    func insertNode(_ node: Node, at position: Int) {
        guard position > 0 else { return }
        
        if position == 1 {
            node.next = head
            head = node
        } else {
            let previousNode = getNode(atPosition: position - 1)
            node.next = previousNode?.next
            previousNode?.next = node
        }
    }
    
    // Delete the first node with a given value.
    func deleteNode(withValue value: Int) {
        if head?.value == value {
            head = head?.next
        } else {
            var previous = head
            var current = head?.next
            
            while current != nil {
                
                if current?.value == value {
                    previous?.next = current?.next
                    break
                }
                
                previous = current
                current = current?.next
            }
        }
    }
}

final class LinkedListTests: XCTestCase {
    
    var ll: LinkedList!
    let n4 = Node(value: 4)
    
    override func setUp() {
        super.setUp()

        let n1 = Node(value: 1)
        let n2 = Node(value: 2)
        let n3 = Node(value: 3)
        
        ll = LinkedList(head: n1)
        ll.append(n2)
        ll.append(n3)
    }
    
    func testAppend() {
        XCTAssertEqual(ll.head?.next?.next?.value, 3)
    }
    
    func testGetNode() {
        XCTAssertEqual(ll.getNode(atPosition: 3)?.value, 3)
        
    }
    
    func testInsertNode() {
        ll.insertNode(n4, at: 3)
        XCTAssertEqual(ll.getNode(atPosition: 3)?.value, 4)
    }
    
    func testDeleteNode() {
        ll.insertNode(n4, at: 3)
        ll.deleteNode(withValue: 1)
        
        XCTAssertEqual(ll.getNode(atPosition: 1)?.value, 2)
        XCTAssertEqual(ll.getNode(atPosition: 2)?.value, 4)
        XCTAssertEqual(ll.getNode(atPosition: 3)?.value, 3)
    }
}

LinkedListTests.defaultTestSuite.run()
