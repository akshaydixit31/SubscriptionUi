//
//  ViewController.swift
//  SubscriptionUi
//
//  Created by Appinventiv Technologies on 09/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var memberShipTable: UITableView!
    
    let proMembership = ProMemberShip()
    let platinumMemberShip = PlatinumMemberShip()
    let index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Subscription"
        self.navigationItem.backBarButtonItem?.title = "Back"
        
        let cellNib = UINib(nibName: "MemberShipCell",
                            bundle: nil)
        self.memberShipTable.register(cellNib,
                                      forCellReuseIdentifier: "MemberShipCellId")
        
        self.memberShipTable.dataSource = self
        self.memberShipTable.delegate = self
        
    }
    
}

extension ViewController: UITableViewDataSource,
UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return 2
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemberShipCellId",
                                                       for: indexPath) as? MemberShipCell else {
                                                        
                                                        fatalError(" cell not found ")
                                                        
        }
        
        cell.backgroundImage.layer.cornerRadius = 50
        cell.buyNowButton.tag = indexPath.row
        cell.buyNowButton.layer.cornerRadius = 10
        cell.buyNowButton.addTarget(self,
                                    action: #selector(self.showDetail(_:)),
                                    for: UIControlEvents.touchUpInside)
        
        switch indexPath.row {
            
        case 0:
            
            cell.backgroundImage.image = proMembership.cellBackgroundImage
            cell.buyNowButton.setTitleColor(proMembership.greenColor,
                                            for: UIControlState.normal)
            cell.memberShipPriceLabel.text = proMembership.price
            cell.memberShipTitleLabel.text = proMembership.memberShipTitle
            
            return cell
            
        case 1:
            
            cell.backgroundImage.image = platinumMemberShip.cellBackgroundImage
            cell.buyNowButton.setTitleColor(platinumMemberShip.blueColor,
                                            for: UIControlState.normal)
            cell.memberShipPriceLabel.text = platinumMemberShip.price
            cell.memberShipTitleLabel.text = platinumMemberShip.memberShipTitle
            
            return cell
            
        default:
            
            return cell
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
        
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return 10
        
    }
    
    @objc func showDetail(_ sender: UIButton){
        
        guard let showDetailScene = self.storyboard?.instantiateViewController(withIdentifier: "ShowMemberShipDetailVcId") as? ShowMemberShipDetailVc else {
            
            fatalError("")
            
        }
        showDetailScene.index = sender.tag
        self.navigationController?.pushViewController(showDetailScene,
                                                      animated: true)
        
    }
}
