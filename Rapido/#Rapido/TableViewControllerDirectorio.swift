//
//  TableViewController.swift
//  #Rapido
//
//  Created by Laboratorio UNAM-Apple 01 on 10/10/19.
//  Copyright © 2019 ari. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var negocios : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recoverData()
        
       /* if(UserDefaults.standard.value(forKey: "session") != nil) {  //Para agregar registros desde que la app está nueva
            for _ in 1...5 {
                save(nombre: "Juanito", telefono: 5523456789, direccion: "Copilco")
            }
            recoverData()
            UserDefaults.standard.set("true", forKey: "session")
        }*/
 
 
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
        return negocios.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellNegocio", for: indexPath) as! TableViewCell

        let cosa = negocios[indexPath.row]
        
        cell.labelNombre.text = cosa.value(forKey: "nombre") as? String
        
        return cell
    }
    
    func connection() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    func recoverData(){
        let context = connection()
        let fetchRequest : NSFetchRequest<Negocio> = Negocio.fetchRequest()
        
        do {
            negocios = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("No se pudo recuperar los datos.", error)
        }
    }

    @IBAction func unwindTo(segue: UIStoryboardSegue) {}
    
    func save(nombre: String, telefono: Int, direccion : String) {
        
        let context = connection()
        let entityNegocio = NSEntityDescription.entity(forEntityName: "Negocio", in: context)!
        
        let negocio = NSManagedObject(entity: entityNegocio, insertInto: context)
        negocio.setValue(nombre, forKeyPath: "nombre")
        negocio.setValue(telefono, forKey: "telefono")
        negocio.setValue(direccion, forKey: "direccion")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("No lo pude salvar. \(error), \(error.userInfo)")
        }
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? TableViewCell,
        
            let indexPath = self.tableView.indexPath(for: cell) {
            
            
                let viewTelefonos = segue.destination as!TableViewControllerTelefonos
            
                viewTelefonos.tel = Telefonos.listTelefonos[indexPath.row]  // Dos registros
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
