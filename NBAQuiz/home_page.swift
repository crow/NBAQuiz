//
//  home_page.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 4/5/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//


// Is any of this correct? The idea should be it should have a title on the front page, and then two buttons on the buttom of the page for "Teams" and "Decades"

import SwiftUI


class home_page: UIViewController {
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="NBA Quiz"
        self.view.backgroundColor=UIColor.white
        
        teams()
    }
    
    @objc func teams() {
        let v=TeamListView()
        self.navigationController?.pushViewController(v, animated: true)
    }
    
    @objc func decades() {
        let v=DecadesListView()
        self.navigationController?.pushViewController(v, animated: true)
    }

// Ask David about this part: Is it correct?
    
    func teams() {
        self.view.addSubview(Title)
        
        self.view.addSubview(clickHereTeam)
      
    }
    
    func decades() {
    self.view.addSubview(clickHereDecade)
    }
    
    //
    
    let Title: UILabel = {
        let lbl=UILabel()
        lbl.text="NBA Quiz"
        lbl.textColor=UIColor.blue
        lbl.textAlignment = .center
        lbl.numberOfLines=2
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let clickHereTeam: UIButton = {
        let btn=UIButton()
        btn.setTitle("Pick your Team", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor=UIColor.orange
        btn.layer.cornerRadius=5
        btn.layer.masksToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(clickHereTeam), for: .touchUpInside)
        return btn
    }()
    
    func divider() {
    
    let clickHereDecade: UIButton = {
        let btn=UIButton()
        btn.setTitle("Pick your Decade", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor=UIColor.orange
        btn.layer.cornerRadius=5
        btn.layer.masksToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(clickHereDecade), for: .touchUpInside)
        return btn
    }()
    
}

}


