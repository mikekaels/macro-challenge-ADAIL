//
//  SwiftUIRouterAdapter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 11/11/21.
//

import Foundation
import UIKit
import SwiftUI

#if DEBUG

@available(iOS 13.0, *)
public struct SwiftUIRouterAdapter {
    final class Weak<T> {
        var value: T?
    }
    private let vc: Weak<UIViewController>
    
    public init(vc: UIViewController = ViewController()) {
        self.vc = .init()
        self.vc.value = vc
    }
    
    @available(*, deprecated, message: "How 'bout use custom viewController to force ContentView to perform navigation?")
    
    public func show(completion: @escaping (UIViewController) -> Void) -> some View {
        completion(vc.value!)
        let vcToPresent = vc.value!.presentedViewController!
        vc.value = nil
        return vcToPresent.preview()
    }
    
    public final class ViewController: UIViewController {
        fileprivate var vcToPresent: UIViewController?
        fileprivate var routerAdapter: SwiftUIRouterAdapter!
        
        public override var presentedViewController: UIViewController? {
            return vcToPresent
        }
        
        public override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
            vcToPresent = viewControllerToPresent
        }
        
        deinit {
            print("DEINIT", self)
        }
    }
}
#endif
