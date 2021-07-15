//
//  AirtistTunesViewController.swift
//  umate
//
//  Created by 이민욱 on 2021/07/15.
//

import UIKit

class AirtistTunesViewController: UIViewController {
    
    @IBOutlet weak var airtistTunesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        airtistTunesCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        airtistTunesCollectionView.delegate = self
        airtistTunesCollectionView.dataSource = self
        
        let nibName = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        airtistTunesCollectionView.register(nibName, forCellWithReuseIdentifier: "HomeCollectionViewCell")

    }
    
}

extension AirtistTunesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "AirtistTunesCollectionReusableView", for: indexPath) as! AirtistTunesCollectionReusableView
        headerview.viewSetup()
        return headerview
    }
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
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
}

var airtistTunesSpacing: CollectionViewSpacing = CollectionViewSpacing(lineSpacing: 0, inest: 3)

extension AirtistTunesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30)
    }
    
    //상하간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return airtistTunesSpacing.lineSpacing
    }
    //좌우간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return airtistTunesSpacing.inest
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - airtistTunesSpacing.inest - 30
        let size = CGSize(width: width - airtistTunesSpacing.inest / 2 , height: width - airtistTunesSpacing.inest / 2)
        return size
    }
    
 
}






