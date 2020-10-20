//
//  Extentions.swift
//  FireBaseTests
//
//  Created by Аня Голубева on 20.10.2020.
//  Copyright © 2020 Аня Голубева. All rights reserved.
//

import UIKit

extension UIView {
    
    public var width: CGFloat{
    return frame.size.width
    }
    public var hight: CGFloat{
    return frame.size.height
    }
    public var top: CGFloat{
        return frame.origin.y
    }
    public var bottom: CGFloat{
        return frame.origin.y + frame.size.height
    }
    public var left: CGFloat{
        return frame.origin.x
    }
    public var right: CGFloat{
        return frame.origin.x + frame.size.width
    }
}
