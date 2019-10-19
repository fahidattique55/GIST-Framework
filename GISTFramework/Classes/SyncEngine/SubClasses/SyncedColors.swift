//
//  SyncedColor.swift
//  GISTFramework
//
//  Created by Shoaib Abdul on 14/06/2016.
//  Copyright © 2016 Social Cubix. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

/**
 SyncedColors is a subclass of SyncEngine.
 It handles syncing of application colors.
 */
open class SyncedColors: SyncEngine {
    
    //MARK: - Properties
    
    private static var _sharedInstance: SyncedColors = SyncedColors();
    
    /// A singleton overridden sharedInstance for SyncedColors
    class override var sharedInstance: SyncedColors {
        get {
            return self._sharedInstance;
        }
    }
    
    //MARK: - Methods
    
    /// Retrieves a color for a key from SyncEngine.
    ///
    /// - Parameter key: A Key
    /// - Returns: A color from SyncEngine.
    public class func color(forKey key: String?) -> UIColor? {
        return SyncedColors.sharedInstance.color(forKey: key);
    } //F.E.
    
    func color(forKey key: String?) -> UIColor? {
        if let haxColor:String = super.objectForKey(key) {
            return UIColor(haxColor);
        } else {
            return .white;
        }
        
    } //F.E.
    
} //CLS END
