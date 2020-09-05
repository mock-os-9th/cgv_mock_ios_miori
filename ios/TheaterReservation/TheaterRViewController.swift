//
//  TheaterRViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

// 1. picker view protocol 을 채택할게
class TheaterRViewController: BaseViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // 하나의 PickerView 안에 몇 개의 선택 가능한 리스트 표시가능한지
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //PickerView에 표시될 항목의 개수를 반환하는 메서드
    //여기서는 우리가 보여주기로 결정한 fruits 리스트의 길이를 반환
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bigCity.count
    }
    
    //PickerView 내에서 특정한 위치(row)를 가리키게 될 때, 그 위치에 해당하는 문자열을 반환하는 메서드
    //여기서는 fruits의 row 번째 문자열을 반환
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bigCity[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(bigCity[row])
    }

    var bigCity = ["서울","경기","인천","강원","대전/충청","대구"]
    @IBOutlet weak var bigCtiyPicker: UIPickerView!
    //    private var viewControllers = [ UIViewController(),UIViewController()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2. protocol 준수하면서 나 대신 일할 애를 뽑을 건데 그건 self 그니까 vc 나야!
        bigCtiyPicker.dataSource = self
        bigCtiyPicker.delegate = self
        
        
//        self.dataSource = self
//
//        // Create bar
//        let bar = TMBar.ButtonBar()
//        bar.layout.transitionStyle = .snap
//        // bar blur 처리 안하게 하기 위해 clear 선언
//        bar.backgroundView.style = .clear
//        // 배경색
//        bar.backgroundColor = .systemPink
//
//
//
//        // Customize button color
//        bar.buttons.customize { (button) in
//            //글자색이랑 눌렀을때 바뀌는 색
//            button.tintColor = .white
//            button.selectedTintColor = .white
//        }
//        //인디케이터 색
//        bar.indicator.tintColor = .white
//
//        addBar(bar, dataSource: self, at: .top)
        

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
//extension TheaterRViewController: PageboyViewControllerDataSource, TMBarDataSource {
//    //뷰컨트롤러 만큼 반환해줄거야
//    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
//        return viewControllers.count
//    }
//
//    func viewController(for pageboyViewController: PageboyViewController,
//                        at index: PageboyViewController.PageIndex) -> UIViewController? {
//        return viewControllers[index]
//    }
//
//    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
//        return nil
//    }
//
//    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
//        //        let title = "Page \(index)"
//        //        return TMBarItem(title: title)
//        //여기는 탭바에 보일 단어들
//
//        switch index {
//        case 0:
//            print("0")
//            return TMBarItem(title: "  지역별")
//        case 1:
//            return TMBarItem(title: "특별관")
//
//        default:
//            let title = "Page \(index)"
//            return TMBarItem(title: title)
//        }
//    }
//}
