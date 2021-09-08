//
//  PhotoDetailViewControllerTests.swift
//  PhotosTests
//
//  Created by Casandra Grullon on 9/8/21.
//

import XCTest

@testable import Photos

class PhotoDetailViewControllerTests: XCTestCase {
    let photo = Photo(albumId: 1, id: 1, title: "", url: "", thumbnailUrl: "")

    func makeSUT() -> PhotoDetailViewController {
        let viewController = PhotoDetailViewController(photo)
        let sut = viewController
        sut.loadViewIfNeeded()
        return sut
    }
    
    func testViewDidLoad() {
        let sut = makeSUT()
        
        sut.viewDidLoad()
        
        XCTAssertTrue(sut.isViewLoaded)
    }
    
    func testUpdateUI() {
        let sut = makeSUT()
        let image = UIImage(contentsOfFile: photo.thumbnailUrl)
        
        XCTAssertEqual(sut.photoDetailView.imageView.image, image)
        XCTAssertEqual(sut.photoDetailView.titleLabel.text, photo.title)
    }
}
