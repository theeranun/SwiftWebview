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
    @IBOutlet weak var searchBarTopConstraint: NSLayoutConstraint!
    
    var presenter: ProductPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tuk Tuk Pass"
        setup()
        
        presenter.fill()
        collectionView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setup(){
        searchBar.placeholder = "Search"
        
        presenter = ProductPresenter(viewController: self)
        searchBar.delegate = presenter
        collectionView.dataSource = presenter.datasource
        collectionView.delegate = presenter
        
        searchBarTopConstraint.constant = 0.0
        addCollectionViewObserver()
    }
    
    func addCollectionViewObserver(){
        collectionView.addObserver(self, forKeyPath: "contentOffset", options: [.new, .old], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        if let keypath = keyPath, keypath == "contentOffset", let collectionView = object as? UICollectionView {
            searchBarTopConstraint.constant = -1 * collectionView.contentOffset.y
        }
    }
    
    func reloadView(){
        collectionView.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    deinit {
        collectionView.removeObserver(self, forKeyPath: "contentOffset")
    }
}


