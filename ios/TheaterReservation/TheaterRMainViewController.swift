//
//  TheaterRMainViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit




class TheaterRMainViewController: BaseViewController {
    
    
    //bottom sheet 기본 호출
    let bottomLauncher = BottomSheetLauncher()
    let bottomLauncherUsingFrames = BottomSheetUsingFrames()
    let sheetVc = SheetViewController()
    
    @IBOutlet weak var collectionView: UICollectionView!
    // cell 등록을 위한 선언
    let collecionCell = "moviePosterCell"
    
    // cell 이미지
    var moviePoster : [String] = ["https://ssl.pstatic.net/imgmovie/mdi/mit110/1900/190010_P02_162156.jpg",
                                  "https://ssl.pstatic.net/imgmovie/mdi/mit110/1890/189069_P23_111151.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1822/182234_P49_102023.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1837/183772_P08_181006.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/0319/31940_P46_141843.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1870/187051_P13_182257.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1896/189618_P15_163953.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1943/194313_P10_112905.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1937/193799_P13_150412.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1823/182353_P11_135005.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1586/158617_P14_181605.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1896/189623_P07_135856.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1893/189373_P04_104626.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1676/167622_P04_111001.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1889/188909_P22_102659.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/0525/52515_P98_100506.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1859/185917_P28_182718.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1950/195061_P09_101025.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1776/177608_P11_182934.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1783/178351_P22_132611.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1903/190355_P16_100056.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/0103/10323_P04_142631.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1904/190458_P05_102228.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1831/183116_P01_154806.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1664/166415_P07_164358.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/0109/10922_P12_150601.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/0804/80466_P50_105129.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1933/193330_P14_182748.jpg", "none", "none", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1714/171477_P00_142258.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1798/179859_P19_104011.jpg", "none", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1864/186487_P18_160126.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1786/178687_P13_102523.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/0363/36331_P04_173243.jpg", "none", "https://ssl.pstatic.net/imgmovie/mdi/mit110/0136/13636_P25_151053.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1742/174294_P13_155544.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1954/195425_P09_172300.jpg", "none", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1348/134824_P20_164819.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1766/176625_P14_111512.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/0311/31130_P04_150024.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/0150/15006_P17_101432.jpg", "https://ssl.pstatic.net/imgmovie/mdi/mit110/1851/185139_P14_134413.jpg", "none", "https://ssl.pstatic.net/imgmovie/mdi/mit110/0106/10676_P18_111546.jpg", "none"]
    
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
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "MovieCollectionViewCell")
        
        
        //GetPosterDataManager().getPosterImage(self)
        
        
        
        //datamanager 연결
        //let posterInfo = MoviePosterModel(moviePoster: moviePoster)
        //GetPosterDataManager().getPosterImage(self)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        print("vc : \(moviePoster)")
        
    }
    
    
}

extension TheaterRMainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviePoster.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell else {
            return MovieCollectionViewCell()
        }
        
        if let posterUrl = NSURL(string: moviePoster[indexPath.row]),
            let converImage = NSData(contentsOf: posterUrl as URL) {
            cell.moviePoster.image = UIImage(data: converImage as Data)
        }
        return cell
    }
}



