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
    private var moviePoster: [UIImage] {
        var moviePoster:[UIImage] = []
        for i in 0...50 {
            let index = i % 16
            let image = UIImage(named: "check")!
            print(image)
            
            moviePoster.append(image)
        }
        return moviePoster
    }
    
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
        
    }
    
    
}

extension TheaterRMainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell else {
            return MovieCollectionViewCell()
        }
    
        cell.moviePoster.image = moviePoster[indexPath.row]
        return cell
    }
}



