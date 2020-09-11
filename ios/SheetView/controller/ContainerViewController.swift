//
//  ContainerViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Foundation
import Tabman
import Pageboy

class ContainerViewController:  TabmanViewController{
    
    private var viewControllers = [ TheaterRViewController(),UIViewController()]
    
//    let button: UIButton = {
//        let button = UIButton(type: UIButton.ButtonType.infoDark)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        //button.addTarget(self, action: #selector(showTransparent(_:)), for: UIControl.Event.touchUpInside)
//        return button
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.cornerRadius = 8.0
        self.view.backgroundColor = UIColor.white
        
        //탭 바 구현
        self.dataSource = self
        
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        // bar blur 처리 안하게 하기 위해 clear 선언
        bar.backgroundView.style = .clear
        // 배경색
        bar.backgroundColor = .systemPink
        
        
        
        // Customize button color
        bar.buttons.customize { (button) in
            //글자색이랑 눌렀을때 바뀌는 색
            button.tintColor = .white
            button.selectedTintColor = .white
        }
        //인디케이터 색
        bar.indicator.tintColor = .white
        
        addBar(bar, dataSource: self, at: .top)
        
        
//        self.view.addSubview(button)
//
//        NSLayoutConstraint.activate([
//            self.button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            self.button.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            self.button.widthAnchor.constraint(equalToConstant: 20),
//            self.button.heightAnchor.constraint(equalToConstant: 20)
//        ])
    }
    
    
}

extension ContainerViewController: PageboyViewControllerDataSource, TMBarDataSource {
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
            return TMBarItem(title: "  지역별")
        case 1:
            return TMBarItem(title: "특별관")
            
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
}

