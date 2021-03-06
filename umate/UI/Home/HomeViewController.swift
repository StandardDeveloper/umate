//
//  HomeViewController.swift
//  umate
//
//  Created by 이민욱 on 2021/07/12.
//

import UIKit

struct CollectionViewSpacing {
    var lineSpacing: CGFloat = 0
    var inest: CGFloat = 0
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        
        homeCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    
        let nibName = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        homeCollectionView.register(nibName, forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 10
        let strTitle = "Title \nname"
        let attrtitleLabel = NSAttributedString(string: strTitle, attributes: [.paragraphStyle : paragraph])
        cell.titleLabel.attributedText = attrtitleLabel
        
        cell.titleLabel.numberOfLines = 2
        cell.titleLabel.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        cell.titleLabel.layer.cornerRadius = 8
        cell.titleLabel.layer.masksToBounds = true
        cell.titleLabel.textColor = .white
        
        cell.collectionImageView.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
}



var homeSpacing: CollectionViewSpacing = CollectionViewSpacing(lineSpacing: 5, inest: 1)

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - homeSpacing.inest - homeSpacing.lineSpacing - 10
        let size = CGSize(width: width, height: 240)
        print("TTTTTTTT", size.width, size.height)
        return size
    }
    
    //상하간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return homeSpacing.lineSpacing
    }
    //좌우간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return homeSpacing.inest
    }
}

