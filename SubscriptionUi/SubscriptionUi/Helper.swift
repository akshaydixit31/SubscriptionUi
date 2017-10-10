//
//  Helper.swift
//  SubscriptionUi
//
//  Created by Appinventiv Technologies on 10/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import Foundation


import Foundation
import UIKit

//MARK: UIViewController Extension
//MARK:-
extension UIViewController {
    
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    func openAlertPopUp(title: String, message: String, action: @escaping ()->()){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //        alert.view.tintColor = UIColor.black
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: {UIAlertAction in
            action()
        })
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func openAlertOption(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: {UIAlertAction in
        })
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func shareWithSocialMedia(msg : String,imageToShare : UIImage? = nil,completionHandler : @escaping (_ succeeded : Bool)->()) {
        
        var objectsToShare : [Any]!
        let text = msg
        
        if let img = imageToShare {
            
            let imageView = UIImageView(image: img)
            imageView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
            imageView.contentMode = .center
            
            UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0.0)
            imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            objectsToShare = [text, image! ]
            
        } else {
            
            objectsToShare = [text]
        }
        
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        let excludeActivities = [
            UIActivityType.print,
            UIActivityType.assignToContact,
            UIActivityType.saveToCameraRoll,
            UIActivityType.addToReadingList
        ]
        
        activityVC.completionWithItemsHandler = {
            
            (activity, success, items, error) in
            
            completionHandler(success)
        }
        
        activityVC.excludedActivityTypes = excludeActivities
        self.present(activityVC, animated: true, completion: nil)
    }
}

//MARK:- UIView Extensions
extension UIView {
    func isHighlighted(_ bool: Bool) {
        if bool {
            self.backgroundColor = UIColor.white
        } else {
            self.backgroundColor = UIColor.lightGray
        }
    }
}

// MARK: - Properties
public extension UITableView {
    
    
    /// UITableView: Register UITableView nib if nib name and identifier name same.
    ///
    /// - Parameters:
    ///   - nibmName: nib Name / XIB name and identifier name should be same.
    public func registerNib(nibName: String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    /// SwifterSwift: Index path of last row in tableView.
    public var indexPathForLastRow: IndexPath? {
        return indexPathForLastRow(inSection: lastSection)
    }
    
    /// SwifterSwift: Index of last section in tableView.
    public var lastSection: Int {
        return numberOfSections > 0 ? numberOfSections - 1 : 0
    }
    
    /// SwifterSwift: Number of all rows in all sections of tableView.
    public var numberOfRows: Int {
        var section = 0
        var rowCount = 0
        while section < numberOfSections {
            rowCount += numberOfRows(inSection: section)
            section += 1
        }
        return rowCount
    }
    
    /// SwifterSwift: IndexPath for last row in section.
    ///
    /// - Parameter section: section to get last row in.
    /// - Returns: optional last indexPath for last row in section (if applicable).
    public func indexPathForLastRow(inSection section: Int) -> IndexPath? {
        guard section >= 0 else {
            return nil
        }
        guard numberOfRows(inSection: section) > 0  else {
            return IndexPath(row: 0, section: section)
        }
        return IndexPath(row: numberOfRows(inSection: section) - 1, section: section)
    }
    
    
    public func cellForItem(item: AnyObject) -> UITableViewCell? {
        if let indexPath = self.indexPathForItem(item: item){
            return self.cellForRow(at: indexPath as IndexPath)
        }
        return nil
    }
    
    public func indexPathForItem(item: AnyObject) -> IndexPath? {
        let buttonPosition: CGPoint = item.convert(CGPoint.zero, to: self)
        return self.indexPathForRow(at: buttonPosition)
    }
    
}

extension UITextField {
    
    public func tableViewIndexPath(tableView: UITableView) -> IndexPath? {
        
        if let cell = self.tableViewCell() {
            return tableView.indexPath(for: cell) as IndexPath?
        }
        return nil
    }
    
    func tableViewCell() -> UITableViewCell? {
        
        var tableViewcell : UIView? = self
        
        while(tableViewcell != nil) {
            
            if tableViewcell! is UITableViewCell {
                break
            }
            tableViewcell = tableViewcell!.superview
        }
        return tableViewcell as? UITableViewCell
        
    }
}
