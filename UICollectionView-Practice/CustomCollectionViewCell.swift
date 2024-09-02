//
//  CustomCollectionViewCell.swift
//  UICollectionView-Practice
//
//  Created by Zeeshan Waheed on 02/09/2024.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    // Image view to display images
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark") // Placeholder image
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // Configure the cell with an image
    public func configure(with image: UIImage) {
        myImageView.image = image
        setupUI() // Ensure the UI is set up
    }
    
    private func setupUI() {
        backgroundColor = .systemRed // Set cell background color
        
        // Add and set constraints for the image view
        addSubview(myImageView)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            myImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // Reset image view when cell is reused
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
}
