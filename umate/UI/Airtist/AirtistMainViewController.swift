//
//  AirtistMainViewController.swift
//  umate
//
//  Created by 이민욱 on 2021/07/15.
//

import UIKit
import Tabman
import Pageboy

class AirtistMainViewController: TabmanViewController {

    lazy var backButton: UIBarButtonItem = {
        let buttonIcon = UIImage(systemName: "chevron.backward")
        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(backBtn(_:)))
        button.image = buttonIcon
        button.tintColor = .lightGray
        return button
    }()
    
    @objc func backBtn(_ sender:UIBarButtonItem!){
        navigationController?.popViewController(animated: true)
      }
    
    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationSetup()
        viewSetup()

    }
    
    func navigationSetup() {
        self.navigationItem.leftBarButtonItem = self.backButton
    }

    func viewSetup() {
        let airtistTunesVC =  self.storyboard?.instantiateViewController(withIdentifier: "AirtistTunesViewController") as! AirtistTunesViewController
        let airtistAddedVC =  self.storyboard?.instantiateViewController(withIdentifier: "AirtistAddedViewController") as! AirtistAddedViewController
        let airtistAddByVC =  self.storyboard?.instantiateViewController(withIdentifier: "AirtistAddedByViewController") as! AirtistAddedByViewController
        
        viewControllers.append(airtistTunesVC)
        viewControllers.append(airtistAddedVC)
        viewControllers.append(airtistAddByVC)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.backgroundView.style = .blur(style: .light)
        bar.backgroundColor = .white
        bar.layout.contentInset = UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 50)
        bar.layout.contentMode = .fit
        bar.indicator.weight = .custom(value: 0)
        bar.indicator.cornerStyle = .rounded
        bar.fadesContentEdges = true
       
        
        bar.buttons.customize {
            
            $0.tintColor = .lightGray
            $0.selectedTintColor = .black
            if #available(iOS 11, *) {
                $0.adjustsFontForContentSizeCategory = true
            }
        }
        
        bar.indicator.tintColor = .black
        addBar(bar, dataSource: self, at: .top)
    }
    
}

extension AirtistMainViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        scrollToPage(.at(index: 0), animated: true, completion: nil)
        
        let item = TMBarItem(title: "")
       
        if(index == 0) {
            item.title = "Tunes"
        }
        else if(index == 1) {
            item.title = "Added"
        }
        else {
            item.title = "Added By"
        }
        
        return item
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
}
