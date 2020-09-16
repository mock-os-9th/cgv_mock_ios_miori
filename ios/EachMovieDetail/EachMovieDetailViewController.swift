//
//  EachMovieDetailViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

var headerViewMaxHeight : CGFloat = 60
//headerViewMinHeight
let headerViewMinHeight : CGFloat = UIApplication.shared.statusBarFrame.size.height + 44 //navigation hieght : 44

class EachMovieDetailViewController: UIViewController {
    
    @IBOutlet weak var menuTabCV: UICollectionView!
    
    @IBOutlet weak var scrollTop: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stickyHeaderView: UIView!
    @IBOutlet weak var tabBarCollectionView: UICollectionView!
    @IBOutlet weak var bottomView: UIView!

    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        // Do any additional setup after loading the view.
        //menuTabCV.dataSource = self
        //menuTabCV.delegate = self
    }
    
    
    
}

//extension EachMovieDetailViewController : UICollectionViewDelegate, UICollectionViewDataSource {
//
//    // cell 사이즈
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//           let width = view.frame.width / 3
//           return CGSize(width: width, height: 44)
//       }
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}



// MARK: - UIScrollViewDelegate
extension EachMovieDetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 얼마나 스크롤 함? 을 알기위함
        let y : CGFloat = scrollView.contentOffset.y
        
        let newHeaderViewHeight : CGFloat = headerViewHeightConstraint.constant-y + 424
        
        if newHeaderViewHeight == 60.5 {
            print("= \(newHeaderViewHeight)")
            headerViewHeightConstraint.constant = newHeaderViewHeight
            scrollView.contentOffset.y = 424 // 스크롤 뷰 차단
        }else if newHeaderViewHeight > headerViewMaxHeight {
             scrollTop.constant = 0
            print("> \(newHeaderViewHeight)")
            headerViewHeightConstraint.constant = headerViewMaxHeight
        } else if newHeaderViewHeight < headerViewMinHeight {
            //scrollView.contentOffset.y = 424
            scrollTop.constant = 60.5
            print("< \(newHeaderViewHeight)")
            headerViewHeightConstraint.constant = headerViewMinHeight
        }
        
    }
}

