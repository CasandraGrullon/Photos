//
//  APIClientTests.swift
//  Photos
//
//  Created by Casandra Grullon on 9/8/21.
//

import XCTest

@testable import Photos

class APIClientTests: XCTestCase {
    func testFetchPhotos() {
        let exp = XCTestExpectation(description: "Successfully retrieved data from network call")
        let expected = 1
        
        APIClient.fetchPhotos { (result) in
            exp.fulfill()
            switch result {
            case(.failure(let error)):
                XCTFail("error fetching data \(error.localizedDescription)")
            case(.success(let photos)):
                XCTAssertEqual(expected, photos.first?.id)
            }
        }
        wait(for:[exp], timeout: 5.0)
    }
}
