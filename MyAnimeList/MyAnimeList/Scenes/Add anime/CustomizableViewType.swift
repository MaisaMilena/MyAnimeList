//
//  CustomizableViewType.swift
//  MyAnimeList
//
//  Created by Maisa on 09/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

protocol CustomizableViewType {
    #if swift(>=4.0)
    associatedtype CustomViewType where CustomViewType: UIView
    #else
    associatedtype CustomViewType
    #endif

    var view: UIView! { get set }
    var viewIfLoaded: UIView? { get }
    
    var cView: CustomViewType { get }
    var cViewIfLoaded: CustomViewType? { get }
}

extension CustomizableViewType {
    var cView: CustomViewType {
        get {
            assert(view is CustomViewType, castAssertMessage)
            return view as! CustomViewType
        }
        set {
            #if swift(>=4.0)
                view = newValue
            #else
                view = newValue as! UIView
            #endif
        }
    }
    var cViewIfLoaded: CustomViewType? {
        if let viewIfLoaded = viewIfLoaded {
            assert(viewIfLoaded is CustomViewType, castAssertMessage)
            return .some(viewIfLoaded as! CustomViewType)
        }
        else {
            return nil
        }
    }
    
    private var castAssertMessage: String {
        return "Can't cast view to \(CustomViewType.self) type. The view's instance is not of that type. Check the view's class setting in storyboard or xib for \(type(of: self))"
    }
}

