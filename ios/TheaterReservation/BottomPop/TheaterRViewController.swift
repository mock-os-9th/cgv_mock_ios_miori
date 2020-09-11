//
//  TheaterRViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

// 1. table view protocol 을 채택할게
class TheaterRViewController: BaseViewController {
    
    @IBOutlet weak var bigCity: UITableView!
    @IBOutlet weak var smallCity: UITableView!
    
    @IBOutlet weak var selectCV: UICollectionView!
    
    @IBOutlet weak var selectzoneView: UIView!
    @IBOutlet weak var selectBtn: UIButton!
    @IBAction func selectTheater(_ sender: UIButton) {
        print("hello")
    }
    var bigCityArr = ["서울(29)","경기(50)","인천(9)","강원(3)","대전/충청(20)","대구(8)","부산/울산(15)","경상(15)","광주/전라/제주(23)"]
    var smallCityArr = ["강남","강변","건대입구","구로","대학로","동대문","등촌","명동","목동","미아","불광","상봉","성신여대입구","송파","수유","신촌아트레온","씨네드쉐프 용산"]
    
    var selectSmallCityArr : [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // 테이블뷰 대리자 위임
        bigCity.delegate = self
        bigCity.dataSource = self
        smallCity.delegate = self
        smallCity.dataSource = self
        
        //tag지정
        bigCity.tag = 0
        smallCity.tag = 1
        
        // 테이블 뷰에 xib 등록
        let nibName = UINib(nibName: "TheaterTableViewCell", bundle: nil)
        bigCity.register(nibName, forCellReuseIdentifier: "TheaterTableViewCell")
        
        let nibName2 = UINib(nibName: "TheaterTableViewCell", bundle: nil)
        smallCity.register(nibName2, forCellReuseIdentifier: "TheaterTableViewCell")
        
        
        // 콜렉션뷰 대리자 위임
        selectCV.delegate = self
        selectCV.dataSource = self
        selectCV.register(UINib(nibName : "SelectedCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "SelectedCollectionViewCell")
        
        selectzoneView.isHidden = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
    }
    
}

extension TheaterRViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return bigCityArr.count
        } else {
            return smallCityArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TheaterTableViewCell", for: indexPath) as! TheaterTableViewCell
            if indexPath.row < 1{
                cell.locationLabel.text = bigCityArr[indexPath.row]
                
            } else {
                cell.locationLabel.text = bigCityArr[indexPath.row]
                if #available(iOS 13.0, *) {
                    cell.backgroundColor = UIColor.systemGray5
                } else {
                    // Fallback on earlier versions
                }
            }
            return cell
            
            
            
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TheaterTableViewCell", for: indexPath) as! TheaterTableViewCell
            cell.locationLabel.text = smallCityArr[indexPath.row]
            return cell
            
            
        }
    }
    
    //테이블 뷰 셀 눌렀을 때 함수
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath)!
        if #available(iOS 13.0, *) {
            selectzoneView.isHidden = false
            cell.contentView.backgroundColor = UIColor.systemGray4
            selectSmallCityArr.append(smallCityArr[indexPath.row])
            //칼라 팔레트 템플릿 이용
            selectBtn.backgroundColor = UIColor(hex: ColorPalette.cgvTabColor, alpha: 1.0)
        } else {
            // Fallback on earlier versions
        }
        // 콜렉션뷰 데이터 리로드
        // 이거 해줘야 데이터 갱신됨
        //print("tv : \(selectSmallCityArr)")
        selectCV.reloadData()
    }
    
}

extension TheaterRViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectSmallCityArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedCollectionViewCell", for: indexPath) as? SelectedCollectionViewCell else {
            return SelectedCollectionViewCell()
        }
        print("check : \(selectSmallCityArr[indexPath.row])")
        cell.theaterName.titleLabel?.text = selectSmallCityArr[indexPath.row]
        return cell
    }
    
    
}

