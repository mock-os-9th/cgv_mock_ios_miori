//
//  TheaterRMainViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit


class TheaterRMainViewController: BaseViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var timeseatcollecionView: UICollectionView!
    // cell 등록을 위한 선언
    let collecionCell = "moviePosterCell"
    let collecionCell2 = "TimeSeatCollectionViewCell"
  // cell 이미지 데이터
    // 요거는 데이터 모델 테스트 (데이터 모델 했을때  set으로 접근이 되서 어려움 ㅜ)
    //var moviePoster2 : [MoviePosterModel] = [MoviePosterModel(imageURL: "")]
    var moviePoster : [String] = [String]()
    //collecion view 이미지 잘 들어가나 테스트
    
    //    private var moviePoster: [UIImage] {
    //        var moviePoster:[UIImage] = []
    //        for _ in 0...50 {
    //            let image = UIImage(named: "check")!
    //            //print(moviePoster)
    //
    //            moviePoster.append(image)
    //        }
    //        //print(moviePoster.count)
    //        return moviePoster
    //
    //    }
    
    //collection view 등록
    @IBOutlet weak var moviePosterCV: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //TimeSeatCollectionViewCell
        
        //collectionView.reloadData()
        
        
        //포스터 콜렉션 뷰
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "MovieCollectionViewCell")
        
        // 콜렉션뷰 투명하게
        collectionView.backgroundView = nil
        collectionView.backgroundColor = .clear
        
        //영화시간, 좌석 콜렉션뷰
        timeseatcollecionView.delegate = self
        timeseatcollecionView.dataSource = self
        timeseatcollecionView.register(UINib(nibName: "TimeSeatCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "TimeSeatCollectionViewCell")
        
        
        
        // collection view tag 지정
        collectionView.tag = 0
        timeseatcollecionView.tag = 1


        //datamanager 연결
        GetPosterDataManager().getPosterImage(self)
        //collectionView.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        print("view will appear")
        //collectionView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        // GetPosterDataManager().getPosterImage(self)
        print("view Did Appear")

    }
    
    
}

extension TheaterRMainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return moviePoster.count
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell else {
                return MovieCollectionViewCell()
            }
            
            // 이미지 등록이 안되어있으면 nonPoster이미지 보여줘
            if moviePoster[indexPath.row] == "none" {
                //print("ok")
                cell.moviePoster.image = UIImage(named: "nonePoster")
            }
            // url string -> image
            else if let posterUrl = NSURL(string: moviePoster[indexPath.row]),
                let converImage = NSData(contentsOf: posterUrl as URL) {
                cell.moviePoster.image = UIImage(data: converImage as Data)
            }
            
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeSeatCollectionViewCell", for: indexPath) as? TimeSeatCollectionViewCell else {
                return TimeSeatCollectionViewCell()

            }
            //cell.moviePoster.i
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            //print("cell \(indexPath.row) clicked")
            self.present(ReserViewController(), animated: true, completion: nil)
        }
    }
}



