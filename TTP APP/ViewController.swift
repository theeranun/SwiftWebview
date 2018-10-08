//
//  ViewController.swift
//  TTP APP
//
//  Created by Theeranun Chitcharak on 18/9/2561 BE.
//  Copyright © 2561 Tuktukpass. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //var slideImages = [UIImage(named: "banner1"), UIImage(named: "banner2"), UIImage(named: "banner3")]
    
    var slideImages: [String] = ["banner1", "banner2", "banner3"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    var presenter: ProductPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tuk Tuk Pass"
        
        //Image Slide
        pageControl.numberOfPages = slideImages.count
        for i in 0..<slideImages.count{
            frame.origin.x = scrollView.frame.size.width * CGFloat(i)
            frame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: slideImages[i])
            imageView.contentMode = .scaleAspectFit
            
            self.scrollView.addSubview(imageView)
            
//            let imageView = UIImageView()
//            imageView.image = slideImages[i]
//            //imageView.contentMode = .scaleAspectFit
//
//            let xPosition = self.view.frame.width * CGFloat(i)
//            imageView.frame = CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.scrollView.frame.height)
//
//            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
//            scrollView.addSubview(imageView)
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.width * CGFloat(slideImages.count)), height: scrollView.frame.height)
        scrollView.delegate = self
        
        setup()
        
        presenter.fill()
        collectionView.reloadData()
        
    }
    
    func setup(){
        //Collection
        presenter = ProductPresenter(viewController: self)
        collectionView.dataSource = presenter.datasource
        collectionView.delegate = presenter
        
    }
    
    func reloadView(){
        collectionView.reloadData()
    }
    
    //ScrollView Method
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
//    @IBAction func doSearch(_ sender: Any) {
//        //performSegue(withIdentifier: "openSearch", sender: self)
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
//        
//        let navigationController = self.navigationController
//        
////        desVC.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: desVC, action: Selector(desVC.closeView()))
////        desVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: desVC, action: nil)
//        
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.moveIn
//        transition.subtype = CATransitionSubtype.fromTop
//        
//        navigationController?.view.layer.add(transition, forKey: nil)
//        navigationController?.pushViewController(desVC, animated: false)
//        
//    }
    
}


