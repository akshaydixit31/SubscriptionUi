//
//  MemberShipDetailVc.swift
//  SubscriptionUi
//
//  Created by Appinventiv Technologies on 10/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class MemberShipDetailVc: UIViewController {
    
    // MARK:- Outlet's..
    let proMembership = ProMemberShip()
    let platinumMember = PlatinumMemberShip()
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK:- Variable's..
    
    var proMemberShip = ShowMemberShipDetailVc()
    var platinumMemberShip = ShowMemberShipDetailVc()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubView()
    
    }
    
    override func viewWillLayoutSubviews() {
        
        self.scrollView.frame = CGRect( x: 0 ,
                                        y: 126 ,
                                        width : self.view.frame.width ,
                                        height: self.scrollView.frame.height )
        
        proMemberShip = ShowMemberShipDetailVc.instantiate( fromAppStoryboard: .Main )
        proMemberShip.headerText = proMembership.headerText
        proMemberShip.headerTextColor = proMembership.headerTextColor
        proMemberShip.backGroundColor = proMembership.greenColor
        proMemberShip.image = proMembership.image!
        proMemberShip.memberShipData = proMembership.proMemberShipData
        proMemberShip.memberShipTitleName = proMembership.memberShipTitle
        proMemberShip.price = proMembership.price
        
        platinumMemberShip =  ShowMemberShipDetailVc.instantiate( fromAppStoryboard: .Main )
        platinumMemberShip.headerText = platinumMember.headerText
        platinumMemberShip.headerTextColor = platinumMember.headerTextColor
        platinumMemberShip.backGroundColor = platinumMember.blueColor
        platinumMemberShip.image = platinumMember.image!
        platinumMemberShip.memberShipData = platinumMember.platinumMemberShip
        platinumMemberShip.memberShipTitleName = platinumMember.memberShipTitle
        platinumMemberShip.price = platinumMember.price
        
        proMemberShip.view.frame = CGRect( x:  0,
                                           y: 0 ,
                                           width : self.scrollView.frame.width,
                                           height: self.scrollView.frame.height )
        
        platinumMemberShip.view.frame = CGRect(x: self.scrollView.frame.width ,
                                               y: 0 ,
                                               width : self.scrollView.frame.width,
                                               height:self.scrollView.frame.height)
        
        self.scrollView.contentSize = CGSize(width: (self.scrollView.frame.width) * 2,
                                             height: self.scrollView.frame.height)
        
        self.scrollView.addSubview((proMemberShip.view)!)
        self.scrollView.addSubview((platinumMemberShip.view)!)
        
        self.addChildViewController(proMemberShip)
        self.addChildViewController(platinumMemberShip)
        
        proMemberShip.didMove(toParentViewController: self)
        platinumMemberShip.didMove(toParentViewController: self)
        
    }
    
    // MARK: Private Function
    
    func setUpSubView() {
        
        // SETTING UP THE DELEGATE OF SCROLL VIEW
        self.scrollView.delegate = self
        self.scrollView.delegate = self
        
    }
    
}

extension  MemberShipDetailVc : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if  ( self.scrollView.contentOffset.x >= self.scrollView.frame.width ){
            
            self.pageController.currentPage = 1
            
        } else{
            
            self.pageController.currentPage = 0
            
        }
    }
}
