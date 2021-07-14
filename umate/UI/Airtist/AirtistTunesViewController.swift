//
//  AirtistTunesViewController.swift
//  umate
//
//  Created by 이민욱 on 2021/07/15.
//

import UIKit

class AirtistTunesViewController: UIViewController {

    @IBOutlet weak var airtistTunesImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var AirtistTunesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AirtistTunesCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        AirtistTunesCollectionView.delegate = self
        AirtistTunesCollectionView.dataSource = self
        
        let nibName = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        AirtistTunesCollectionView.register(nibName, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        viewSetup()
    }
    
    func viewSetup() {
        
        //label
        let paragraph = NSMutableParagraphStyle()
        paragraph.addTabStop(NSTextTab(textAlignment: .left, location: 10, options: [:]))
        paragraph.firstLineHeadIndent = 15
        let attrtitleLabel = NSAttributedString(string: "3인조 혼성 밴드 이븐이프 입니다.", attributes: [.paragraphStyle : paragraph])
        infoLabel.attributedText = attrtitleLabel
        infoLabel.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        infoLabel.layer.cornerRadius = 10
        infoLabel.layer.masksToBounds = true
        infoLabel.textColor = .white
        
        //imageView
        airtistTunesImageView.layer.cornerRadius = 10
    }
      

}

extension AirtistTunesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = AirtistTunesCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.addTabStop(NSTextTab(textAlignment: .left, location: 10, options: [:]))
        paragraph.firstLineHeadIndent = 15
        let attrtitleLabel = NSAttributedString(string: "Title", attributes: [.paragraphStyle : paragraph])
        cell.titleLabel.attributedText = attrtitleLabel
        cell.titleLabel.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        cell.titleLabel.layer.cornerRadius = 2
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
}

var airtistTunesSpacing: CollectionViewSpacing = CollectionViewSpacing(lineSpacing: 5, inest: 1)

extension AirtistTunesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - homeSpacing.inest - homeSpacing.lineSpacing - 10
        let size = CGSize(width: width, height: 240)
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
