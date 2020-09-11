//
//  SelectMovieViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/11.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SelectMovieViewController: BaseViewController {
    
    @IBOutlet weak var posterCV: UICollectionView!
    
    var posterArr : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        posterCV.delegate = self
        posterCV.dataSource = self
        
        posterCV.register(UINib(nibName: "SelectPosterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectPosterCollectionViewCell")
        
        //데이터 매니저 연결
        PosterResetDataManager().getMoviePoster(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
    }
    
    
}

extension SelectMovieViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posterArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectPosterCollectionViewCell", for: indexPath) as? SelectPosterCollectionViewCell else {
            return SelectPosterCollectionViewCell()
        }
        
        // 이미지 등록이 안되어있으면 nonPoster이미지 보여줘
        if  posterArr[indexPath.row] == "none" {
            //print("ok")
            cell.posterImg.image = UIImage(named: "nonePoster")
        }
            // url string -> image
        else if let posterUrl = NSURL(string: posterArr[indexPath.row]),
            let converImage = NSData(contentsOf: posterUrl as URL) {
            cell.posterImg.image = UIImage(data: converImage as Data)
        }
        
       
        return cell
    }
    
    
}
