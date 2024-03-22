//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Cesar Fernandez on 3/18/24.
//

import UIKit

class BookFormTableViewController: UITableViewController {
    
//    @IBOutlet weak var bookFormTableTitleTextField: UITextField!
//    @IBOutlet weak var bookFormTableAuthorTextField: UITextField!
//    @IBOutlet weak var bookFormTableGenreTextField: UITextField!
//    @IBOutlet weak var bookFormTableLengthTextField: UITextField!

    
    var book: Book?
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var genreTextField: UITextField!
    @IBOutlet var lengthTextField: UITextField!
    
    
    init?(coder: NSCoder, book: Book?) {
        self.book = book
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.book = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        guard let book = book else {return}
        
        titleTextField.text = book.title
        authorTextField.text = book.author
        genreTextField.text = book.genre
        lengthTextField.text = book.length
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text,
            let author = authorTextField.text,
            let genre = genreTextField.text,
            let length = lengthTextField.text else {return}
        
        book = Book(title: title, author: author, genre: genre, length: length)
        performSegue(withIdentifier: "UnwindToBookTable", sender: self)
    }

}
