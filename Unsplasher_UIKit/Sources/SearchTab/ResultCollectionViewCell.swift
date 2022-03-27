//
//  ResultCollectionViewCell.swift
//  Unsplasher_UIKit
//
//  Created by KEEN on 2022/03/24.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell, ViewRepresentable {
  
  static let identifier = String(describing: ResultCollectionViewCell.self)
  
  // MARK: - UI
  private let imageView: UIImageView = {
    let i = UIImageView()
    i.contentMode = .scaleAspectFill
    return i
  }()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    createViews()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    imageView.frame = contentView.bounds
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
  }
  
  // MARK: - Configure
  func createViews() {
    contentView.addSubview(imageView)
    contentView.clipsToBounds = true
  }
  
  func setConstraints() {
    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  func configure(image: UIImage?) {
    imageView.image = image
  }
  
}
