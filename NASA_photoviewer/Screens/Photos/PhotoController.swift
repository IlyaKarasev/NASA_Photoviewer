//
//  PhotoViewController.swift
//  NASA_photoviewer
//
//  Created by ILYA Karasev on 23.03.2021.
//

import UIKit

class PhotoController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private var mainView = PhotoView()
    private var photos = [Photo]()
    private var photoService = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        
        photoService.getPhotos { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let photos):
                self.photos = photos.latest_photos ?? [Photo]()
                self.mainView.photoCollectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as! PhotoCell
        cell.photoView.download(from: photos[indexPath.item].image ?? "")
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoCell
        let image = cell.photoView.image
        
        let destinationVC = ShowPhotoController()
        destinationVC.currentImage = image
        show(destinationVC, sender: nil)
    }
    
    private func configView() {
        self.view = self.mainView
        mainView.photoCollectionView.setCollectionViewLayout(self.mainView.layout, animated: true)
        mainView.photoCollectionView.delegate = self
        mainView.photoCollectionView.dataSource = self
        self.navigationItem.title = "Latest photos from Curiosity"
        mainView.photoCollectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseId)
    }
}
