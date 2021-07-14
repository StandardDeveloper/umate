//
//  AirtistViewController.swift
//  umate
//
//  Created by 이민욱 on 2021/07/14.
//

import UIKit

class AirtistViewController: UIViewController {

    @IBOutlet weak var airtistCollectionView: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        
        let nibName = UINib(nibName: "AirtistCollectionViewCell", bundle: nil)
        airtistCollectionView.register(nibName, forCellWithReuseIdentifier: "AirtistCollectionViewCell")
        
        airtistCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        airtistCollectionView.delegate = self
        airtistCollectionView.dataSource = self
    }
}

extension AirtistViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = airtistCollectionView.dequeueReusableCell(withReuseIdentifier: "AirtistCollectionViewCell", for: indexPath) as! AirtistCollectionViewCell
        cell.airtistImageView.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
}

var AirtistSpacing: CollectionViewSpacing = CollectionViewSpacing(lineSpacing: 40, inest: 40)

extension AirtistViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 50, bottom: 0, right: 50)
    }
    
    //상하간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return AirtistSpacing.lineSpacing
    }
    //좌우간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return AirtistSpacing.inest
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 3 - AirtistSpacing.inest
        let size = CGSize(width: width - AirtistSpacing.inest / 2, height: width - AirtistSpacing.inest / 2)
        return size
    }
}
