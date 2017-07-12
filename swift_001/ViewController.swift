//
//  ViewController.swift
//  swift_001
//
//  Created by DingJia on 2017/7/6.
//  Copyright © 2017年 席亚楠. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource  {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let v = UIView(frame:CGRect(x: 0, y: 0, width: 100, height: 100))
        v.backgroundColor = UIColor .red
        view.addSubview(v)
        
        let button:UIButton = UIButton(type:.custom)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0.4122721354, alpha: 1)
        button.isSelected = true // Both events fire on change.
        //设置按钮位置和大小
        button.frame = CGRect(x:10, y:150, width:100, height:30)
        //设置按钮文字
        button.setTitle("按钮", for:.normal)   //TODO:应该
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
       
        let iv = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        iv.image = UIImage(named:"头像")  //FIXME:哈哈哈
        iv.animationImages = [UIImage(named:"头像")!,UIImage(named:"icon2")!]
        iv.animationDuration=2
        view.addSubview(iv)
        iv.startAnimating()
        let b2 = { (x: Int) ->() in
        print(x)
        }
        b2(100)
        let b3 = { (x: Int) -> Int in
            return x + 250
        }
        print(b3(100))
        DispatchQueue.global().async { 
            print("耗时操作\(Thread.current)")
        }
        DispatchQueue.main.async {
        }
        
        setupUI()
    }
    func click(btn: UIButton ) -> () {
        print("aaaaa")
        print(#function)
        print(btn)
    }
    func setupUI()  {
        let tv = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tv)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tv.dataSource = self;
       // tv.register(UINib(nibName: "CustomView", bundle: nil), forCellReuseIdentifier: "")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = "hello ---- \(indexPath.row)"
        let sss = "hello ---- \(indexPath.row)"
        print(sss)
        return cell
    }
}

