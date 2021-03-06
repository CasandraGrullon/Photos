//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Casandra Grullon on 9/8/21.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    //MARK:- View
    let photoDetailView = PhotoDetailView()
    
    override func loadView() {
        view = photoDetailView
    }
    //MARK:- ViewController properties
    public var photo: Photo
    
    init(_ photo: Photo) {
        self.photo = photo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        updateUI(for: photo)
    }
    
    //MARK:- UI methods
    private func updateUI(for photo: Photo) {
        photoDetailView.imageView.kf.setImage(with: URL(string: photo.url))
        photoDetailView.titleLabel.text = photo.title
    }
}
