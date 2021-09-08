//
//  ViewController.swift
//  Photos
//
//  Created by Casandra Grullon on 9/8/21.
//

import UIKit

class PhotosListViewController: UIViewController {
    
    let photosListView = PhotosListView()
        
    override func loadView() {
        view = photosListView
    }
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.frame = loadingView.frame
        spinner.center = CGPoint(x: loadingView.bounds.size.width / 2,
                                 y: loadingView.bounds.size.height / 2)
        spinner.color = .systemGray
        return spinner
    }()
    
    private lazy var loadingView: UIView = {
        let loadingView = UIView()
        loadingView.center = view.center
        loadingView.backgroundColor = .clear
        return loadingView
    }()
        
    var photos = [Photo]() {
        didSet {
            photosListView.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        showActivityIndicator(loadingView: loadingView, spinner: spinner)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureCollectionView()
        fetchPhotos()
    }

    private func fetchPhotos() {
        APIClient.fetchPhotos { [weak self] (result) in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Network Error 404", message: error.localizedDescription, spinner: self!.spinner, view: self!.loadingView)
                }
            case .success(let photos):
                DispatchQueue.main.async {
                    self?.photos = photos
                    self?.hideActivityIndicator(loadingView: self!.loadingView, spinner: self!.spinner)
                }
            }
        }
    }
    
    private func configureCollectionView() {
        photosListView.collectionView.delegate = self
        photosListView.collectionView.dataSource = self
        photosListView.collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseId)
    }
    
    private func configureNavBar() {
        navigationItem.title = "Photos"
        navigationItem.backButtonDisplayMode = .minimal
        navigationController?.navigationBar.tintColor = .label
    }
}

extension PhotosListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsAcross: CGFloat = 2
        let spaceBetweenCells: CGFloat = 1
        let height = collectionView.bounds.width * 0.3
        let width = (height - (cellsAcross) * spaceBetweenCells)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as? PhotoCell else {
            fatalError("unable to dequeue PhotoCell")
        }
        let photo = photos[indexPath.row]
        cell.configureCell(for: photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        let detailVC = PhotoDetailViewController(photo)
        modalPresentationStyle = .fullScreen
        navigationController?.present(detailVC, animated: true)
    }
}
