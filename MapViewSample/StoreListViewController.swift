//
//  StoreListViewController.swift
//  MapViewSample
//
//  Created by School on 16/11/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import UIKit

public class StoreListViewController: UIViewController {

    @IBOutlet weak var storeCollectionView: UICollectionView!
    
    weak var storeProvider: StoreProvider?
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    
        self.storeCollectionView.register(UINib(nibName:"StoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Store")
        
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    public override func viewWillAppear(_ animated: Bool) {
        self.storeCollectionView.reloadData()
    }

}


//CONTROl DRAG & DROP COLLECTION FROM XIB TO FILE AND SELECT DELEGATE & DATASOURCE
extension StoreListViewController : UICollectionViewDataSource {
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.storeProvider?.stores.count ?? 0
    
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let store = self.storeProvider?.stores[indexPath.item] else {
            fatalError("Not possible")
        }
    
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "Store", for: indexPath)
        
        if let storeCell = cell as? StoreCollectionViewCell {
            
            storeCell.latLabel.text = String(store.coordinate.latitude)
            storeCell.longLabel.text = String(store.coordinate.longitude)
            storeCell.titleLabel.text = store.name
        }
                
        return cell
    }
    
}


extension StoreListViewController : UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var screenWidth = collectionView.bounds.width
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            screenWidth -= layout.minimumInteritemSpacing
        }
                return CGSize(width: screenWidth/2, height: screenWidth/2)
    }
    
}





















