//
//  ViewController.swift
//  UICollectionView-Practice
//
//  Created by Zeeshan Waheed on 02/09/2024.
//

import UIKit

class ViewController: UIViewController {
    
    // Array to hold images for the collection view
    private var images: [UIImage] = []

    // Collection view with a vertical scroll direction
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI() // Set up the user interface
        
        // Load images into the array
        loadImages()
        
        // Set data source and delegate for collection view
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBlue // Set background color
        
        // Add collection view to the view hierarchy and set constraints
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // Helper function to load images into the array
    private func loadImages() {
        for _ in 0...25 {
            images.append(contentsOf: [
                UIImage(named: "1")!,
                UIImage(named: "2")!,
                UIImage(named: "3")!,
                UIImage(named: "4")!,
                UIImage(named: "5")!
            ])
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Return the number of items in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    // Configure and return the cell for a given index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            fatalError("Failed to dequeue CustomCollectionViewCell.")
        }
        
        let image = images[indexPath.row]
        cell.configure(with: image)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    // Return the size of the item at the given index path
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100) // Fixed size for simplicity
    }
    
    // Return the vertical spacing between items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    // Return the horizontal spacing between items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    // Return the insets for the section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
