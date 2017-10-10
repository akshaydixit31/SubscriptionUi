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
    @IBOutlet weak var memberShipTitle: UILabel!
    @IBOutlet weak var buyNowButtonOutlet: UIButton!
    
    //   MARK:- Variable's ..
    
    var memberShipData = [String]()
    var  price = String()
    var image = UIImage()
    var memberShipTitleName = String()
    var backGroundColor = UIColor (red: 69.0/255.0,
                                   green: 213.0/255.0,
                                   blue: 138.0/255.0,
                                   alpha: 1.0)
    var headerText = String()
    var headerTextColor = UIColor (red: 69.0/255.0,
                                   green: 213.0/255.0,
                                   blue: 138.0/255.0,
                                   alpha: 1.0)
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Subscription"
        //        Register nib..
        registerNib()
        assignData()
        uiConnerCut()
       
    }
    
    @IBAction func buyNowButton(_ sender: UIButton) {
        
        
        
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
        
        header.headerLabel.text = self.headerText
        header.headerLabel.textColor = self.headerTextColor
        
        return header
        
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return self.memberShipData.count
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableCellId",
                                                       for: indexPath) as? DescriptionTableCell else {
                                                        
                                                        fatalError("Cell not found")
        }
        cell.descriptionLabel.text = self.memberShipData[indexPath.row]
        
        return cell
        
    }
    
}

extension ShowMemberShipDetailVc {
    
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
        
        self.priceLabel.text = self.price
        self.titleImage.image = self.image
        self.memberShipTitle.text = self.memberShipTitleName
        self.buyNowButtonOutlet.backgroundColor = self.backGroundColor
        
    }
    
    func uiConnerCut(){
        
        self.buyNowButtonOutlet.layer.cornerRadius = 5
        self.descriptionTableView.layer.cornerRadius = 5
        self.descriptionTableView.layer.borderWidth = 1
        self.descriptionTableView.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
}
