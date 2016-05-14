//
//  PersistencyManager.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/3/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class PersistencyManager: NSObject {
    //PrivateAPI-----------------------------------------------------------------------------------------------
    private var pizzas = [FoodItem]()
    private var calzones   = [FoodItem]()
    private var garlicKnots   = [FoodItem]()
    private var salads   = [FoodItem]()
    private var beverages   = [FoodItem]()
    private var desserts   = [FoodItem]()
    private var plainPizzas = [FoodItem]()
    private var createYourOwn = [FoodItem]()
    private var speciality  = [FoodItem]()
    private var allFoodItems = [FoodItem]()
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
    override init() {
//PLAIN----------------------------------------------------------------------------------------------------------
         let plain = FoodItem(title:"Plain ",itemDescription: "Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice : [12.00,19.00,19.00])
//CYO----------------------------------------------------------------------------------------------------------
         let CYO = FoodItem(title:"Create Your Own",itemDescription: "Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice : [12.00,19.00,19.00])
//Speciality---------------------------------------------------------------------------------------------------
        let americana = FoodItem(title:"Americana*",itemDescription:"Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice :[15.00,23.00,23.00])
        let aummaAumma = FoodItem(title:"Aumma Aumma",itemDescription:"Sausage, meatball, ricotta, sauce, mozzarella",originalPrice :[15.00,23.00,23.00])
        let bandiera = FoodItem(title:"Bandiera ",itemDescription:"Spinach, fresh garlic, ricotta, sauce, mozzarella",originalPrice :[15.00,23.00,23.00])
        let cafona = FoodItem(title:"Cafona ",itemDescription:"Ricotta, pepperoni, sauce, mozzarella",originalPrice :[15.00,23.00,23.00])
        let capponata = FoodItem(title:"Capponata",itemDescription:"Eggplant, red onion, black & green olive, caper, sauce, mozzarella",originalPrice :[15.00,23.00,23.00])
        let carnosa = FoodItem(title:"Carnosa",itemDescription:"Meatball, bacon, pepperoni, grilled chicken, sausage, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        let contadina = FoodItem(title:"Contadina Personal Round",itemDescription:"Grilled chicken, plum tomato, bacon, red onion, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        let cortese = FoodItem(title:"Cortese*",itemDescription:"Ricotta, plum tomato, basil pesto, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :[15.00,23.00,23.00])
        let diavola = FoodItem(title:"Diavola*",itemDescription:"Grilled chicken, red onion, bacon, award-winning BBQ sauce, hot sauce, parmigiano aioli, mozzarella.",originalPrice :[15.00,23.00,23.00])
        let ditta = FoodItem(title:"Ditta Personal Round",itemDescription:"Sausage, mushroom, pepperoni, pesto, bacon, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        let fantasia = FoodItem(title:"Fantasia*",itemDescription:"Basil pesto, ricotta, roasted pepper, black olive, marinated mushroom, mozzarella. Not made with tomato sauce, unless requested..",originalPrice :[15.00,23.00,23.00])
        let forzuta = FoodItem(title:"Forzuta",itemDescription:"Sausage, bell pepper, red onion, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        let francesco = FoodItem(title:"Francesco*",itemDescription:"Grilled chicken, plum tomato, black olive, basil pesto, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :[15.00,23.00,23.00])
        let giardino = FoodItem(title:"Giardino",itemDescription:"Bell pepper, marinated mushroom, red onion, fresh garlic, plum tomato, black olive, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        let golosa = FoodItem(title:"Golosa* Personal Round",itemDescription:"Grilled chicken, marinated mushroom, spinach, bacon, red onion, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :[15.00,23.00,23.00])
        let greca = FoodItem(title:"Greca*",itemDescription:"Spinach, ricotta, fresh garlic, red onion, mozzarella.  Not made with tomato sauce, unless requested.",originalPrice :[15.00,23.00,23.00])
        let gustosa = FoodItem(title:"Gustosa",itemDescription:"Eggplant, roasted pepper, basil pesto, sauce, fresh mozzarella.",originalPrice :[15.00,23.00,23.00])
        let mafiosa = FoodItem(title:"Mafiosa Personal Round",itemDescription:"Sausage, roasted pepper, black & green olive, caper, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        let margherita = FoodItem(title:"Margherita",itemDescription:"Plum tomato, red onion, sauce, fresh basil & mozzarella.",originalPrice :[15.00,23.00,23.00])
        let marinara = FoodItem(title:"Marinara",itemDescription:"Toasted anchovy, fresh garlic, caper, oregano, sauce, fresh mozzarella.",originalPrice :[15.00,23.00,23.00])
        let nessa = FoodItem(title:"Nessa Personal Round",itemDescription:"Bacon, red onions, fresh basil, sauce, mozzarella, parmigiano aioli.",originalPrice :[15.00,23.00,23.00])
        let parmigiana = FoodItem(title:"Parmigiana",itemDescription:"Eggplant, fresh basil, garlic & mozzarella, ricotta.",originalPrice :[15.00,23.00,23.00])
        let primavera = FoodItem(title:"Primavera",itemDescription:"Spinach, fresh garlic, roasted pepper, red onion, black olive, sauce, fresh mozzarella.",originalPrice :[15.00,23.00,23.00])
        let puttanesca = FoodItem(title:"Puttanesca",itemDescription:"Marinated mushroom, roasted pepper, red onion, black & green olive, caper, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        let quattroFormaggi = FoodItem(title:"Quattro Formaggi*",itemDescription:"Ricotta, mozzarella, romano, fresh garlic, herbs, parmigiano aioli. Not made with tomato sauce, unless requested.",originalPrice :[15.00,23.00,23.00])
        let rustica = FoodItem(title:"Rustica",itemDescription:"Toasted anchovy, black olive, fresh garlic, caper, red onion, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        let sottoSopra = FoodItem(title:"Sotto Sopra",itemDescription:"Fresh garlic, ricotta, oregano, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        let spagnola = FoodItem(title:"Spagnola",itemDescription:"Pepperoni, green olive, red onion, roasted pepper, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        let verdura = FoodItem(title:"Verdura* Personal Round",itemDescription:"Pepperoni, green olive, red onion, roasted pepper, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
//Calzones---------------------------------------------------------------------------------------------------
         let createYourOwnCalzone = FoodItem(title:"Create Your Own",itemDescription:"Create Your Own with any 3 items from our list of toppings.",originalPrice :[9.00])
        let chickenCalzone = FoodItem(title:"Chicken",itemDescription:"Ricotta, Mozzarella, Parmigiano, Romano and Grilled Chicken.",originalPrice :[9.00])
        let sausageCalzone = FoodItem(title:"Sausage",itemDescription:"Ricotta, Mozzarella, Parmigiano, Romano and Sausage.",originalPrice :[9.00])
        let meatballCalzone = FoodItem(title:"Meatball",itemDescription:"Ricotta, Mozzarella, Parmigiano, Romano and Meatball.",originalPrice :[9.00])
        let pepperoniCalzone = FoodItem(title:"Pepperoni",itemDescription:"Ricotta, Mozzarella, Parmigiano, Romano and Pepperoni.",originalPrice :[9.00])
               calzones = [createYourOwnCalzone,chickenCalzone,sausageCalzone,meatballCalzone,pepperoniCalzone]
//Knots---------------------------------------------------------------------------------------------------
        let threePieceGalicKnots = FoodItem(title:"3 piecce Knots",itemDescription:"A fan favorite! Extra fluffy knots, tossed with fresh garlic, chopped parsley, a blend of grated cheeses & a touch of extra virgin olive oil.",originalPrice :[1.00])
        let sixPieceGalicKnots = FoodItem(title:"6 piecce Knots",itemDescription:"A fan favorite! Extra fluffy knots, tossed with fresh garlic, chopped parsley, a blend of grated cheeses & a touch of extra virgin olive oil.",originalPrice :[2.00])
        let twelvePieceGalicKnots = FoodItem(title:"9 piecce Knots",itemDescription:"A fan favorite! Extra fluffy knots, tossed with fresh garlic, chopped parsley, a blend of grated cheeses & a touch of extra virgin olive oil.",originalPrice :[3.00])
        garlicKnots = [threePieceGalicKnots,sixPieceGalicKnots,twelvePieceGalicKnots]
//Salads---------------------------------------------------------------------------------------------------
        let houseSalad = FoodItem(title:"HouseSalad",itemDescription:"We start with the Simple Salad then add bell pepper, red onion & black olive.",originalPrice :[1.00])
        let caesarSalad = FoodItem(title:"CaesarSalad",itemDescription:"Homemade croutons, creamy dressing & our own blend of grated cheeses.",originalPrice :[2.00])
        let specialSalad = FoodItem(title:"SpecialSalad",itemDescription:"Baby spinach, marinated mushroom, roasted pepper, fresh mozzarella & herbed vinaigrette.",originalPrice :[3.00])
        let farmersSalad = FoodItem(title:"FarmersSalad",itemDescription:"Baby spinach, marinated mushroom, roasted pepper, fresh mozzarella & herbed vinaigrette.",originalPrice :[3.00])
        salads = [houseSalad,caesarSalad,specialSalad,farmersSalad]
//Beverages---------------------------------------------------------------------------------------------------
        let cokeCan = FoodItem(title:"Coke",itemDescription:"An awesome can of coke.",originalPrice :[1.50])
        let dietCokeCan = FoodItem(title:"Diet coke",itemDescription:"A beautiful can of diet coke",originalPrice :[1.50])
        let spriteCan = FoodItem(title:"Sprite",itemDescription:"A thirst quenching can of sprite.",originalPrice :[1.50])
        let liptonBriskTeaCan = FoodItem(title:"Iced Tea",itemDescription:"A brisk can of Lipton Iced Tea.",originalPrice :[3.00])
        let bottledWater = FoodItem(title:"Water",itemDescription:"A healthy bottle of water.",originalPrice :[1.50])
        beverages = [cokeCan,dietCokeCan,spriteCan,liptonBriskTeaCan,bottledWater]
//Dessert---------------------------------------------------------------------------------------------------
        let pizzettaNutella = FoodItem(title:"Pizzetta Nutella",itemDescription:"Mini thin crust pizza topped with Italy’s favorite rich chocolate hazelnut cream.",originalPrice :[4.00])
        let homemadeCanoli = FoodItem(title:"Homemade Canoli",itemDescription:"A six pack of flaky pastry shells filled with our own homemade sweet vanilla cream.",originalPrice :[4.00])
         desserts = [pizzettaNutella,homemadeCanoli]
//allFoodItems---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
        allFoodItems = [plain,CYO,americana,aummaAumma,bandiera,cafona,capponata,carnosa,contadina,cortese,diavola,ditta,fantasia,forzuta,francesco,giardino,golosa,greca,gustosa,mafiosa,margherita,marinara,nessa,parmigiana,primavera,puttanesca,quattroFormaggi,rustica,sottoSopra,spagnola,verdura,createYourOwnCalzone,chickenCalzone,sausageCalzone,meatballCalzone,pepperoniCalzone,threePieceGalicKnots,sixPieceGalicKnots,twelvePieceGalicKnots,houseSalad,caesarSalad,specialSalad,farmersSalad,cokeCan,dietCokeCan,spriteCan,liptonBriskTeaCan,bottledWater,pizzettaNutella,homemadeCanoli]
//plainPizzas---------------------------------------------------------------------------------------------------
        plainPizzas = [plain]
//createYourOwn------------------------------------------------------------------------------------------------
        createYourOwn = [CYO]
//speciality---------------------------------------------------------------------------------------------------
        speciality = [americana,aummaAumma,bandiera,cafona,capponata,carnosa,contadina,cortese,diavola,ditta,fantasia,forzuta,francesco,giardino,golosa,greca,gustosa,mafiosa,margherita,marinara,nessa,parmigiana,primavera,puttanesca,quattroFormaggi,rustica,sottoSopra,spagnola,verdura]
//pizzas---------------------------------------------------------------------------------------------------
        pizzas = [plain,CYO,americana,aummaAumma,bandiera,cafona,capponata,carnosa,contadina,cortese,diavola,ditta,fantasia,forzuta,francesco,giardino,golosa,greca,gustosa,mafiosa,margherita,marinara,nessa,parmigiana,primavera,puttanesca,quattroFormaggi,rustica,sottoSopra,spagnola,verdura]
        calzones = [createYourOwnCalzone,chickenCalzone,sausageCalzone,meatballCalzone,pepperoniCalzone]
//garlicKnots---------------------------------------------------------------------------------------------------
        garlicKnots = [threePieceGalicKnots,sixPieceGalicKnots,twelvePieceGalicKnots]
//salads---------------------------------------------------------------------------------------------------
        salads = [houseSalad,caesarSalad,specialSalad,farmersSalad,]
//beverages---------------------------------------------------------------------------------------------------
        beverages = [cokeCan,dietCokeCan,spriteCan,liptonBriskTeaCan,bottledWater]
//desserts---------------------------------------------------------------------------------------------------
        desserts = [pizzettaNutella,homemadeCanoli]
        
    }
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
    //MARK:- All Pizzas
    // Returns all pizzas
    func getPizza() -> [FoodItem]{
        return pizzas
    }
    //Add a pizza to the Pizza array
    func addPizza(pizza: FoodItem, index: Int) {
        if (pizzas.count >= index) {
            pizzas.insert(pizza, atIndex: index)
        } else {
            pizzas.append(pizza)
        }
    }
    // Removes a pizza at index from the pizza Array
    func deletePizzaAtIndex(index: Int) {
        pizzas.removeAtIndex(index)
    }
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
    //MARK:- Plain Pizzas
    
    // Returns an array of pizzas for the plain pizza section
    func getPlainPizzasForSection() -> Int {
        return plainPizzas.count
    }
    // Returns the plain pizza at index.
    func plainPizzaItemAtIndex(index: Int) -> FoodItem {
        return plainPizzas[index]
    }
    // Returns all the plain pizzas.
    func getPlainPizzas() -> [FoodItem]{
        return plainPizzas
    }
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
    
    //MARK:- Create Your Own Pizzas
    // Returns the number of create your own pizzas
    func getCYOPizzasForSection() -> Int {
        return createYourOwn.count
    }
    // Returns create your own pizza at index
    func cyoPizzaItemAtIndex(index: Int) -> FoodItem {
        return createYourOwn[index]
    }
    // returns all create your own pizzas
    func getCreateYourOwnPizzas()-> [FoodItem]{
        return createYourOwn
    }
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
    //MARK:- Speciality Pizzas
    // Returns the number of Speciality Pizzas
    func getSpecialityPizzasForSection() -> Int {
        return speciality.count
    }
    // Returns the  Speciality Pizza at index
    func specialityPizzaItemAtIndex(index: Int) -> FoodItem {
        return speciality[index]
    }
    func getSpecialityPizza() -> [FoodItem] {
        return speciality
    }
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
    //MARK:- Calzones
    // Returns all calzones in an array
    func getCalzone() -> [FoodItem]{
        return calzones
    }
    //add a calzone Pizza at index
    func addCalzone(calzone: FoodItem, index: Int) {
        if (calzones.count >= index) {
            calzones.insert(calzone, atIndex: index)
        } else {
            pizzas.append(calzone)
        }
    }
    //Remove a calzone Pizza at index
    func deleteCalzoneAtIndex(index: Int) {
        calzones.removeAtIndex(index)
    }
    func getCalzoneForSection() -> Int {
        return calzones.count///3
    }
    func calzonesItemAtIndex(index: Int) -> FoodItem {
        return calzones[index]
    }
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
    //
    //MARK:- Garlic Knots
    func getGarlicKnots() -> [FoodItem]{
        return garlicKnots
    }
    func addGarlicKnots(knot: FoodItem, index: Int) {
        if (garlicKnots.count >= index) {
            garlicKnots.insert(knot, atIndex: index)
        } else {
            pizzas.append(knot)
        }
    }
    func deleteGarlicKnotAtIndex(index: Int) {
        garlicKnots.removeAtIndex(index)
    }
    func getKnotsForSection() -> Int {
        return garlicKnots.count///3
    }
    func knotsItemAtIndex(index: Int) -> FoodItem {
        return garlicKnots[index]
    }
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
    //MARK:- Salads
    func getSalads() -> [FoodItem]{
        return salads
    }
    func addSalads(salad: FoodItem, index: Int) {
        if (salads.count >= index) {
            salads.insert(salad, atIndex: index)
        } else {
            pizzas.append(salad)
        }
    }
    func deleteSaladAtIndex(index: Int) {
        garlicKnots.removeAtIndex(index)
    }
    func getSaladForSection() -> Int {
        return salads.count///3
    }
    func saladItemAtIndex(index: Int) -> FoodItem {
        return salads[index]
    }
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
    //MARK:- Beverages
    func getDrinks() -> [FoodItem]{
        return beverages
    }
    func addDrinks(drink: FoodItem, index: Int) {
        if (beverages.count >= index) {
            beverages.insert(drink, atIndex: index)
        } else {
            beverages.append(drink)
        }
    }
    func deleteDrinkAtIndex(index: Int) {
        beverages.removeAtIndex(index)
    }
    func drinkItemAtIndex(index: Int) -> FoodItem {
        return beverages[index]
    }
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
    //MARK:- Desserts
    func getDesserts() -> [FoodItem]{
        return desserts
    }
    func getDrinksForSection() -> Int {
        return beverages.count///3
    }
    func addDessert(aDessert: FoodItem, index: Int) {
        if (desserts.count >= index) {
            beverages.insert(aDessert, atIndex: index)
        } else {
            desserts.append(aDessert)
        }
    }
    func deleteDessertAtIndex(index: Int) {
        desserts.removeAtIndex(index)
    }
    func getDessertForSection() -> Int {
        return desserts.count///3
    }
    func dessertItemAtIndex(index: Int) -> FoodItem {
        return desserts[index]
    }
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
    //MARK:- All Items
    func getAllFoodItems() -> [FoodItem]{
        return allFoodItems
     }
    func getAllFoodItemsCount() -> Int{
        return allFoodItems.count
    }
   
    }
