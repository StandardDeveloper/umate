//
//  DetailTableViewCell.swift
//  umate
//
//  Created by 이민욱 on 2021/07/13.
//

import UIKit

protocol DetailTableViewCellDelegate {
    func moveBackBtn(flag: Bool)
}

class DetailTableViewCell: UITableViewCell {

    var delegate: DetailTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func backBtn(_ sender: Any) {
        
        delegate?.moveBackBtn(flag: true)
        print("button")
        
    }
    
}
