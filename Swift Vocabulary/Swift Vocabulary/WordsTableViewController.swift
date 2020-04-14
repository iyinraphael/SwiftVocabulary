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
        createArraysOfVocabulary()
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
        
        if segue.identifier == "ShowDefinitionViewController" {
            let dvc = segue.destination as! DefinitionViewController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            dvc.vocabWord = vocaWords[indexPath.row]
            
        }
    }
    
    // MARK: - CRUD
    
    func createVocabulary(_ word: String, _ definition: String) -> VocabularyWord {
        let vocabulary = VocabularyWord(word: word, definition: definition)
        return vocabulary
    }
    
    func createArraysOfVocabulary() {
        let dictVocabulary = ["Variable" : "A value used to store information. It's mutable",
                              "Constant" : "A value used to store informatiuon. It's not mutable",
                              "Function" : "A set of logical steps used to manupulate object to get desirable out" ]
        for (key,value) in dictVocabulary {
            vocaWords.append(createVocabulary(key, value))
        }
    }

}
