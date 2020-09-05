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
    
    
    /*
     Picker view tag
     - 0 : big City
     - 1 : small City
     */
    
    // 하나의 PickerView 안에 몇 개의 선택 가능한 리스트 표시가능한지
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //PickerView에 표시될 항목의 개수를 반환하는 메서드
    //여기서는 우리가 보여주기로 결정한 fruits 리스트의 길이를 반환
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //if pickerView == bigCtiyPicker {
        if pickerView.tag == 0 {
        return bigCity.count
        } else {
            return smallCity.count
        }
    }
    
    //PickerView 내에서 특정한 위치(row)를 가리키게 될 때, 그 위치에 해당하는 문자열을 반환하는 메서드
    //여기서는 fruits의 row 번째 문자열을 반환
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //if pickerView == bigCtiyPicker {
        if pickerView.tag == 0 {
        return bigCity[row]
        } else {
            return smallCity[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //if pickerView == bigCtiyPicker {
        if pickerView.tag == 0 {
        print(bigCity[row])
        } else {
            print(smallCity[row])
        }
    }
    
    var bigCity = ["서울","경기","인천","강원","대전/충청","대구"]
    var smallCity = ["강남","강변","건대입구","구로","대학로","동대문","등촌","명동"]
    
    @IBOutlet weak var bigCtiyPicker: UIPickerView!
    @IBOutlet weak var smallCityPicker: UIPickerView!
    //    private var viewControllers = [ UIViewController(),UIViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2. protocol 준수하면서 나 대신 일할 애를 뽑을 건데 그건 self 그니까 vc 나야!
        bigCtiyPicker.dataSource = self
        bigCtiyPicker.delegate = self
        
        smallCityPicker.dataSource = self
        smallCityPicker.delegate = self
        
        //picker 간 tag 지정
        bigCtiyPicker.tag = 0
        smallCityPicker.tag = 1
        
        
        
    }
}

