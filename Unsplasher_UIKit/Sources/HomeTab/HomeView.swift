//
//  HomeView.swift
//  Unsplasher_UIKit
//
//  Created by KEEN on 2022/03/22.
//

import UIKit

class HomeView: UIView, ViewRepresentable {
  
  let tableView: UITableView = {
    let t = UITableView()
    t.translatesAutoresizingMaskIntoConstraints = false
    return t
  }()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .darkGray
    createViews()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  // MARK: - Configure
  func createViews() {
    addSubview(tableView)
  }
  
  func setConstraints() {
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  
}
