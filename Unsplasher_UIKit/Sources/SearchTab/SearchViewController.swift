//
//  SearchViewController.swift
//  Unsplasher_UIKit
//
//  Created by KEEN on 2022/03/22.
//

import UIKit
import CHTCollectionViewWaterfallLayout

// search doc : https://unsplash.com/documentation#search-photos

class SearchViewController: UIViewController {
  
  let searchView = SearchView()
  let dummyData: [String] = ["image1", "image2", "image3", "image4", "image1", "image2", "image3", "image4"]

  override func loadView() {
    super.loadView()
    view = searchView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchView.searchBar.delegate = self
    searchView.collectionView.delegate = self
    searchView.collectionView.dataSource = self
  }
  
  // override func viewDidLayoutSubviews() {
  //   super.viewDidLayoutSubviews()
  //   // searchView.collectionView.frame = view.bounds
  // }
  
}

// MARK: Extension - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
}

// MARK: Extension - UICollectionViewDataSource & UICollectionViewDelegate
extension SearchViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dummyData.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResultCollectionViewCell.identifier, for: indexPath) as? ResultCollectionViewCell else { return UICollectionViewCell() }
    cell.configure(image: UIImage(named: dummyData[indexPath.item])!)
    cell.nameLabel.text = "username"
    
    return cell
  }
}

extension SearchViewController: UICollectionViewDelegate {
}

// MARK: Extension - CHTCollectionViewDelegateWaterfallLayout
extension SearchViewController: CHTCollectionViewDelegateWaterfallLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width / 2, height: 300)
  }
}
