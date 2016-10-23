//
//  ViewController.swift
//  swiftSampleFakeSafari
//
//  Created by Eriko Ichinohe on 2016/02/01.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myWebView: UIWebView!

    @IBOutlet weak var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        // MARK:宿題2 ユーザーデフォルトからURLを取出して、表示する
        //ユーザデフォルトを用意する
        let myDefault = UserDefaults.standard
        
        //データを読みだして
        let URLText = myDefault.string(forKey: "URLText")
        
        //　文字列が入っていたらWebViewに表示する
        if let tmpStr = URLText{
            // URLリクエストを作って
            let myURL = URL(string: tmpStr)
            
            let myURLReq = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLReq)

        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapBtn(_ sender: UIButton) {
        
        // MARK:宿題3 何も入力されていない場合、アラートを出して入力を促す
        if myTextField.text == ""{
            //アラートを作る
            let alertController = UIAlertController(
                title: "URL", message: "何か文字を入力して下さい", preferredStyle: .alert)
            
            //OKボタンを追加
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OK")}))
            
            //アラートを表示する
            present(alertController, animated: true, completion: nil)
            
            return
        }
        // MARK:宿題1 TextFieldに入力したアドレスのサイトをWebViewに表示
        // URLリクエストを作って
        let myURL = URL(string: myTextField.text!)
        
        let myURLReq = URLRequest(url: myURL!)
        myWebView.loadRequest(myURLReq)
        
        //  MARK:宿題2　ユーザーデフォルトに保存
        //ユーザデフォルトを用意する
        let myDefault = UserDefaults.standard
        
        //データを書きこんで
        myDefault.set(myTextField.text!, forKey: "URLText")
        
        //即反映させる
        myDefault.synchronize()

    }

    @IBAction func tapReturnKey(_ sender: UITextField) {
        
        //  MARK:宿題2（おまけ）　ユーザーデフォルトに保存
        
        //ユーザデフォルトを用意する
        let myDefault = UserDefaults.standard
        
        //データを書きこんで
        myDefault.set(myTextField.text!, forKey: "URLText")
        
        //即反映させる
        myDefault.synchronize()
    }
}

