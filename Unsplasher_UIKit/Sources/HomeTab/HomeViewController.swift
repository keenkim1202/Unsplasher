//
//  ViewController.swift
//  Unsplasher_UIKit
//
//  Created by KEEN on 2022/03/21.
//

import UIKit

class HomeViewController: UIViewController {

  let homeView = HomeView()
  let dummyData: [String] = ["image1", "image2", "image3", "image4"]
  
  override func loadView() {
    super.loadView()
    view = homeView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Unsplasher"
    
    homeView.tableView.rowHeight = UITableView.automaticDimension
    homeView.tableView.estimatedRowHeight = 50
    
    homeView.tableView.delegate = self
    homeView.tableView.dataSource = self
    homeView.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
  }

}
extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dummyData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
    cell.photoImageView.image = UIImage(named: dummyData[indexPath.row])
    cell.userNameLabel.text = "username"
    cell.descriptionLabel.text = "desc"
    
    if let image = cell.photoImageView.image, let averageColor = image.averageColor {
      if averageColor.isDarkColor {
        cell.userNameLabel.textColor = .white
        cell.descriptionLabel.textColor = .white
      }
    }

    return cell
  }
}

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let image = UIImage(named: dummyData[indexPath.row])!
    let ratio = image.getImageRatio()
    return tableView.frame.width / ratio
    
  }
}

