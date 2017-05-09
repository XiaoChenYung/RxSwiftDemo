//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by tm on 2017/5/3.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        empty()
//        never()
//        just()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func never() -> () {
        let disposeBag = DisposeBag()
        Observable<String>.never()
        .subscribe { _ in
            print("nevwer")
        }
        .disposed(by: disposeBag)
        
    }
    
    func empty() -> () {
        let disposeBag = DisposeBag()
        Observable<Int>.empty()
        .subscribe { event in
            print(event)
            }
        .disposed(by: disposeBag)
    }
    
    func just() -> () {
        let disposeBag = DisposeBag()
        Observable<Int>.just(2)
        .subscribe { event in
            print(event)
        }
        .disposed(by: disposeBag)
        
    }


}

