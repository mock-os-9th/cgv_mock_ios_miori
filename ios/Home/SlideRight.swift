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
    
    // 남아있는 검정뷰
    let dismissView = UIView()
    
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
            
            //dismissview 배경과 투명도
            dismissView.backgroundColor = .black
            dismissView.alpha = 0.0
            
            // dismissview 추가
            containerView.addSubview(dismissView)
            
            
            dismissView.frame = containerView.bounds
        
            
            dismissView.frame.size.width = UIScreen.main.bounds.width * 0.1
            dismissView.frame.size.height = UIScreen.main.bounds.height
            
  
            toViewController.view.frame = CGRect(x: toViewController.view.bounds.width, y: 0, width: finalWidth, height: finalHeight)
            //dismsissView.bringSubviewToFront(toViewController.view)
        }
        
        // 오른쪽 -> 왼쪽 으로 슬라이드 애니메이션
        let transform = {
            // dismissView 뿌옇게
            self.dismissView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: -finalWidth, y: 0)
        }
        
        // dismiss 했을 때 애니메이션
        let identity = {
            //dismissView 다시 원상태
            self.dismissView.alpha = 0.0
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
