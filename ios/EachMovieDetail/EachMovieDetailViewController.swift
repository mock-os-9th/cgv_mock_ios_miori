//
//  EachMovieDetailViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

/*
 var formatter = DateFormatter()
 formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
 var current_date_string = formatter.string(from: Date())
 print(current_date_string)
 
 출처: https://ppomelo.tistory.com/18 [ppomelo 🍐]
 */
struct MyComment {
    var profileImg : String!
    var uName : String!
    var uCom : String!
    var date : String!
}

protocol SendCommentDelegate {
    func sendComment()
}
var headerViewMaxHeight : CGFloat = 60
//headerViewMinHeight
let headerViewMinHeight : CGFloat = UIApplication.shared.statusBarFrame.size.height + 44 //navigation hieght : 44

class EachMovieDetailViewController: BaseViewController {
    
    var delegate : SendCommentDelegate?
    var sendComment : MyComment = MyComment(profileImg: "", uName: "", uCom: "", date: "")
    /*
     // 키보드 텍스트 필드
     */
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    var customInputView: UIView!
    var sendButton: UIButton!
    var addMediaButtom: UIButton!
    let textField = FlexibleTextView()
    
    override var inputAccessoryView: UIView? {
        
        if customInputView == nil {
            customInputView = CustomView()
            customInputView.backgroundColor = UIColor.groupTableViewBackground
            textField.placeholder = "댓글을 입력하세요."
            textField.font = .systemFont(ofSize: 15)
            textField.layer.cornerRadius = 5
            
            customInputView.autoresizingMask = .flexibleHeight
            
            customInputView.addSubview(textField)
            
            sendButton = UIButton(type: .system)
            sendButton.isEnabled = true
            sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            sendButton.setTitle("등록", for: .normal)
            sendButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            sendButton.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
            customInputView?.addSubview(sendButton)
            
            addMediaButtom = UIButton(type: .custom)
            addMediaButtom.setImage(UIImage(named: "cameraGray"), for: .normal)
            addMediaButtom.isEnabled = true
            //addMediaButtom.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            // addMediaButtom.setTitle("Media", for: .normal)
            addMediaButtom.contentEdgeInsets = UIEdgeInsets(top: 12, left: 0, bottom: 5, right: 0)
            addMediaButtom.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
            customInputView?.addSubview(addMediaButtom)
            
            textField.translatesAutoresizingMaskIntoConstraints = false
            sendButton.translatesAutoresizingMaskIntoConstraints = false
            addMediaButtom.translatesAutoresizingMaskIntoConstraints = false
            sendButton.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: NSLayoutConstraint.Axis.horizontal)
            sendButton.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: NSLayoutConstraint.Axis.horizontal)
            
            addMediaButtom.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: NSLayoutConstraint.Axis.horizontal)
            addMediaButtom.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: NSLayoutConstraint.Axis.horizontal)
            
            textField.maxHeight = 80
            
            addMediaButtom.leadingAnchor.constraint(
                equalTo: customInputView.leadingAnchor,
                constant: 8
            ).isActive = true
            
            addMediaButtom.trailingAnchor.constraint(
                equalTo: textField.leadingAnchor,
                constant: -8
            ).isActive = true
            
            /*  addMediaButtom.topAnchor.constraint(
             equalTo: customInputView.topAnchor,
             constant: 8
             ).isActive = true
             */
            addMediaButtom.bottomAnchor.constraint(
                equalTo: customInputView.layoutMarginsGuide.bottomAnchor,
                constant: -8
            ).isActive = true
            
            textField.trailingAnchor.constraint(
                equalTo: sendButton.leadingAnchor,
                constant: 0
            ).isActive = true
            
            textField.topAnchor.constraint(
                equalTo: customInputView.topAnchor,
                constant: 8
            ).isActive = true
            
            textField.bottomAnchor.constraint(
                equalTo: customInputView.layoutMarginsGuide.bottomAnchor,
                constant: -8
            ).isActive = true
            
            sendButton.leadingAnchor.constraint(
                equalTo: textField.trailingAnchor,
                constant: 0
            ).isActive = true
            
            sendButton.trailingAnchor.constraint(
                equalTo: customInputView.trailingAnchor,
                constant: -8
            ).isActive = true
            
            sendButton.bottomAnchor.constraint(
                equalTo: customInputView.layoutMarginsGuide.bottomAnchor,
                constant: -8
            ).isActive = true
        }
        return customInputView
    }
    
    @objc func handleSend() {
        print("등록눌림")
        
     
        
       
        if let data = textField.text {
            //print("data : \(data)")
            //넘길 내용
            //sendComment.uCom = data
            delegate?.sendComment()
            //dismiss(animated: true, completion: nil)
            self.navigationController?.pushViewController(CommentViewController(), animated: true)
            self.textField.resignFirstResponder()
        }
    }
    
    
    @IBOutlet weak var menuTabCV: UICollectionView!
    
    @IBOutlet weak var scrollTop: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stickyHeaderView: UIView!
    @IBOutlet weak var tabBarCollectionView: UICollectionView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    
    @IBAction func didTapComment(_ sender: UIButton) {
        self.navigationController?.pushViewController(CommentViewController(), animated: true)
    }
    @IBAction func didTapWriteComment(_ sender: UIButton) {
        customInputView.isHidden = false
    }
    // 콜렉션뷰 탭 내용들
    var tabNamearr : [String] = ["관련소식" , "실관람평", "영화정보"]
    var initialOffSet : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        // 콜렉션뷰 델리게이트, 데이터소스
        menuTabCV.dataSource = self
        menuTabCV.delegate = self
        
        // 셀 등록
        menuTabCV.register(UINib(nibName: "DetailMTabCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "DetailMTabCollectionViewCell")
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        customInputView.isHidden = true
    }
    
    
    
}

extension EachMovieDetailViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    // cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 3
        return CGSize(width: width, height: 44)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tabNamearr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailMTabCollectionViewCell", for: indexPath) as? DetailMTabCollectionViewCell else {
            return DetailMTabCollectionViewCell()
        }
        
        cell.tabContent.text = tabNamearr[indexPath.row]
        
        return cell
        
    }
}





// MARK: - UIScrollViewDelegate
extension EachMovieDetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 얼마나 스크롤 함? 을 알기위함
        let y : CGFloat = scrollView.contentOffset.y
        
        let newHeaderViewHeight : CGFloat = headerViewHeightConstraint.constant-y + 424
        
        if newHeaderViewHeight == 60.5 {
            print("= \(newHeaderViewHeight)")
            headerViewHeightConstraint.constant = newHeaderViewHeight
            //scrollView.contentOffset.y = 424 // 스크롤 뷰 차단
        }else if newHeaderViewHeight > headerViewMaxHeight {
            scrollTop.constant = 0
            print("> \(newHeaderViewHeight)")
            headerViewHeightConstraint.constant = headerViewMaxHeight
        } else if newHeaderViewHeight  < headerViewMinHeight {
            scrollView.contentOffset.y = 424
            scrollView.isScrollEnabled = false
            //scrollTop.constant = 70
            print("< \(newHeaderViewHeight)")
            headerViewHeightConstraint.constant = headerViewMinHeight
        }
        
    }
    
    
}

class CustomView: UIView {
    
    // this is needed so that the inputAccesoryView is properly sized from the auto layout constraints
    // actual value is not important
    
    override var intrinsicContentSize: CGSize {
        return CGSize.zero
    }
}
