//
//  Meme.swift
//  MimGenerator
//
//  Created by omrobbie on 08/09/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

struct Meme: Decodable {
    let data: MemeData
}

struct MemeData: Decodable {
    let memes: [MemeItem]
}

struct MemeItem: Decodable {
    let url: String
}
