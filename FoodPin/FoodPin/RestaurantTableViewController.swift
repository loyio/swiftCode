//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Loyio on 2/9/21.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    enum Section{
        case all
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String>{
        let cellIdentifier = "datacell"
        
        let dataSource = UITableViewDiffableDataSource<Section, String>(
            tableView: tableView, cellProvider: {tableView, IndexPath, restaurantName in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: IndexPath)
                cell.textLabel?.text = restaurantName
                cell.imageView?.image = UIImage(named: "restaurant")
                
                return cell
            }
        )
        
        return dataSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
