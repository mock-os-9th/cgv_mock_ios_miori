//
//  KakaopayViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/10.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

/*
 웹뷰 띄우기
 - 1. info.plist 에서 Allow Arbitrary Loads : YES 로
 - 2. 프레임워크로 webkit 프레임워크 추가해주기
 - 3. import webkit
 */

import UIKit
import WebKit

class KakaopayViewController: UIViewController {
    
    @IBOutlet weak var wvc: WKWebView!
    
    func goWeb() -> () {
        // 통신결과 redirect mobile url 링크 넣어주며됨.
        // 하드코딩 결과 성공.
        
        let url = URL(string: "url 링크 들어가면됨")
        let request = URLRequest(url: url!)
        wvc.load(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goWeb()
        // Do any additional setup after loading the view.
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
