//
//  DetailMovieViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/15.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

struct MovieDetail {
    var titleKo: [String] = [String]()
    var ageLimit : [String] = [String]()
    var bookingRate: [String] = [String]()
    var image: [String] = [String]()
    var totalAud : [Int] = [Int]()
    var todayAud : [Int] = [Int]()
    var now : [String] = [String]()
    var nowMovie : [String] = [String]()
}

class DetailMovieViewController: BaseViewController {
    
    @IBOutlet weak var detailTV: UITableView!
    
    var movieDetail : MovieDetail = MovieDetail()
    var nowMovie : [String] = [String]()
    
    @IBAction func didTapShowNow(_ sender: UIButton) {
        movieDetail.titleKo = movieDetail.nowMovie
        detailTV.reloadData()
  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // 네비게이션
        //왼쪽 엑스버튼
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<  영화", style: .plain, target: self, action: #selector(backAction))
        //틴트는 검정색
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        //배경은 화이트
        self.navigationController?.navigationBar.barTintColor = .white
        //라인 지우기
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        // 테이블듀 대리자 위임
        detailTV.delegate = self
        detailTV.dataSource = self
        
        // xib 셀 등록
        detailTV.register(UINib(nibName: "DetailMovieTableViewCell", bundle: .main), forCellReuseIdentifier: "DetailMovieTableViewCell")
        
        // 데이터매니저 연결
        DetailMovieDataManager().getMovieInfo(self)
    }
    
    @objc func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
    }
    
    
}


extension DetailMovieViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDetail.titleKo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailMovieTableViewCell", for: indexPath) as! DetailMovieTableViewCell
        
        // 셀 이미지 넣기
        
        // 이미지 등록이 안되어있으면 nonPoster이미지 보여줘
        if  movieDetail.image[indexPath.row] == "none" {
            //print("ok")
            cell.posterImageView.image = UIImage(named: "nonePoster")
        }
            // url string -> image
        else if let posterUrl = NSURL(string: movieDetail.image[indexPath.row]),
            let converImage = NSData(contentsOf: posterUrl as URL) {
            cell.posterImageView.image = UIImage(data: converImage as Data)
        }
        
        
        // 영화 제목
        cell.nameLabel.text = movieDetail.titleKo[indexPath.row]
        
        // 예매율
        cell.percentLabel.text = movieDetail.bookingRate[indexPath.row]
        
        switch movieDetail.ageLimit[indexPath.row] {
        case "전체" :
            cell.ageImageView.image = UIImage(imageLiteralResourceName: "movieageall")
        case "12" :
            cell.ageImageView.image = UIImage(imageLiteralResourceName: "movieage12")
        case "15" :
            cell.ageImageView.image = UIImage(imageLiteralResourceName: "movieage15")
        case "19" :
            cell.ageImageView.image = UIImage(imageLiteralResourceName: "movieage19")
        default:
            print("일치 이미지 없음")
        }
        
        // total Aud
        cell.totalLabel.text = String(movieDetail.totalAud[indexPath.row])
        
        // today Aud
        cell.todayLabel.text = String(movieDetail.todayAud[indexPath.row])
        
        
        return cell
    }
    
    // 셀 클릭 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(EachMovieDetailViewController(), animated: true)
        default:
            return
        }
    }
}
