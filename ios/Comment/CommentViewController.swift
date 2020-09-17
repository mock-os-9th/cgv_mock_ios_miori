//
//  CommentViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit


struct Comment {
    var profileImg : [String] = [String]()
    var uName : [String] = [String]()
    var uCom : [String] = [String]()
    var date : [String] = [String]()
}

class CommentViewController: BaseViewController, SendCommentDelegate {
    
    func sendComment() {
        comment.uCom.append("영화좀 보고싶다")
        comment.profileImg.append("nologinpf")
        comment.uName.append("미오리")
        //dateFormatter.locale = Locale(identifier: "ko"
        var formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "M월 dd일 aa HH:mm ∙"
        var current_date_string = formatter.string(from: Date())
        //print(current_date_string)
        
        comment.date.append(current_date_string)
        
        commentTV.reloadData()
        print("ucon : \(comment.uCom)")
    }
    

    @IBOutlet weak var commentTV: UITableView!
    
    var comment : Comment = Comment()
    var prevViewController : EachMovieDetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 델리게이트 나다
        prevViewController?.delegate = self
        
        

        // Do any additional setup after loading the view.
        commentTV.dataSource = self
        commentTV.delegate = self
        
        
        // 셀 등록
        commentTV.register(UINib(nibName: "CommentTableViewCell", bundle: .main), forCellReuseIdentifier: "CommentTableViewCell")
        
        comment.profileImg = ["nologinpf","nologinpf"]
        comment.uName = ["치킨","룰루"]
        comment.uCom = ["인생영화 강추","훌륭해요~ 시간가는줄 몰랐어요"]
        comment.date = ["9월 8일 오전 11:41 ∙","9월 11일 오후 11:51 ∙"]
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        sendComment()
    }

}

extension CommentViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comment.uName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
        
        cell.profileImg.image = UIImage(named: comment.profileImg[indexPath.row])
        cell.userName.text = comment.uName[indexPath.row]
        cell.comment.text = comment.uCom[indexPath.row]
        cell.dateLabel.text = comment.date[indexPath.row]
        
        return cell
    }
    
    
}
