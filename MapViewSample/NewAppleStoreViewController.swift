//
//  NewAppleStoreViewController.swift
//  MapViewSample
//
//  Created by School on 15/11/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import UIKit
import CoreLocation

public protocol NewAppleStoreViewControllerDelegate : class {
    
    func newAppleStoreViewControllerDelegate(_
        newAppleStoreViewController: NewAppleStoreViewController,
        didCreateStore store: Store)
}


public class NewAppleStoreViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    
    @IBOutlet weak var longitudeTextField: UITextField!
    
    @IBOutlet weak var latitudeTextField: UITextField!
    
    public weak var delegate : NewAppleStoreViewControllerDelegate?
    

    public override func viewDidLoad() {
        super.viewDidLoad()
       self.title =  NSLocalizedString("controllers.new_apple.title", comment: "")
        
        self.titleLabel.placeholder = NSLocalizedString("controllers.new_apple.editText.title", comment: "")
        
        self.titleLabel.delegate = self
        self.latitudeTextField.delegate = self
        self.longitudeTextField.delegate = self

        
        self.navigationItem.leftBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeViewController))
        
        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(submitAppStore))
        }

    @objc public func closeViewController(){
        self.dismiss(animated: true)
    }
    
    
    @objc public func submitAppStore(){
        guard
            let title = self.titleLabel.text,
            title.count > 0,
            let latString = self.longitudeTextField.text,
            let lat  = Double(latString),
            let longString = self.latitudeTextField.text,
            let long = Double(longString) else {
            let alert =  UIAlertController(title:
                    NSLocalizedString("app.vocabulary.error.title", comment: ""),
                                  message : NSLocalizedString("app.vocabulary.error.error_message", comment: ""),
                                  preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("app.vocabulary.error.close", comment: ""), style: .cancel))
                
            self.present(alert, animated: true)
            
            return
        }
        
        let store = Store(
            name: title, coordinate: CLLocationCoordinate2D(
                latitude: lat,
                longitude: long))
    
        self.delegate?.newAppleStoreViewControllerDelegate(self, didCreateStore: store)
    }
    
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
}

extension NewAppleStoreViewController : UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
