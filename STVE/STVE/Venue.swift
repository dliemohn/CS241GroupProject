// Venue.swift
//  Venue Class
// Derek Liemohn
//
//
import Foundation
import Kanna

class Venue {
	let meals: [Menu]
	var name: String

	public init(metaHTML: XMLElement) throws {
		//let metadata = try HTML(html: metaHTML, encoding: .utf8)
		guard let span =  metaHTML.xpath("//span@[data-name='title']").first else {
			throw ParsingError.HTMLError
		}
		guard let vname = span.text else {
			throw ParsingError.HTMLError
		}
		name = vname
		guard let href = metaHTML.xpath("//a@[class='site-panel__cafeinfo-view-more']").first else {
			throw ParsingError.HTMLError
		}
		guard let menuRL = href["href"] else {
			throw ParsingError.HTMLError
		}
		try getMenus(url: menuRL)
	}

	func getMenus(url: String) throws -> Void {
		let doc = try getHTML(from: url)
		for meal in doc.xpath("//header@[class's-header site-panel__daypart-header']") {
			meals.append(Menu(meal))
		}
	}
}
