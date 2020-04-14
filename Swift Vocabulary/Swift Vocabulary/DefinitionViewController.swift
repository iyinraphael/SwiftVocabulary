//
//  DefinitionViewController.swift
//  Swift Vocabulary
//
//  Created by Iyin Raphael on 4/13/20.
//  Copyright © 2020 Iyin Raphael. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {

    var vocabWord: VocabularyWord?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var definitionTextView: UITextView!
    
    func updateView() {
        if !isViewLoaded {return}
        
        if let vocabWord = vocabWord {
            definitionTextView.textColor = .black
            wordLabel.text = vocabWord.word
            definitionTextView.text = vocabWord.definition
        }
        
    }
    
}
