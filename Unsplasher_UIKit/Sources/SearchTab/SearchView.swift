//
//  SearchView.swift
//  Unsplasher_UIKit
//
//  Created by KEEN on 2022/03/22.
//

import UIKit
import CHTCollectionViewWaterfallLayout

// TODO: searchBar랑 label 안보임
class SearchView: UIView, ViewRepresentable {
  
  let searchBar: UISearchBar = {
    let s = UISearchBar()
    s.placeholder = "Search photos, collections, users"
    s.barTintColor = .mainBlack
    s.searchBarStyle = .minimal
    s.searchTextField.backgroundColor = .mainGray
    s.searchTextField.textColor = .lightGray
    s.searchTextField.leftView?.tintColor = .lightGray
    return s
  }()
  
  let discoverLabel: UILabel = {
    let l = UILabel()
    l.text = "Discover"
    l.textColor = .white
    l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    return l
  }()
  
  let collectionView: UICollectionView = {
    let layout = CHTCollectionViewWaterfallLayout()
    layout.itemRenderDirection = .leftToRight
    layout.columnCount = 2
    
    let c = UICollectionView(frame: .zero, collectionViewLayout: layout)
    c.register(ResultCollectionViewCell.self, forCellWithReuseIdentifier: ResultCollectionViewCell.identifier)
    return c
  }()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .mainBlack
    collectionView.backgroundColor = .mainBlack
    
    createViews()
    setConstraints()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  // MARK: - Configure
  func createViews() {
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    discoverLabel.translatesAutoresizingMaskIntoConstraints = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(searchBar)
    addSubview(discoverLabel)
    addSubview(collectionView)
  }

  func setConstraints() {
    NSLayoutConstraint.activate([
      searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
    ])
    
    NSLayoutConstraint.activate([
      discoverLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      discoverLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      discoverLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20)
    ])
    
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      collectionView.topAnchor.constraint(equalTo: discoverLabel.bottomAnchor, constant: 10),
      collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
