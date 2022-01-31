//
//  ResuableNavBar.swift
//  ELStickMeNotes
//
//  Created by Suraj Rautela on 05/03/21.
//  Copyright © 2021 Vaibhav. All rights reserved.
//

import Foundation
import UIKit

#if !os(watchOS)
public protocol ReusableNavBarProtocol: AnyObject {
    
    func didTapLeftButton()
    func didTapFirstRigthButton()
    func didTapSecondRigthButton()
    func didTapBackButton()
}


class ReusableNavBar: UIView {
    
    var navigationBar: UINavigationBar!
    
    weak var delegate: ReusableNavBarProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setNavigationBar(title: String, leftBarItem: UIBarButtonItem?, backButton: UIBarButtonItem?, rightBarItems: [UIBarButtonItem]?) {
        
        navigationBar = UINavigationBar(frame: .zero)
        
        self.addSubview(navigationBar)
        navigationBar.fillSuperview()
        
        navigationBar.barTintColor = ColorNameUIKit.viewWhite
       // navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Theme.boldLabelFont!,
                                             //NSAttributedString.Key.foregroundColor: Theme.regularLabelColor!]
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        

        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        navigationBar.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        navigationBar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        navigationBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        let navItem = UINavigationItem(title: title)
        
        if let rightItem1 = rightBarItems?.first, let rightItem2 = rightBarItems?.last {
            navItem.rightBarButtonItems = [rightItem1, rightItem2]
           // navItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: Theme.mediumLabelFont!,
                                                                //NSAttributedString.Key.foregroundColor: Theme.regularLabelColor!], for: .normal)
        }
        
        if let backButton = backButton {
            navItem.leftBarButtonItem = backButton
        }

        if let leftButton = leftBarItem {
            navItem.leftBarButtonItem = leftButton
        }
        
        if let backButton = backButton, let leftBarButton = leftBarItem {
            navItem.leftBarButtonItem = nil
            navItem.leftBarButtonItems = [backButton, leftBarButton]
        }
        
        navigationBar.setItems([navItem], animated: false)
        
    }
    
    func getLeftButton(image: String?, title: String?) -> UIBarButtonItem {
        
        let backbutton = UIButton(type: .custom)
        if let image = image {
            backbutton.setImage(UIImage(named: image), for: .normal)
        }
        if let title = title {
            backbutton.setTitle(title, for: .normal)
        }
       // backbutton.setTitleColor(Theme.regularLabelColor, for: .normal)
       // backbutton.titleLabel?.font = Theme.mediumLabelFont
        backbutton.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
        return UIBarButtonItem(customView: backbutton)
    }
    
    func getRightButtonFirst(image: String?, title: String?) -> UIBarButtonItem {
        
        let backbutton = UIButton(type: .custom)
        if let image = image {
            backbutton.setImage(UIImage(named: image), for: .normal)
        }
        if let title = title {
            backbutton.setTitle(title, for: .normal)
        }
       // backbutton.setTitleColor(Theme.regularLabelColor, for: .normal)
      //  backbutton.titleLabel?.font = Theme.mediumLabelFont
        backbutton.addTarget(self, action: #selector(firstRightButtonAction), for: .touchUpInside)
        return UIBarButtonItem(customView: backbutton)
    }
    
    func getRightButtonSecond(image: String?, title: String?) -> UIBarButtonItem {
        
        let backbutton = UIButton(type: .custom)
        if let image = image {
            backbutton.setImage(UIImage(named: image), for: .normal)
        }
        if let title = title {
            backbutton.setTitle(title, for: .normal)
        }
      //  backbutton.setTitleColor(Theme.regularLabelColor, for: .normal)
      //  backbutton.titleLabel?.font = Theme.mediumLabelFont
        backbutton.addTarget(self, action: #selector(secondRightButtonAction), for: .touchUpInside)
        return UIBarButtonItem(customView: backbutton)
    }
    
    func getBackButton(image: String?, title: String?) -> UIBarButtonItem {
        
        let backbutton = UIButton(type: .custom)
        if let image = image {
            backbutton.setImage(UIImage(named: image), for: .normal)
        }
        if let title = title {
            backbutton.setTitle(title, for: .normal)
        }
      //  backbutton.setTitleColor(Theme.regularLabelColor, for: .normal)
      //  backbutton.titleLabel?.font = Theme.mediumLabelFont
        backbutton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        return UIBarButtonItem(customView: backbutton)
    }
    
    @objc private func firstRightButtonAction() {
        delegate?.didTapFirstRigthButton()
    }
    
    @objc private func secondRightButtonAction() {
        delegate?.didTapSecondRigthButton()
    }
    
    @objc private func leftButtonAction() {
        delegate?.didTapLeftButton()
    }

    
    @objc private func backButtonAction() {
        delegate?.didTapBackButton()
    }
}
#endif
