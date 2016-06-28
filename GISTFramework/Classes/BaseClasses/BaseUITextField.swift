//
//  BaseTextField.swift
//  GISTFramework
//
//  Created by Shoaib Abdul on 14/06/2016.
//  Copyright © 2016 Social Cubix. All rights reserved.
//

import UIKit

public class BaseUITextField: UITextField, BaseView {
   
    @IBInspectable public var bgColorStyle:String! = nil;
    
    @IBInspectable public var boarder:Int = 0;
    @IBInspectable public var boarderColorStyle:String! = nil;
    
    @IBInspectable public var cornerRadius:Int = 0;
    
    @IBInspectable public var rounded:Bool = false;
    
    @IBInspectable public var hasDropShadow:Bool = false;
    
    @IBInspectable public var verticalPadding:CGFloat=0
    @IBInspectable public var horizontalPadding:CGFloat=0
    
    @IBInspectable public var fontStyle:String = "Medium";
    @IBInspectable public var fontColorStyle:String! = nil;
    
    private var _placeholderKey:String?
    override public var placeholder: String? {
        get {
            return super.placeholder;
        }
        
        set {
            if let key:String = newValue where key.hasPrefix("#") == true{
                
                _placeholderKey = key; // holding key for using later
                
                super.placeholder = SyncedText.text(forKey: key);
            } else {
                super.placeholder = newValue;
            }
        }
    } //P.E.
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        //--
        updateView();
    } //F.E.
    
    public func updateView() {
        self.font = UIFont(name: self.font!.fontName, size: UIView.convertFontSizeToRatio(self.font!.pointSize, fontStyle: fontStyle));
        
        if (fontColorStyle != nil) {
            self.textColor = SyncedColors.color(forKey: fontColorStyle);
        }
        
        if (boarder > 0) {
            self.addBorder(SyncedColors.color(forKey: boarderColorStyle), width: boarder)
        }
        
        if (bgColorStyle != nil) {
            self.backgroundColor = SyncedColors.color(forKey: bgColorStyle);
        }
        
        if (cornerRadius != 0) {
            self.addRoundedCorners(UIView.convertToRatio(CGFloat(cornerRadius)));
        }
        
        if(hasDropShadow) {
            self.addDropShadow();
        }
        
        if let placeHoldertxt:String = self.placeholder where placeHoldertxt.hasPrefix("#") == true{
            self.placeholder = placeHoldertxt; // Assigning again to set value from synced data
        } else if _placeholderKey != nil {
            self.placeholder = _placeholderKey;
        }
        
        /*
        if let txt:String = self.text where txt.hasPrefix("#") == true{
            self.text = txt; // Assigning again to set value from synced data
        }
         */
    } //F.E.
    
    override public func layoutSubviews() {
        super.layoutSubviews();
        //--
        if rounded {
            self.addRoundedCorners();
        }
    } //F.E.
    
    override public func textRectForBounds(bounds: CGRect) -> CGRect {
        //??super.textRectForBounds(bounds)
       
        let x:CGFloat = bounds.origin.x + horizontalPadding
        let y:CGFloat = bounds.origin.y + verticalPadding
        let widht:CGFloat = bounds.size.width - (horizontalPadding * 2)
        let height:CGFloat = bounds.size.height - (verticalPadding * 2)
        
        return CGRectMake(x,y,widht,height)
    } //F.E.
    
    override public func editingRectForBounds(bounds: CGRect) -> CGRect {
        super.editingRectForBounds(bounds)
        return self.textRectForBounds(bounds)
    } //F.E.
    
} //CLS END
