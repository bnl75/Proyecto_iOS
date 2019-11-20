//
//  TableViewController.swift
//  ProyectoCoreData
//
//  Created by Laboratorio UNAM-Apple 10 on 24/04/19.
//  Copyright © 2019 ari. All rights reserved.
//

import UIKit
import CoreData

class TableViewControllerDirectorio: UITableViewController {
    
    var personas : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recoverData()
      
        /*
        if(UserDefaults.standard.value(forKey: "session") == nil) {
            for n in 1...5 {
                save(name: "Hola", quantity: n)
            }
            recoverData()
            UserDefaults.standard.set("true", forKey: "session")
        }
 
 */
    }
    
    override func viewDidAppear(_ animated: Bool) {
        recoverData()
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCosa", for: indexPath) as! TableViewCell

        let cosa = personas[indexPath.row]
        
        cell.labelNombre.text = cosa.value(forKey: "name") as? String
        
        //cell.labelNombre.text = cosa.value(forKey: "telefono") as? String
        //cell.labelMiLista.text = cosa.value(forKeyPath: "name") as? String
        
        //cell.textLabel?.text = cosa.name
        //cell.detailTextLabel?.text = String(cosa.quantity)
        return cell
    }
    
    func connection() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    func recoverData(){
        let context = connection()
        let fetchRequest : NSFetchRequest<Persona> = Persona.fetchRequest()
        
        do {
            personas = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("No se pudo recuperar los datos.", error)
        }
    }

    @IBAction func unwindTo(segue: UIStoryboardSegue) {}
    
    func save(name: String, telefono: Int) {
        
        let context = connection()
        let entityPersona = NSEntityDescription.entity(forEntityName: "Persona", in: context)!
        
        let persona = NSManagedObject(entity: entityPersona, insertInto: context)
        persona.setValue(name, forKeyPath: "name")
        persona.setValue(telefono, forKey: "telefono")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("No lo pude salvar. \(error), \(error.userInfo)")
        }
    }
   
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
