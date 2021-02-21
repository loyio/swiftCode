//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Loyio on 2/9/21.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Shanghai", image: "cafedeadend", isFavorite: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Beijing", image: "homei", isFavorite: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "London", image: "teakha", isFavorite: false),
        Restaurant(name: "Cafe Loisl", type: "Austrian Causual Drink", location: "New York", image: "cafeloisl", isFavorite: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Paris", image: "petiteoyster", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Berlin", image: "forkee", isFavorite: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Tokyo", image: "posatelier", isFavorite: false),
        Restaurant(name: "Bourke Street Bakery", type: "Chocolate", location: "Moscow", image: "bourkestreetbakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Los Angeles", image: "haigh", isFavorite: false),
        Restaurant(name: "Palomino Espresso", type: "American Seafood", location: "Shanghai", image: "palomino", isFavorite: false),
        Restaurant(name: "Upstate", type: "American", location: "Shanghai", image: "Beijing", isFavorite: false),
        Restaurant(name: "Traif", type: "American", location: "Shanghai", image: "London", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "Paris", image: "waffleandwolf", isFavorite: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "Berlin", image: "fiveleaves", isFavorite: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Tokyo", image: "cafelore", isFavorite: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "Moscow", image: "confessional", isFavorite: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "Los Angeles", image: "barrafina", isFavorite: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "Sydney", image: "donostia", isFavorite: false),
        Restaurant(name: "Royal Oak", type: "British", location: "Macao", image: "royaloak", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "Singapore City", image: "cask", isFavorite: false)
    ]
    
    lazy var dataSource = configureDataSource()
    
    
    // MARK: - View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
        tableView.separatorStyle = .none
        
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Restaurant>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurants, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    // MARK: - UITableView Diffable Data Source
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, Restaurant>{
        let cellIdentifier = "favoritecell"
        
        let dataSource = RestaurantDiffableDataSource(
            tableView: tableView, cellProvider: {tableView, IndexPath, restaurant in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: IndexPath) as! RestaurantTableViewCell
                cell.nameLabel.text = restaurant.name
                cell.locationLabel.text = restaurant.location
                cell.typeLabel.text = restaurant.type
                cell.thumbnailImageVIew.image = UIImage(named: restaurant.image)
                cell.favoriteImageView.isHidden = restaurant.isFavorite ? false : true
                
                return cell
            }
        )
        
        return dataSource
    }

    // MARK: - UITableViewDelegate Protocol
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        if let popoverController = optionMenu.popoverPresentationController{
            if let cell = tableView.cellForRow(at: indexPath){
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        let reserveActionHandler = { (action:UIAlertAction!) -> Void in
            
            let alertMessage = UIAlertController(title: "Not available yet", message: "Sorry, this feature is not available yet. Please retry later", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let reserveAction = UIAlertAction(title: "Reserve a table", style: .default, handler: reserveActionHandler)
        optionMenu.addAction(reserveAction)
        
        let favoriteActionTitle = self.restaurants[indexPath.row].isFavorite ? "Remove from favorites" : "Mark as favorite"
        let favoriteAction = UIAlertAction(title: favoriteActionTitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            cell.favoriteImageView.isHidden = self.restaurants[indexPath.row].isFavorite
            self.restaurants[indexPath.row].isFavorite = self.restaurants[indexPath.row].isFavorite ? false : true
        })
        optionMenu.addAction(favoriteAction)
        
        
        present(optionMenu, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: false)
    }

}
