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
//        of()
//        from()
//        create()
//        range()
//        repeatElement()
        generate()
        
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
    
    func of() -> () {
        let disposeBag = DisposeBag()
        Observable<String>.of("Google","Nike","Apple")
            .subscribe(onNext: {event in
                print(event)
            })
        .disposed(by: disposeBag)
        
    }
    
    func from() -> () {
        let disposeBag = DisposeBag()
        Observable<String>.from(["Google","Nike","Apple"])
        .subscribe(onNext: {
                print($0)
            })
        .disposed(by: disposeBag)
        
    }
    
    func create() -> () {
        let disposeBag = DisposeBag()
        
        let myJust = { (element: String) -> Observable<String> in
            return Observable.create {observer in
                observer.on(.next(element))
                observer.on(.completed)
                return Disposables.create()
            }
        }
        
        
        myJust("Apple")
        .subscribe (onNext: {
                print($0)
        })
        .disposed(by: disposeBag)
        
    }

    func range() -> () {
        let disposeBag = DisposeBag()
        Observable<Int>.range(start: 1, count: 10)
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
        
    }
    
    func repeatElement() -> () {
        let disposeBag = DisposeBag()
        Observable.repeatElement("Apple")
        .take(3000000)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
        
    }
    
    func generate() -> () {
        let disposeBag = DisposeBag()
        Observable.generate(
                            initialState: 0,
                            condition:{ $0 < 3},
                            iterate: {$0 + 1}
        )
        .subscribe(onNext: {
                print($0)
        })
        .disposed(by: disposeBag)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

