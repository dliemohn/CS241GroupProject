//
//  MenuParser.swift
//  STVE
//
//  Created by Siddhartha Modur on 4/29/19.
//  Copyright © 2019 OC-CSC241. All rights reserved.
//

import Foundation
import Kanna

enum ParsingError : Error {
	case NetworkError(url: String)
	case HTMLError
}

func getHTML(from: String) throws -> String  {
	guard let myURL = URL(string: from) else {
		throw ParsingError.NetworkError(url: from)
	}
	
	do {
		let retval = try String(contentsOf: myURL, encoding: .utf8)
		return retval
	}
}

func getVenues(html: String) throws -> [Venue] {
	var cafes = [Venue]()
	let doc =  try HTML(html: html, encoding: .utf8)
	for vinfo in doc.xpath("//div[@class='c-accordion__row site-panel__cafeinfo-row active'") {
		ca
	}
}
