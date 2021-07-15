//
//  AirtistTunesCollectionReusableView.swift
//  umate
//
//  Created by 이민욱 on 2021/07/15.
//

import UIKit

class AirtistTunesCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var airtistTunesHeaderImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    func viewSetup() {
        //label
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 10
        let attrtitleLabel = NSAttributedString(string: "3인조 혼성 밴드 이븐이프 입니다.", attributes: [.paragraphStyle : paragraph])
        infoLabel.attributedText = attrtitleLabel
        infoLabel.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        infoLabel.layer.cornerRadius = 10
        infoLabel.layer.masksToBounds = true
        infoLabel.textColor = .white
        
        //imageView
        airtistTunesHeaderImageView.layer.cornerRadius = 10
    }
    
}
