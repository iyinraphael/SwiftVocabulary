//
//  WordsTableViewController.swift
//  Swift Vocabulary
//
//  Created by Iyin Raphael on 4/13/20.
//  Copyright © 2020 Iyin Raphael. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {

    var vocaWords = [VocabularyWord]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocaWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
        let word = vocaWords[indexPath.row].word
        cell.textLabel?.text = word
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDefinitionSegue" {
            let dvc = segue.destination as! DefinitionViewController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            dvc.vocabWord = vocaWords[indexPath.row]
        }
    }


}
