//
//  PhotoCell.swift
//  Photos
//
//  Created by Casandra Grullon on 9/8/21.
//

import UIKit
import Kingfisher

class PhotoCell: UICollectionViewCell {
    static let reuseId = "PhotoCell"
    
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGray2
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        imageViewConstraints()
    }
    
    private func imageViewConstraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        ])
    }
}

extension PhotoCell {
    func configureCell(for photo: Photo) {
        imageView.kf.setImage(with: URL(string: photo.thumbnailUrl))
    }
}
