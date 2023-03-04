//
//  MenuList.swift
//  Little Lemon
//
//  Created by David Duprez-Goulet on 2023-03-01.
//

import Foundation

struct MenuList: Codable {
    let menu : [MenuItem]
}


//
//
//
//Create two struct models in two separate swift files. Call one of them "MenuList" and another "MenuItem". Make both of the structs conform to the Decodable protocol.
//
//Inside the MenuList struct create a single constant property called menu that will hold the Array of MenuItem objects.
//Inside the MenuItem struct, declare three constant properties: title, image and price, all of type String.
//(Optional) There are more than 3 properties in the menu JSON data, and they are just ignored at the moment. You can optionally add them as well in your model like description etc.
