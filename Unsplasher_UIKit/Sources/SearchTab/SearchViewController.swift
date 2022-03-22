//
//  SearchViewController.swift
//  Unsplasher_UIKit
//
//  Created by KEEN on 2022/03/22.
//

import UIKit

class SearchViewController: UIViewController {
  
  let searchView = SearchView()
  
  override func loadView() {
    super.loadView()
    view = searchView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}
