//
//  CombineClientUnitTests.swift
//  CombineClientTests
//
//  Created by Denis Kazarin on 25.02.2022.
//

import XCTest
import Combine
@testable import CombineClient

class CombineClientUnitTests: XCTestCase {

    var cancellables = Set<AnyCancellable>()
    
    let apiClient = APIClient()
    let inputedId = Just(1).eraseToAnyPublisher()
    var viewModel: ViewModel?
    
    
    override func setUp() {
        viewModel = ViewModel(apiClient: apiClient, inputIdPublisher: inputedId)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func tearDown() {
        cancellables = []
      //  viewModel = nil
    }
    
//    func testCollect() {
//        let values = [0, 1, 2]
//        let publisher = values.publisher
//        
//        publisher
//            .collect()
//            .sink(receiveValue: {
//                XCTAssert(
//                $0 == values,
//                "Result was expected to be \(values), but was \($0)"
//                )
//            })
//            .store(in: &cancellables)
//        
//    }
    
    func testCombineClient() {
        
        viewModel?.location
            .map { location in
                        location.description
                    }
            .catch { error in
                        Empty<String, Never>()
                    }
            .receive(on: RunLoop.main)
            .print("📲 DEBUG 1st FUNC TEST: ")
            .sink(receiveValue: { _ in })
            .store(in: &cancellables)
        
        
        viewModel?.character
            .map { location in
                        location.description
                    }
            .catch { error in
                        Empty<String, Never>()
                    }
            .receive(on: RunLoop.main)
            .print("📲 DEBUG 2nd FUNC TEST: ")
            .sink(receiveValue: { _ in })
            .store(in: &cancellables)
        
        viewModel?.episode
            .map { location in
                        location.description
                    }
            .catch { error in
                        Empty<String, Never>()
                    }
            .receive(on: RunLoop.main)
            .print("📲 DEBUG 3rd FUNC TEST: ")
            .sink(receiveValue: { _ in })
            .store(in: &cancellables)
    }

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
