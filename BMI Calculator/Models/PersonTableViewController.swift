

import UIKit

class PersonTableViewController: UITableViewController {

    
    
    var history = [Person]()
    var persons = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSamplePersons()
    }

  
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as? PersonTableViewCell else {
            fatalError("The dequeued cell is not an instance of PersonTableViewCell")
        }
        
        // Fetch the persons for the data source layout
        let person = persons[indexPath.row]
        
        cell.nameLabel.text = person.name
        cell.heightLabel.text = String(person.height)
        cell.weightLabel.text = String(person.weight)
        cell.bmiLabel.text = String(person.bmi)
        
        
        return cell
    }
    
    private func loadSamplePersons(){
          for p in history{
              persons.append(p)
              }
          }
}
