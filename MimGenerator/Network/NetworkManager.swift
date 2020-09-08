//
//  NetworkManager.swift
//  MimGenerator
//
//  Created by omrobbie on 08/09/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()

    private let BASE_URL = "https://api.imgflip.com/"
    private let GET_MEMES = "get_memes/"

    func fetchMemeList(completion: @escaping ([MemeItem]) -> ()) {
        guard let url = URL(string: BASE_URL + GET_MEMES) else {return}

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error", error.localizedDescription)
                return
            }

            guard let data = data else {return}

            do {
                let decodeData = try JSONDecoder().decode(Meme.self, from: data)
                DispatchQueue.main.async {
                    completion(decodeData.data.memes)
                }
            } catch {
                print("Error", error.localizedDescription)
            }
        }.resume()
    }
}
