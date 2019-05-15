//
//  MenuItem.swift
//  STVE
//
//  Created by Siddhartha Modur on 5/14/19.
//  Copyright © 2019 OC-CSC241. All rights reserved.
//

import Foundation
import Kanna

class MenuItem {
    var dishName: String
    var sides: String
    var description: String
    var cals: String
    
    init(html: XMLElement) {
        guard let title = html.xpath("//button@[class='h4 site-panel__daypart-item-title'").first else {
            throw ParsingError.HTMLError
        }
        guard let name = title.text else {
            throw ParsingError.HTMLError
        }
        dishName = name;
        sides = ""
        guard let daypart_sides = html.xpath("//div@[class='site-panel__daypart-item-sides']").first else {
            throw ParsingError.HTMLError
        }
        guard let sides_text = daypart_sides.text else {
            throw ParsingError.HTMLError
        }
        sides = sides_text
        cals = ""
        guard let desc_obj = html.xpath("//div@['site-panel__daypart-item-description']").first else {
            throw ParsingError.HTMLError
        }
        guard let desc_text = desc_obj.innerHTML else {
           
        }
        desc_text.replacingOccurrences(of: "<br>", with: "\n")
        desc_text.replacingOccurrences(of: "<!--Outputting Options-->", with: "")
        description = desc_text
        cals = ""
        guard let calinfo = html.xpath("//div@[class='site-panel__daypart-item-calories']").first else {
            throw ParsingError.HTMLError
        }
        guard let caltext = calinfo.text else {
            throw ParsingError.HTMLError
        }
        cals = caltext
    }
}
