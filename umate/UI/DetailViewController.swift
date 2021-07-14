//
//  DetailViewController.swift
//  umate
//
//  Created by 이민욱 on 2021/07/13.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "DetailTableViewCell", bundle: nil)
        detailTableView.register(nibName, forCellReuseIdentifier: "DetailTableViewCell")
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.rowHeight = UITableView.automaticDimension
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = true
    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource, DetailTableViewCellDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        cell.delegate = self
        return cell
    }
    
    func moveBackBtn(flag: Bool) {
        
        if flag  {
            navigationController?.popViewController(animated: true)
        }
    }
}
