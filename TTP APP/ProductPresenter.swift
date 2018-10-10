//
//  ProductPresenter.swift
//  TTP APP
//
//  Created by Theeranun Chitcharak on 26/9/2561 BE.
//  Copyright © 2561 Tuktukpass. All rights reserved.
//

import UIKit

class ProductPresenter: NSObject, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    weak var viewController: ViewController?
    let datasource: ProductDatasource = ProductDatasource()
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    init(viewController: ViewController?) {
        super.init()
        
        self.viewController = viewController
    }
    
    func fill(){
        datasource.fill()
    }
    
    //MARK: UISearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        datasource.filter(searchTerm: searchText)
        viewController?.reloadView()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
        datasource.filter(searchTerm: "")
        viewController?.reloadView()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    //MARK: collectionView
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        
        let product = datasource.object(at: indexPath)
        
        desVC.urlString = product.url
        desVC.navTitle = product.title
        
        self.viewController?.navigationController?.pushViewController(desVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15.0, left: 0, bottom: 15.0, right: 0)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let estimatedWidth = CGFloat(estimateWidth)
//        let cellCount = floor(CGFloat(collectionView.frame.size.width) / estimatedWidth)
//        let margin = CGFloat(cellMarginSize * 2)
//        let width = (collectionView.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
//
//        return CGSize(width: width, height: width)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        
//        return CGSize(width: collectionView.frame.width, height: 200)
//    }
    
    
    
    
   
}
