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

public func getHTML(from: String) throws -> HTMLDocument  {
	guard let myURL = URL(string: from) else {
		throw ParsingError.NetworkError(url: from)
	}
	let raw = try String(contentsOf: myURL, encoding: .utf8)
	let doc =  try HTML(html: raw, encoding: .utf8)
	return doc
}

func getVenues() throws -> [Venue] {
	var cafes = [Venue]()
	let doc = try getHTML(from: "https://oberlin.cafebonappetit.com/")
	for vinfo in doc.xpath("//div[@class='c-accordion__row site-panel__cafeinfo-row active'") {
		guard let contents = vinfo.innerHTML else {
			throw ParsingError.HTMLError
		}
		try cafes.append(Venue(metaHTML: contents))
	}
}
