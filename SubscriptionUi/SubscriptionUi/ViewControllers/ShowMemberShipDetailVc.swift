//
//  ShowMemberShipDetailVc.swift
//  SubscriptionUi
//
//  Created by Appinventiv Technologies on 09/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ShowMemberShipDetailVc: UIViewController {
    
    //   MARK:- Outlet's ..
    
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionTableView: UITableView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var memberShipTitle: UILabel!
    @IBOutlet weak var buyNowButtonOutlet: UIButton!
    
    //   MARK:- Variable's ..
    
    let proMembership = ProMemberShip()
    let platinumMemberShip = PlatinumMemberShip()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Subscription"
        self.pageController.currentPage = self.index
        
        //        Register nib..
        registerNib()
        assignData()
        
    }
    
    @IBAction func buyNowButton(_ sender: UIButton) {
        
    }
    
    func registerNib() {
        
        let headerCell = UINib(nibName: "DescriptionTableHeader",
                               bundle: nil)
        self.descriptionTableView.register(headerCell, forHeaderFooterViewReuseIdentifier: "DescriptionTableHeaderId")
        
        let cellNib = UINib(nibName: "DescriptionTableCell",
                            bundle: nil)
        self.descriptionTableView.register(cellNib,
                                           forCellReuseIdentifier: "DescriptionTableCellId")
        
        self.descriptionTableView.dataSource = self
        self.descriptionTableView.delegate = self
        
    }
    
    func assignData()  {
        
        switch index {
            
        case 0:
            
            self.priceLabel.text = self.proMembership.price
            self.titleImage.image = self.proMembership.image
            self.memberShipTitle.text = self.proMembership.memberShipTitle
            self.buyNowButtonOutlet.backgroundColor = self.proMembership.greenColor
            
        default:
            
            self.priceLabel.text = self.platinumMemberShip.price
            self.titleImage.image = self.platinumMemberShip.image
            self.memberShipTitle.text = self.platinumMemberShip.memberShipTitle
            self.buyNowButtonOutlet.backgroundColor = self.platinumMemberShip.blueColor
            
        }
    }
    
}

extension ShowMemberShipDetailVc: UITableViewDataSource,
UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
        
    }
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DescriptionTableHeaderId") as? DescriptionTableHeader else {
            
            fatalError("header not found")
        }
        
        switch index {
            
        case 0:
            
            header.headerLabel.text = self.proMembership.headerText
            header.headerLabel.textColor = self.proMembership.headerTextColor
            
            
        case 1:
            
            header.headerLabel.text = self.platinumMemberShip.headerText
            header.headerLabel.textColor = self.platinumMemberShip.headerTextColor
            
        default:
            
            return header
            
        }
        
        return header
        
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        switch index {
            
        case 0:
            
            return self.proMembership.proMemberShipData.count
            
        case 1:
            
            return self.platinumMemberShip.platinumMemberShip.count
            
        default:
            return 0
            
        }
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableCellId",
                                                       for: indexPath) as? DescriptionTableCell else {
                                                        
                                                        fatalError("Cell not found")
        }
        switch index {
            
        case 0:
            
            cell.descriptionLabel.text = self.proMembership.proMemberShipData[indexPath.row]
            
        case 1:
            
            cell.descriptionLabel.text = self.platinumMemberShip.platinumMemberShip[indexPath.row]
            
        default:
            
            return cell
            
        }
        
        return cell
        
        
    }
    
    
    
    
}
