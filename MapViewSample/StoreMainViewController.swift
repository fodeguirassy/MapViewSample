//
//  StoreMainViewController.swift
//  MapViewSample
//
//  Created by School on 16/11/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import UIKit

class StoreMainViewController: UIViewController, StoreProvider {
    
    @IBOutlet weak var childContentView: UIView!
    
    var stores: [Store] = []

    lazy var listViewController: StoreListViewController = {
        let listViewController = StoreListViewController()
        listViewController.storeProvider = self
        return listViewController
    }()
    
    lazy var mapViewController : MapViewController = {
        let mapViewController = MapViewController()
        mapViewController.storeProvider  = self
        return mapViewController
    }()
    
    
    public var visibleViewController : UIViewController {
        if self.mapViewController.view.window != nil
        {
            return self.mapViewController
        }
        return self.listViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewController(self.mapViewController, in: childContentView)
    }

    @IBAction func touchSwitchChildViews(_ sender: Any) {
        UIView.beginAnimations("flip_animation", context: nil)
        UIView.setAnimationTransition(.flipFromRight, for: self.childContentView, cache: false)
        UIView.setAnimationDuration(3)
        
        let visibleViewController = self.visibleViewController
        
        self.removeChildViewController(visibleViewController)
        if(visibleViewController == self.mapViewController){
            self.addChildViewController(self.listViewController, in: self.childContentView)
        }else{
            self.addChildViewController(self.mapViewController, in: self.childContentView)
        }
        
        UIView.commitAnimations()
    }
    
    @IBAction func touchNewAppleStore(_ sender: Any) {
        let newAppleStore = NewAppleStoreViewController()
        newAppleStore.delegate = self
        
        self.present(PortraitNavigationController(rootViewController: newAppleStore), animated: true)
        
    }
}

extension StoreMainViewController : NewAppleStoreViewControllerDelegate {
    func newAppleStoreViewControllerDelegate(_ newAppleStoreViewController: NewAppleStoreViewController, didCreateStore store: Store) {
        newAppleStoreViewController.dismiss(animated: true) {
            self.stores.append(store)
        }
    }
}









