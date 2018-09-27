//
//  ProductDatasource.swift
//  TTP APP
//
//  Created by Theeranun Chitcharak on 26/9/2561 BE.
//  Copyright © 2561 Tuktukpass. All rights reserved.
//

import UIKit

class ProductDatasource: NSObject, UICollectionViewDataSource {
    
    private var filteredObjects: [Product] = []
    private var objects: [Product] = []
    private var isFiltering: Bool = false
    
    func fill(){
        objects = [
            Product(image: UIImage(named: "booking")!, title: "Accomodations", url: "https://www.booking.com/index.en-gb.html?label=gen173nr-1DCAEoggJCAlhYSDNYBGjdAYgBAZgBLrgBB8gBDNgBA-gBAZICAXmoAgM;sid=4c71fdcc4ce8dae4969e62c107a7553c;keep_landing=1&sb_price_type=total&"),
            Product(image: UIImage(named: "rentalcars")!, title: "Car Rental", url: "https://www.rentalcars.com"),
            Product(image: UIImage(named: "klook")!, title: "Excursion", url: "https://www.klook.com"),
            Product(image: UIImage(named: "bellugg")!, title: "Baggage Delivery", url: "https://system.bellugg.com/Booking/LuggageDelivery"),
            Product(image: UIImage(named: "12goasia")!, title: "TravelTickets", url: "https://12go.asia"),
            Product(image: UIImage(named: "grab")!, title: "Taxi", url: "https://www.grab.com/th/en/"),
            Product(image: UIImage(named: "pamba")!, title: "RideShare", url: "https://www.pambashare.com/"),
            Product(image: UIImage(named: "now")!, title: "Food Delivery", url: "https://www.now.in.th"),
        ]
    }
    
    func filter(searchTerm: String){
        if searchTerm.isEmpty{
            isFiltering = false
            filteredObjects.removeAll()
        }else{
            isFiltering = true
            
            filteredObjects = objects.filter({
                return $0.title.localizedCaseInsensitiveContains(searchTerm)
            })
        }
    }
    
    func object(at indexPath: IndexPath) -> Product {
        if isFiltering {
            return filteredObjects[indexPath.item]
        }else{
            return objects[indexPath.item]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return filteredObjects.count
        }else{
            return objects.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        
        let product = object(at: indexPath)
        cell.fill(with: product)
        
        return cell
    }
}
