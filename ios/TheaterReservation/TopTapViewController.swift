//
//  TopTapViewViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class TopTapViewController: TabmanViewController {
    
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
