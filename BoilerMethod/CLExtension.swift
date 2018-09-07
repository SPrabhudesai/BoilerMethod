//
//  CLExtension.swift
//  BoilerMethod
//
//  Created by shailesh on 16/08/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController{
    //@IBInspectable var hideOnTap:Bool{
        var hindOnTapped:Bool{
            set{
                
                if newValue == true{
                    let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dissmessKeyBord))
                    tap.cancelsTouchesInView = true
                    view.addGestureRecognizer(tap)
                }
            }get{
                return self.hindOnTapped
            }
        }
        @objc func dissmessKeyBord(){
            view.endEditing(true)
        }
        
    
}

extension UIView{
    @IBInspectable var viewBorderRadius:CGFloat{
        set{
           self.layer.borderWidth = newValue
        }get{
            return self.viewBorderRadius
        }
    }
    @IBInspectable var viewBorderColor:UIColor{
        set{
            self.layer.borderColor = newValue.cgColor
        }get{
            return self.viewBorderColor
        }
    }
    @IBInspectable var viewCornerRadius:CGFloat{
        set{
           self.layer.cornerRadius = newValue
        }get{
            return self.viewBorderRadius
        }
    }
}
extension UITextField{
    
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
    
}

