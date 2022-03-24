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
    return s
  }()
  
  let discoverLabel: UILabel = {
    let l = UILabel()
    l.text = "Discover"
    l.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    return l
  }()
  
  let collectionView: UICollectionView = {
    let layout = CHTCollectionViewWaterfallLayout()
    layout.itemRenderDirection = .leftToRight
    layout.columnCount = 2
    
    let c = UICollectionView(frame: .zero, collectionViewLayout: layout)
    c.register(ResultCollectionViewCell.self, forCellWithReuseIdentifier: ResultCollectionViewCell.identifier)
    c.translatesAutoresizingMaskIntoConstraints = false
    return c
  }()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    createViews()
    setConstraints()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  // MARK: - Configure
  func createViews() {
    addSubview(searchBar)
    addSubview(discoverLabel)
    addSubview(collectionView)
    
    discoverLabel.backgroundColor = .yellow
    searchBar.backgroundColor = .green
  }

  func setConstraints() {
    NSLayoutConstraint.activate([
      searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      searchBar.bottomAnchor.constraint(equalTo: discoverLabel.topAnchor, constant: 10),
      searchBar.heightAnchor.constraint(equalToConstant: 44) // test
    ])
    
    NSLayoutConstraint.activate([
      discoverLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      discoverLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      discoverLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: -10),
      discoverLabel.heightAnchor.constraint(equalToConstant: 20) // test
    ])
    
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      collectionView.topAnchor.constraint(equalTo: discoverLabel.bottomAnchor, constant: -10),
      collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
