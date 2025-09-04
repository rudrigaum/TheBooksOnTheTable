//
//  BookSearchViewModelTests.swift
//  BookSearchViewModelTests
//
//  Created by Rodrigo Cerqueira Reis on 24/08/25.
//

import XCTest
@testable import TheBooksOnTheTable


class BookSearchViewModelTests: XCTestCase {
    
    var mockService: MockAPIService!
    var viewModel: BookSearchViewModel!
    
    override func setUp() {
        super.setUp()
        mockService = MockAPIService()
        viewModel = BookSearchViewModel(apiService: mockService)
    }
    
    override func tearDown() {
        mockService = nil
        viewModel = nil
        super.tearDown()
    }
    
    func test_searchBooks_succeeds_and_updates_books() {
        let expectation = self.expectation(description: "ViewModel should notify view about success")
        let testBooks = [Book(id: "1", volumeInfo: nil)]
        mockService.searchResult = .success(testBooks)
        
        viewModel.onBooksUpdated = {
            XCTAssertEqual(self.viewModel.books.count, testBooks.count, "The books array should be updated on success.")
            expectation.fulfill()
        }
        
        viewModel.searchBooks(query: "Swift")
        
        waitForExpectations(timeout: 1, handler: nil)
        
        XCTAssertEqual(mockService.receivedQuery, "Swift", "The ViewModel should have passed the correct query to the service.")
    }
    
    func test_searchBooks_fails_and_notifies_error() {
        let expectation = self.expectation(description: "ViewModel should notify view about error")
        mockService.searchResult = .failure(.noData)
        
        viewModel.onError = { errorMessage in
            XCTAssertNotNil(errorMessage, "The error message should not be nil on failure.")
            expectation.fulfill()
        }
        
        viewModel.searchBooks(query: "ErrorTest")
        
        waitForExpectations(timeout: 1, handler: nil)
    }

}
