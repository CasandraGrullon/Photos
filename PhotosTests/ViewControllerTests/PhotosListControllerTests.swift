//
//  PhotosListControllerTests.swift
//  PhotosTests
//
//  Created by Casandra Grullon on 9/8/21.
//

import XCTest

@testable import Photos

class PhotosListViewControllerTests: XCTestCase {
    func makeSUT() -> PhotosListViewController {
        let viewController = PhotosListViewController()
        let sut = viewController
        sut.loadViewIfNeeded()
        return sut
    }
    
    func testViewDidLoad() {
        let sut = makeSUT()
        
        sut.viewDidLoad()
        
        XCTAssertTrue(sut.isViewLoaded)
        XCTAssertNotNil(sut.photosListView.collectionView.dataSource)
    }
    
    func testCollectionViewCellsIsDisplayedWithMatchingImage() {
        let sut = makeSUT()
        
        let data: [Photo] = [Photo(albumId: 1, id: 1, title: "", url: "", thumbnailUrl: "")]
        sut.photos = data
        
        sut.photosListView.collectionView.reloadData()
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.5))
        
        let cells = sut.photosListView.collectionView.visibleCells as! [PhotoCell]
        let image = UIImage(contentsOfFile: data[0].thumbnailUrl)
        XCTAssertEqual(cells.first?.imageView.image, image , "First cell contains the first photo object's thumbnail url")
    }
}
