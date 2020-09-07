//
//  HomeViewController.swift
//  ios
//
//  Created by miori Lee on 2020/08/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //bottom sheet 기본 호출
    let bottomLauncher = BottomSheetLauncher()
    let bottomLauncherUsingFrames = BottomSheetUsingFrames()
    let sheetVc = SheetViewControllerHome()
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    let logInDrawer = LogInMenuViewController(nibName: "LogInViewController", bundle: nil)
    let transition = SlideRight()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //self.navigationItem.title = "CGV"
        
        // CGV 버튼 생성
        let cgv_logo_btn = UIButton(type: .custom)
        // 버튼 이미지 생성
        cgv_logo_btn.setImage(UIImage(named: "cgv_logo.png"), for: .normal)
        // didTap 함수
        cgv_logo_btn.addTarget(self, action: #selector(cgvlogoDidTap), for: .touchUpInside)
        // frame 생성
        cgv_logo_btn.frame = CGRect(x: 0, y: 0, width: 53, height: 53)

        // bar button 연결
        let barButton = UIBarButtonItem(customView: cgv_logo_btn)
        // navigation의 왼쪽에 bar button을 넣어
        self.navigationItem.leftBarButtonItem = barButton
        
        // login 버튼 생성
         let login_btn = UIButton(type: .custom)
         // 버튼 이미지 생성
         login_btn.setImage(UIImage(named: "menu_3l.png"), for: .normal)
         // didTap 함수
         login_btn.addTarget(self, action: #selector(loginlogoDidTap), for: .touchUpInside)
         // frame 생성
         login_btn.frame = CGRect(x: 0, y: 0, width: 53, height: 53)

         // bar button 연결
         let barButton2 = UIBarButtonItem(customView: login_btn)
         // navigation의 왼쪽에 bar button을 넣어
         self.navigationItem.rightBarButtonItem = barButton2
        
        //Dispatch Queue를 이용해 bottom sheet 1초 후에 띄우기
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            //print("hello")
            self.sheetVc.view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(self.sheetVc.view)
            
            NSLayoutConstraint.activate([
                self.sheetVc.view.topAnchor.constraint(equalTo: self.view.topAnchor),
                self.sheetVc.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.sheetVc.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                self.sheetVc.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            ])
        }
        
    }
    //This method will call when you press button.
    @objc func cgvlogoDidTap() {
        print("cgv logo clicked")
    }
    
    // 메뉴버튼 클릭시 로그인 뷰 (navigation drawer) 나오게 하는 함수
    @objc func loginlogoDidTap() {
        let logInModal = LogInMenuViewController() //템플릿
        //full screen으로
        //logInModal.modalPresentationStyle = .fullScreen
        logInModal.modalPresentationStyle = .overCurrentContext
        logInModal.transitioningDelegate = self
        
        self.present(logInModal, animated: true, completion: nil)
     }
    
    override func viewDidAppear(_ animated: Bool) { //바꾸기
        super.viewDidAppear(false)
        
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        //위치지정  x위치
        mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor
            ,constant: 0).isActive = true // ---- 1
        
        mainScrollView.heightAnchor.constraint(equalToConstant: 896)
            .isActive = true // ---- 3
        mainScrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
            .isActive = true // ---- 4
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension HomeViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresent = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresent = false
        return transition
    }
}
