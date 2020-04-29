//
//  CustomTextFields.swift
//  Lado-E-A
//
//  Created by Eyal Perets on 14/04/2020.
//  Copyright © 2020 myapps. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {


    required init?(coder aDecoder: NSCoder) {

    super.init(coder: aDecoder)
        self.layer.borderColor = UIColor(red: 228 , green: 239, blue: 255).cgColor
        self.layer.borderWidth = 1.5


    }


    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
        }
        override func layoutSubviews() {
    super.layoutSubviews()
    self.layer.cornerRadius = 5.0
    self.layer.masksToBounds = true
    }
    
    }
