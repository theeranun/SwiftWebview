//
//  ViewController.swift
//  TTP APP
//
//  Created by Theeranun Chitcharak on 18/9/2561 BE.
//  Copyright © 2561 Tuktukpass. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let webVeiwController = segue.destination as! WebViewController
        
        if segue.identifier == "booking"
        {
            webVeiwController.urlString = "https://www.booking.com/index.en-gb.html?label=gen173nr-1DCAEoggJCAlhYSDNYBGjdAYgBAZgBLrgBB8gBDNgBA-gBAZICAXmoAgM;sid=4c71fdcc4ce8dae4969e62c107a7553c;keep_landing=1&sb_price_type=total&"
        }
        else if segue.identifier == "rentalcars"
        {
            webVeiwController.urlString = "https://www.rentalcars.com"
        }else{
            webVeiwController.urlString = "No data"
        }
        
    }
    
    @IBAction func doBooking(_ sender: Any) {
        self.performSegue(withIdentifier: "booking", sender: self)
    }
    
    
    @IBAction func doRentalcars(_ sender: Any) {
        self.performSegue(withIdentifier: "rentalcars", sender: self)
    }
}

