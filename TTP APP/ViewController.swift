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
    
    let imgArray = [UIImage(named: "booking"), UIImage(named: "rentalcars"), UIImage(named: "klook"), UIImage(named: "bellugg"), UIImage(named: "12goasia"), UIImage(named: "grab"), UIImage(named: "pamba"), UIImage(named: "now")]
    let dataArray = ["Accomodations", "Car Rental", "Excursion", "Baggage Delivery", "TravelTickets", "Taxi", "RideShare", "Food Delivery"]
    let urlArray = ["https://www.booking.com/index.en-gb.html?label=gen173nr-1DCAEoggJCAlhYSDNYBGjdAYgBAZgBLrgBB8gBDNgBA-gBAZICAXmoAgM;sid=4c71fdcc4ce8dae4969e62c107a7553c;keep_landing=1&sb_price_type=total&", "https://www.rentalcars.com", "https://www.klook.com", "https://system.bellugg.com/Booking/LuggageDelivery", "https://12go.asia", "https://www.grab.com/th/en/", "https://www.pambashare.com/", "https://www.now.in.th"]
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set Delegates
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        //Register cells
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        
        //Setup Gridview
        self.setupGridView()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupGridView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func setupGridView(){
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
}

extension ViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.setData(image:self.imgArray[indexPath.row]!, text: self.dataArray[indexPath.row])
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWidth()
        return CGSize(width: width, height: width)
    }
    
    func calculateWidth() -> CGFloat{
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width)/estimatedWidth)
    
        let margin = CGFloat(cellMarginSize*2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        
        desVC.urlString = urlArray[indexPath.row]
        desVC.navTitle = dataArray[indexPath.row]
        
        self.navigationController?.pushViewController(desVC, animated: true)
    }
}

