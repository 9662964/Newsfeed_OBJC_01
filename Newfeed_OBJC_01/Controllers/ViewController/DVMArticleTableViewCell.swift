//
//  DVMArticleTableViewCell.swift
//  Newfeed_OBJC_01
//
//  Created by iljoo Chae on 6/26/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class DVMArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    @IBOutlet weak var articleContentLabel: UILabel!
    
    var article:DVMArticle? {
        didSet{
            updateViews()
        }
    }
    
    
    func updateViews() {
        guard let article = article else {return}
        
        articleTitleLabel.text = article.title
        articleContentLabel.text = article.publishedAt
        articleDescriptionLabel.text = article.descript
        print("print from tableViewCell")
    }

}
