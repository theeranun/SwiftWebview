//
//  ViewController.swift
//  TTP APP
//
//  Created by Theeranun Chitcharak on 18/9/2561 BE.
//  Copyright © 2561 Tuktukpass. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
<<<<<<< HEAD
    var presenter: ProductPresenter!
    var searchBarBoundsY:CGFloat = 0.0
=======
    let imgArray = [UIImage(named: "booking"), UIImage(named: "rentalcars"), UIImage(named: "klook"), UIImage(named: "bellugg"), UIImage(named: "12goasia"), UIImage(named: "grab"), UIImage(named: "pamba"), UIImage(named: "now")]
    let dataArray = ["Accomodations", "Car Rental", "Excursion", "Baggage Delivery", "TravelTickets", "Taxi", "RideShare", "Food Delivery"]
    let urlArray = ["https://www.booking.com/index.en-gb.html?label=gen173nr-1DCAEoggJCAlhYSDNYBGjdAYgBAZgBLrgBB8gBDNgBA-gBAZICAXmoAgM;sid=4c71fdcc4ce8dae4969e62c107a7553c;keep_landing=1&sb_price_type=total&", "https://www.rentalcars.com", "https://www.klook.com", "https://system.bellugg.com/Booking/LuggageDelivery", "https://12go.asia", "https://www.grab.com/th/en/", "https://www.pambashare.com/", "https://www.now.in.th"]
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
>>>>>>> deab629c2b3b728bee9979a7cad2bf063650bde1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        presenter.fill()
        collectionView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
<<<<<<< HEAD
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
=======
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.setData(image:self.imgArray[indexPath.row]!, text: self.dataArray[indexPath.row])
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
>>>>>>> deab629c2b3b728bee9979a7cad2bf063650bde1
    }
    
    func setup(){
        searchBar.placeholder = "Search"
        
        presenter = ProductPresenter(viewController: self)
        searchBar.delegate = presenter
        collectionView.dataSource = presenter.datasource
        collectionView.delegate = presenter
    }
    
    func reloadView(){
        collectionView.reloadData()
    }
}


