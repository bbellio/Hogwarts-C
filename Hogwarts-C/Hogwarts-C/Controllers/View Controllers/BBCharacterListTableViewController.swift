//
//  BBCharacterListTableViewController.swift
//  Hogwarts-C
//
//  Created by Bethany Wride on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class BBCharacterListTableViewController: UITableViewController {
    // Local source of truth
    var characters: [BBCharacter] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Name the array whatever you want, i.e. characters
        BBCharacterController.fetchCharacters { (characters) in
            DispatchQueue.main.async {
                self.characters = characters
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? BBCharacterTableViewCell else {return UITableViewCell()}
        let character = characters[indexPath.row]
        cell.updateViews(for: character)
        return cell
    }
} // End of class
