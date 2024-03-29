//
//  HomeViewController.swift
//  ios
//
//  Created by miori Lee on 2020/08/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: BaseViewController, CLLocationManagerDelegate {
    
    var firstAuto : Int = 0
    
    //bottom sheet 기본 호출
    let bottomLauncher = BottomSheetLauncher()
    let bottomLauncherUsingFrames = BottomSheetUsingFrames()
    let sheetVc = SheetViewControllerHome()
    
    //콜렉션 뷰 연결
    @IBOutlet weak var topCollectionView: UICollectionView!
    // 중간 콜렉션 뷰
    @IBOutlet weak var midCollectionView: UICollectionView!
    // 콜렉션 뷰 이미지 배열
    var topImageArr : [String] = ["top1","top2","top3","top4"]
    
    //미드 콜렉션뷰 배열들
    var midImageArr : [String] = [String]()
    var midMovieName : [String] = [String]()
    var midPercent : [String] = [String]()
    
    //    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var reserChartLabel: UILabel!
    // 세그먼트 컨트롤
    @IBOutlet weak var segmnetCtrl: UISegmentedControl!
    
    let logInDrawer = LogInMenuViewController(nibName: "LogInViewController", bundle: nil)
    let transition = SlideRight()
    
    // 위치정보 받아오기
    var locationManager : CLLocationManager!
    
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
        
        
        // 콜렉션뷰
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        topCollectionView.register(UINib(nibName: "TopImageCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "TopImageCollectionViewCell")
        
        // 콜렉션뷰 배경 투명하게
        topCollectionView.backgroundView = nil
        topCollectionView.backgroundColor = .clear
        
        // 콜렉션뷰
        midCollectionView.delegate = self
        midCollectionView.dataSource = self
        midCollectionView.register(UINib(nibName: "ChartCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ChartCollectionViewCell")
        
        // 콜렉션뷰 배경 투명하게
        midCollectionView.backgroundView = nil
        midCollectionView.backgroundColor = .clear
        
        // 콜렉션뷰 tag
        topCollectionView.tag = 0
        midCollectionView.tag = 1
        
        // 데이터메니저 연결
        HomeDataManager().getMovieInfo(self)
        
        // 위치정보 받아오기
        locationManager = CLLocationManager()
        locationManager.delegate = self
        // 포그라운드일때 위치권한요청
        locationManager.requestWhenInUseAuthorization()
        // 배터리에 맞게 권장 되는 최적 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 업데이트
        locationManager.startUpdatingLocation()
        // 위,경도 갖고오기
        let location = locationManager.location?.coordinate
        let latitude = location?.latitude
        let longitude = location?.longitude
        
        
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        //navibar 숨기기
        //복구가 안될때는 : 뷰의 top을 superview로 맞춰주고 constant는 0으로
        self.navigationController?.hidesBarsOnSwipe = true
        
        
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
        
        //        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        //        //위치지정  x위치
        //        mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor
        //            ,constant: 0).isActive = true // ---- 1
        //
        //        mainScrollView.heightAnchor.constraint(equalToConstant: 896)
        //            .isActive = true // ---- 3
        //        mainScrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        //            .isActive = true // ---- 4
        //
        
        let ud = UserDefaults.standard
        
        if let jwt = ud.string(forKey: "x-access-token") {
            //customInputView.isHidden = false
            self.firstAuto += 1
            if self.firstAuto == 1 {
                self.presentAlert(title: "자동로그인", message: "미오리님 환영합니다")
            }
        } else {
        }
        
        // 라벨 언더라인
        let labelString = "#예매차트"
        //let textColor: UIColor = .blue
        let underLineColor: UIColor = .systemPink
        let underLineStyle = NSUnderlineStyle.single.rawValue + 5
        
        let labelAtributes:[NSAttributedString.Key : Any]  = [
            //NSAttributedStringKey.foregroundColor: textColor,
            NSAttributedString.Key.underlineStyle: underLineStyle,
            NSAttributedString.Key.underlineColor: underLineColor
        ]
        
        let underlineAttributedString = NSAttributedString(string: labelString,
                                                           attributes: labelAtributes)
        
        reserChartLabel.attributedText = underlineAttributedString
        
        //segment 글자 크기
        let font: [AnyHashable : Any] = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]
        segmnetCtrl.setTitleTextAttributes(font as! [NSAttributedString.Key : Any], for: .normal)
        
        
        
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

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return topImageArr.count
        } else {
            return midImageArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageCollectionViewCell", for: indexPath) as? TopImageCollectionViewCell else {
                return TopImageCollectionViewCell()
            }
            cell.imageCell.image = UIImage(named: topImageArr[indexPath.row])
            return cell
        } else {
            //ndexPath.row = 0
            //print(indexPath.row)
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChartCollectionViewCell", for: indexPath) as? ChartCollectionViewCell else {
                return ChartCollectionViewCell()
            }
            
            // 이미지 등록이 안되어있으면 nonPoster이미지 보여줘
            if  midImageArr[indexPath.row] == "none" {
                //print("ok")
                cell.posterImage.image = UIImage(named: "nonePoster")
            }
                // url string -> image
            else if let posterUrl = NSURL(string: midImageArr[indexPath.row]),
                let converImage = NSData(contentsOf: posterUrl as URL) {
                cell.posterImage.image = UIImage(data: converImage as Data)
            }
            
            cell.movieName.text = midMovieName[indexPath.row]
            cell.reserPercent.text = midPercent[indexPath.row]
            
            
            return cell
        }
    }
    
    
    
}
