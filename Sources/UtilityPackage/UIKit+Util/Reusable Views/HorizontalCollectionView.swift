//
//  HorizontalCollectionView.swift
//  CitoGraphie
//
//  Created by Vaibhav on 21/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit

#if !os(watchOS)
public protocol HorizontalCollectionViewPortocol: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {}

open class HorizontalCollectionView: UIView {
    
    var collectionView:UICollectionView!
    public var reuseIdentifier: String = "ImageCollectionViewCellID" // any dummy id. overriding later on.
    public var reuseIdentifier2: String = ""
    public weak var delegate: AnyObject? {
        willSet {
            collectionView.delegate = newValue as? UICollectionViewDelegate
            collectionView.dataSource = newValue as? UICollectionViewDataSource
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupInitials()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupInitials()
    }
    
    open override class func awakeFromNib() {
        
    }
    
    private func setupInitials() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        self.addSubview(collectionView)
        collectionView.fillSuperview()
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
    }
    
    public func registerNib(with name: String) {
        let nibName = UINib(nibName: name, bundle:nil)
        reuseIdentifier = name + "ID"
        collectionView.register(nibName, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    public func registerNib2(with name: String) {
        let nibName = UINib(nibName: name, bundle:nil)
        reuseIdentifier2 = name + "ID"
        collectionView.register(nibName, forCellWithReuseIdentifier: reuseIdentifier2)
    }
    
    public func reloadData() { collectionView.reloadData() }
}
#endif
