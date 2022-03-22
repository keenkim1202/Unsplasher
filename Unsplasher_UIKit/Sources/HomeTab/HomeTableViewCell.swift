//
//  HomeTableViewCell.swift
//  Unsplasher_UIKit
//
//  Created by KEEN on 2022/03/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell, ViewRepresentable {
  
  static let identifier = String(describing: HomeTableViewCell.self)

  let photoImageView: UIImageView = {
    let i = UIImageView()
    i.contentMode = .scaleAspectFit
    return i
  }()
  
  let userNameLabel: UILabel = {
    let l = UILabel()
    l.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    return l
  }()
  
  let descriptionLabel: UILabel = {
    let l = UILabel()
    l.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    return l
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    createViews()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Configure
  func createViews() {
    photoImageView.translatesAutoresizingMaskIntoConstraints = false
    userNameLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    
    contentView.addSubview(photoImageView)
    contentView.addSubview(userNameLabel)
    contentView.addSubview(descriptionLabel)
  }
  
  func setConstraints() {
    let safeArea = contentView.safeAreaLayoutGuide
    
    NSLayoutConstraint.activate([
      photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      photoImageView.topAnchor.constraint(equalTo: self.topAnchor),
      photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ])
    
    NSLayoutConstraint.activate([
      userNameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
      userNameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -16),
      userNameLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16),
      // userNameLabel.heightAnchor.constraint(equalToConstant: 25)
    ])
    
    NSLayoutConstraint.activate([
      descriptionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
      descriptionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -16),
      descriptionLabel.bottomAnchor.constraint(equalTo: userNameLabel.topAnchor),
      // descriptionLabel.heightAnchor.constraint(equalToConstant: 25)
    ])
  }
  
}
