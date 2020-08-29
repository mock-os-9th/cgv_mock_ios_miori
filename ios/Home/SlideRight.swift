//
//  SlideRight.swift
//  ios
//
//  Created by miori Lee on 2020/08/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

// UIViewControllerAnimatedTransitioning protocol 쓸거야!
class SlideRight: NSObject, UIViewControllerAnimatedTransitioning {
    
    // 로그인 뷰가 나오면 true, 원래 홈화면이면 false
    var isPresent = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else {return}
        
        let containerView = transitionContext.containerView
        
        // 로그인 뷰 보여질때의 width & height
        let finalWidth = toViewController.view.bounds.width * 0.9
        let finalHeight = toViewController.view.bounds.height
        
        if isPresent {
            // 로그인 뷰가 나와야 하는 경우
            containerView.addSubview(toViewController.view)
            
            toViewController.view.frame = CGRect(x: toViewController.view.bounds.width, y: 0, width: finalWidth, height: finalHeight)
        }
        
        // 오른쪽 -> 왼쪽 으로 슬라이드 애니메이션
        let transform = {
            toViewController.view.transform = CGAffineTransform(translationX: -finalWidth, y: 0)
        }
        
        // dismiss 했을 때 애니메이션
        let identity = {
            fromViewController.view.transform = .identity
        }
        
        // 애니메이션 연결
        //duration 설정
        let duration = transitionDuration(using: transitionContext)
        let isCancel = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.isPresent ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancel)
        }
    
    }

}
