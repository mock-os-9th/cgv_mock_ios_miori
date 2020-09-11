//
//  TopTapViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/08.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class TopTapViewController: TabmanViewController {
    
    
    //bottom sheet 기본 호출
    let bottomLauncher = BottomSheetLauncher()
    let bottomLauncherUsingFrames = BottomSheetUsingFrames()
    let sheetVc = SheetViewController()
    
    @IBOutlet weak var xBtn: UIButton!
    @IBAction func didTap(_ sender: UIButton) {
        //print("hello")
        self.dismiss(animated: false, completion: nil)
    }
    @IBOutlet weak var xView: UIView!
    
    private var viewControllers = [TheaterRMainViewController(), UIViewController(),UIViewController()]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        // bar blur 처리 안하게 하기 위해 clear 선언
        bar.backgroundView.style = .clear
        // 배경색
        bar.backgroundColor = UIColor(hex: 0xe04448, alpha: 1)
        
        
        
        // Customize button colorr
        bar.buttons.customize { (button) in
            //글자색이랑 눌렀을때 바뀌는 색
            button.tintColor = .white
            button.selectedTintColor = .white
        }
        //인디케이터 색
        bar.indicator.tintColor = .white
        
        bar.addSubview(xView)
        bar.addSubview(xBtn)
        let constraints = [
            //xView.centerXAnchor.constraint(equalTo: bar.centerXAnchor),
            xBtn.centerYAnchor.constraint(equalTo: bar.centerYAnchor),
            xBtn.rightAnchor.constraint(equalTo: bar.rightAnchor, constant: -20)
            // xView.widthAnchor.constraint(equalToConstant: 100),
            //xView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        
        view.bringSubviewToFront(xBtn)
        
        
        addBar(bar, dataSource: self, at: .top)
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        
    }
    
    
    
    
    
}

extension TopTapViewController: PageboyViewControllerDataSource, TMBarDataSource {
    //뷰컨트롤러 만큼 반환해줄거야
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        //        let title = "Page \(index)"
        //        return TMBarItem(title: title)
        //여기는 탭바에 보일 단어들
        
        switch index {
        case 0:
            return TMBarItem(title: "  영화별예매")
        case 1:
            return TMBarItem(title: "극장별예매")
        case 2:
            return TMBarItem(title: "비교예매")
            
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
}

