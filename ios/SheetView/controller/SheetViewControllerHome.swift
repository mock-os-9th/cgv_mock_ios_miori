//
//  SheetViewControllerHome.swift
//  ios
//
//  Created by miori Lee on 2020/09/07.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

//
//  SheetViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SheetViewControllerHome: UIViewController {
    
    let containerVC:ContainerHomeViewController = {
        let vc = ContainerHomeViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    
    let notchVC:NotchViewController = {
        let vc = NotchViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    
    let blurredEffectView:UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurredEffectView
    }()
    
    var heightConstraint:NSLayoutConstraint!
    var notchBottomConstraint:NSLayoutConstraint!
    
    public fileprivate(set) var blackOverlay: UIControl = UIControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Also add Blur effect View
        setupBlurView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //setup containerView ( this view contains the place holder for the notch )
        setupContainerView()
    }
    
    func setupBlurView() {
        view.addSubview(blurredEffectView)
        
        NSLayoutConstraint.activate([
            blurredEffectView.topAnchor.constraint(equalTo: self.view.topAnchor),
            blurredEffectView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            blurredEffectView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            blurredEffectView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func setupContainerView() {
        
        //setup pullbar view ( small notch and setting contraints to it )
        [containerVC,notchVC].forEach { (viewController) in
            self.view.addSubview(viewController.view)
        }
        
        heightConstraint =  containerVC.view.heightAnchor.constraint(equalToConstant: 0)
        notchBottomConstraint = notchVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            containerVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            containerVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            containerVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            heightConstraint,
            
            notchVC.view.heightAnchor.constraint(equalToConstant: 20),
            notchVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            notchVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            notchBottomConstraint
        ])
        
        //setup childViewController ( this view is the bottom sheet )
        [containerVC, notchVC].forEach { (viewController) in
            self.add(viewController)
        }
        
        let screenSize = UIScreen.main.bounds
        //올라오는 높이
        let heightValue = screenSize.size.height * 0.8
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.notchBottomConstraint.constant = -heightValue
            self.heightConstraint.constant =  heightValue
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //deactivate constraints
        heightConstraint.isActive = false
        notchBottomConstraint.isActive = false
        
        //remove from super view
        //다시 원래 상태로 돌아와
        self.view.removeFromSuperview()
    }
}

