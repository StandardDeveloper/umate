//
//  HomeViewController.swift
//  umate
//
//  Created by 이민욱 on 2021/07/12.
//

import UIKit

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
        paragraph.addTabStop(NSTextTab(textAlignment: .left, location: 10, options: [:]))
        paragraph.firstLineHeadIndent = 15
        let attrtitleLabel = NSAttributedString(string: "Title", attributes: [.paragraphStyle : paragraph])
        cell.titleLabel.attributedText = attrtitleLabel
        cell.titleLabel.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        cell.titleLabel.layer.cornerRadius = 3
        cell.titleLabel.layer.masksToBounds = true
        cell.titleLabel.textColor = .white
        
        paragraph.addTabStop(NSTextTab(textAlignment: .left, location: 10, options: [:]))
        paragraph.firstLineHeadIndent = 15
        let attrnameLabel = NSAttributedString(string: "name", attributes: [.paragraphStyle : paragraph])
        cell.nameLabel.attributedText = attrnameLabel
        cell.nameLabel.backgroundColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 0.7)
        cell.nameLabel.layer.cornerRadius = 2
        cell.nameLabel.layer.masksToBounds = true
        cell.nameLabel.textColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        
        cell.collectionImageView.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
}

let lineSpacing: CGFloat = 5
let inset: CGFloat = 1

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - inset - lineSpacing - 10
        print("width", width)
        let size = CGSize(width: width, height: 240)
        return size
    }
    
    //상하간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    //좌우간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return inset
    }
}

