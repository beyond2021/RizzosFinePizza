//
//  DataStructure.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/11/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation
class DataStructure: NSObject {
    //  private var allPlain = FoodItem(title: "", itemDescription: "", originalPrice: 0.00)
    
    private var pizzas = [FoodItem]()
    private var calzones   = [FoodItem]()
    private var garlicKnots   = [FoodItem]()
    private var salads   = [FoodItem]()
    private var beverages   = [FoodItem]()
    private var desserts   = [FoodItem]()
    
    
    
    
    private var plainPizzas = [FoodItem]()
    private var createYourOwn = [FoodItem]()
    // private var speciality = [[(String,String,Double)]]()
    private var speciality  = [FoodItem]()
    private var allFoodItems = [[FoodItem]]()
    
    //    private var pizzas : [Any]  = [[[(String,String,Double)]](),[FoodItem](),[FoodItem]()]
    //
    /*
     private var americana : FoodItem?
     private var aummaAumma : FoodItem?
     private var bandiera : FoodItem?
     private var cafona : FoodItem?
     private var capponata : FoodItem?
     private var carnosa : FoodItem?
     private var contadina : FoodItem?
     private var cortese : FoodItem?
     private var diavola : FoodItem?
     private var ditta : FoodItem?
     private var forzuta : FoodItem?
     private var francesco : FoodItem?
     private var fantasia : FoodItem?
     private var giardino : FoodItem?
     private var golosa : FoodItem?
     private var greca : FoodItem?
     private var gustosa : FoodItem?
     private var mafiosa : FoodItem?
     private var margherita : FoodItem?
     private var marinara : FoodItem?
     private var nessa : FoodItem?
     private var parmigiana : FoodItem?
     private var primavera : FoodItem?
     private var puttanesca : FoodItem?
     private var quattroFormaggi : FoodItem?
     private var rustica : FoodItem?
     private var sottoSopra : FoodItem?
     private var spagnola : FoodItem?
     private var verdura : FoodItem?
     */
    
    //
    
    
    
    //
    //
    //
    
    
    
    
    private let PizzettaNutella = FoodItem(title:"Pizzetta Nutella",itemDescription:"Mini thin crust pizza topped with Italy’s favorite rich chocolate hazelnut cream.",originalPrice :[4.00])
    private let HomemadeCanoli = FoodItem(title:"Homemade Canoli",itemDescription:"A six pack of flaky pastry shells filled with our own homemade sweet vanilla cream.",originalPrice :[4.00])
    
    
    
    
    
    
    
    override init() {
        /*
         let PersonalRound = FoodItem(title:"Plain Personal Round",itemDescription: "Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice : 12.00)
         let LargeRound = FoodItem(title:"Plain Large Round",itemDescription: "Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice :19.00)
         let LargeSquare = FoodItem(title:"Plain Large Round",itemDescription: "Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice :19.00)
         //    plainPizzas = [PersonalRound,LargeRound,LargeSquare]
         */
        
        
        plainPizzas = [FoodItem(title:"Plain ",itemDescription: "Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice : [12.00,19.00,19.00])]
        
        
        
        
        /*
         let CYOPersonalRound = FoodItem(title:"CYO Personal Round",itemDescription: "Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice : 12.00)
         let CYOLargeRound = FoodItem(title:"CYO Large Round",itemDescription: "Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice :19.00)
         let CYOLargeSquare = FoodItem(title:"CYO Large Square",itemDescription: "Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice :19.00)
         // createYourOwn = [CYOPersonalRound,CYOLargeRound,CYOLargeSquare]
         */
        
        createYourOwn = [FoodItem(title:"Create Your Own",itemDescription: "Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice : [12.00,19.00,19.00])]
        
        
        
        /*
         let AmericanaPersonalRound = FoodItem(title:"Americana* Personal Round",itemDescription:"Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice :15.00)
         let AmericanaLargeRound = FoodItem(title:"Americana* Large Round",itemDescription:"Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice :23.00)
         let AmericanaLargeSquare = FoodItem(title:"Americana* Large Square",itemDescription:"Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice :23.00)
         
         // americana = [AmericanaPersonalRound,AmericanaLargeRound,AmericanaLargeSquare]
         */
        let americana = FoodItem(title:"Americana*",itemDescription:"Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each.",originalPrice :[15.00,23.00,23.00])
        
        
        
        /*
         let AummaAummaPersonalRound = FoodItem(title:"Aumma Aumma Personal Round",itemDescription:"Sausage, meatball, ricotta, sauce, mozzarella",originalPrice :15.00)
         let AummaAummaLargeRound = FoodItem(title:"Aumma Aumma Large Round",itemDescription:"Sausage, meatball, ricotta, sauce, mozzarella",originalPrice :23.00)
         let AummaAummaLargeSquare = FoodItem(title:"Aumma Aumma Large Square",itemDescription:"Sausage, meatball, ricotta, sauce, mozzarella",originalPrice :23.00)
         //aummaAumma = [AummaAummaPersonalRound,AummaAummaLargeRound,AummaAummaLargeSquare]
         */
        let aummaAumma = FoodItem(title:"Aumma Aumma",itemDescription:"Sausage, meatball, ricotta, sauce, mozzarella",originalPrice :[15.00,23.00,23.00])
        
        /*
         let BandieraPersonalRound = FoodItem(title:"Bandiera Personal Round",itemDescription:"Spinach, fresh garlic, ricotta, sauce, mozzarella",originalPrice :15.00)
         let BandieraLargeRound = FoodItem(title:"Bandiera Large Round",itemDescription:"Spinach, fresh garlic, ricotta, sauce, mozzarella",originalPrice :23.00)
         let BandieraLargeSquare = FoodItem(title:"Bandiera Large Square",itemDescription:"Spinach, fresh garlic, ricotta, sauce, mozzarella",originalPrice :23.00)
         // bandiera = [BandieraPersonalRound,BandieraLargeRound,BandieraLargeSquare]
         */
        
        let bandiera = FoodItem(title:"Bandiera ",itemDescription:"Spinach, fresh garlic, ricotta, sauce, mozzarella",originalPrice :[15.00,23.00,23.00])
        /*
         let CafonaPersonalRound = FoodItem(title:"Cafona Personal Round",itemDescription:"Ricotta, pepperoni, sauce, mozzarella",originalPrice :15.00)
         let CafonaLargeRound = FoodItem(title:"Cafona Large Round",itemDescription:"Ricotta, pepperoni, sauce, mozzarella",originalPrice :23.00)
         let CafonaLargeSquare = FoodItem(title:"Cafona Large Square",itemDescription:"Ricotta, pepperoni, sauce, mozzarella",originalPrice :23.00)
         
         cafona = [CafonaPersonalRound,CafonaLargeRound,CafonaLargeSquare]
         */
        let cafona = FoodItem(title:"Cafona ",itemDescription:"Ricotta, pepperoni, sauce, mozzarella",originalPrice :[15.00,23.00,23.00])
        
        
        
        /*
         let CapponataPersonalRound = FoodItem(title:"Capponata Personal Round",itemDescription:"Eggplant, red onion, black & green olive, caper, sauce, mozzarella",originalPrice :15.00)
         let CapponataLargeRound = FoodItem(title:"Capponata Large Round",itemDescription:"Eggplant, red onion, black & green olive, caper, sauce, mozzarella",originalPrice :23.00)
         let CapponataLargeSquare = FoodItem(title:"Capponata Large Square",itemDescription:"Eggplant, red onion, black & green olive, caper, sauce, mozzarella",originalPrice :23.00)
         
         capponata = [CapponataPersonalRound,CapponataLargeRound,CapponataLargeSquare]
         */
        let capponata = FoodItem(title:"Capponata",itemDescription:"Eggplant, red onion, black & green olive, caper, sauce, mozzarella",originalPrice :[15.00,23.00,23.00])
        
        /*
         let CarnosaPersonalRound = FoodItem(title:"Carnosa Personal Round",itemDescription:"Meatball, bacon, pepperoni, grilled chicken, sausage, sauce, mozzarella.",originalPrice :15.00)
         let CarnosaLargeRound = FoodItem(title:"Carnosa Large Round",itemDescription:"Meatball, bacon, pepperoni, grilled chicken, sausage, sauce, mozzarella.",originalPrice :23.00)
         let CarnosaLargeSquare = FoodItem(title:"Carnosa Large Square",itemDescription:"Meatball, bacon, pepperoni, grilled chicken, sausage, sauce, mozzarella.",originalPrice :23.00)
         
         carnosa = [CarnosaPersonalRound,CarnosaLargeRound,CarnosaLargeSquare]
         */
        let carnosa = FoodItem(title:"Carnosa",itemDescription:"Meatball, bacon, pepperoni, grilled chicken, sausage, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        
        /*
         
         let ContadinaPersonalRound = FoodItem(title:"Contadina Personal Round",itemDescription:"Grilled chicken, plum tomato, bacon, red onion, sauce, mozzarella.",originalPrice :15.00)
         let ContadinaLargeRound = FoodItem(title:"Contadina Large Round",itemDescription:"Grilled chicken, plum tomato, bacon, red onion, sauce, mozzarella.",originalPrice :23.00)
         let ContadinaLargeSquare = FoodItem(title:"Contadina Large Square",itemDescription:"Grilled chicken, plum tomato, bacon, red onion, sauce, mozzarella.",originalPrice :23.00)
         contadina = [ContadinaPersonalRound,ContadinaLargeRound,ContadinaLargeSquare]
         */
        let contadina = FoodItem(title:"Contadina Personal Round",itemDescription:"Grilled chicken, plum tomato, bacon, red onion, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        /*
         let CortesePersonalRound = FoodItem(title:"Cortese* Personal Round",itemDescription:"Ricotta, plum tomato, basil pesto, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :15.00)
         let CorteseLargeRound = FoodItem(title:"Cortese* Large Round",itemDescription:"Ricotta, plum tomato, basil pesto, mozzarella.Not made with tomato sauce, unless requested.",originalPrice :23.00)
         let CorteseLargeSquare = FoodItem(title:"Cortese* Large Square",itemDescription:"Ricotta, plum tomato, basil pesto, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :23.00)
         cortese = [CortesePersonalRound,CorteseLargeRound,CorteseLargeSquare]
         */
        let cortese = FoodItem(title:"Cortese*",itemDescription:"Ricotta, plum tomato, basil pesto, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :[15.00,23.00,23.00])
        
        
        /*
         let DiavolaPersonalRound = FoodItem(title:"Diavola* Personal Round",itemDescription:"Grilled chicken, red onion, bacon, award-winning BBQ sauce, hot sauce, parmigiano aioli, mozzarella.",originalPrice :15.00)
         let DiavolaLargeRound = FoodItem(title:"Diavola* Large Round",itemDescription:"Grilled chicken, red onion, bacon, award-winning BBQ sauce, hot sauce, parmigiano aioli, mozzarella.",originalPrice :23.00)
         let DiavolaLargeSquare = FoodItem(title:"Diavola* Large Square",itemDescription:"Grilled chicken, red onion, bacon, award-winning BBQ sauce, hot sauce, parmigiano aioli, mozzarella.",originalPrice :23.00)
         
         diavola = [DiavolaPersonalRound,DiavolaLargeRound,DiavolaLargeSquare]
         */
        let diavola = FoodItem(title:"Diavola*",itemDescription:"Grilled chicken, red onion, bacon, award-winning BBQ sauce, hot sauce, parmigiano aioli, mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        /*
         
         let DittaPersonalRound = FoodItem(title:"Ditta Personal Round",itemDescription:"Sausage, mushroom, pepperoni, pesto, bacon, sauce, mozzarella.",originalPrice :15.00)
         let DittaLargeRound = FoodItem(title:"Ditta Large Round",itemDescription:"Sausage, mushroom, pepperoni, pesto, bacon, sauce, mozzarella.",originalPrice :23.00)
         let DittaLargeSquare = FoodItem(title:"Ditta Large Square",itemDescription:"Sausage, mushroom, pepperoni, pesto, bacon, sauce, mozzarella.",originalPrice :23.00)
         ditta = [DittaPersonalRound,DittaLargeRound,DittaLargeSquare]
         */
        
        let ditta = FoodItem(title:"Ditta Personal Round",itemDescription:"Sausage, mushroom, pepperoni, pesto, bacon, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        
        
        /*
         let FantasiaPersonalRound = FoodItem(title:"Fantasia* Personal Round",itemDescription:"Basil pesto, ricotta, roasted pepper, black olive, marinated mushroom, mozzarella. Not made with tomato sauce, unless requested..",originalPrice :15.00)
         let FantasiaLargeRound = FoodItem(title:"Fantasia* Large Round",itemDescription:"Basil pesto, ricotta, roasted pepper, black olive, marinated mushroom, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :23.00)
         let FantasiaLargeSquare = FoodItem(title:"Fantasia* Large Square",itemDescription:"Basil pesto, ricotta, roasted pepper, black olive, marinated mushroom, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :23.00)
         fantasia = [FantasiaPersonalRound,FantasiaLargeRound,FantasiaLargeSquare]
         */
        let fantasia = FoodItem(title:"Fantasia*",itemDescription:"Basil pesto, ricotta, roasted pepper, black olive, marinated mushroom, mozzarella. Not made with tomato sauce, unless requested..",originalPrice :[15.00,23.00,23.00])
        
        /*
         let ForzutaPersonalRound = FoodItem(title:"Forzuta Personal Round",itemDescription:"Sausage, bell pepper, red onion, sauce, mozzarella.",originalPrice :15.00)
         let ForzutaLargeRound = FoodItem(title:"Forzuta Large Round",itemDescription:"Sausage, bell pepper, red onion, sauce, mozzarella.",originalPrice :23.00)
         let ForzutaLargeSquare = FoodItem(title:"Forzuta Large Square",itemDescription:"Sausage, bell pepper, red onion, sauce, mozzarella.",originalPrice :23.00)
         forzuta = [ForzutaPersonalRound,ForzutaLargeRound,ForzutaLargeSquare]
         */
        let forzuta = FoodItem(title:"Forzuta",itemDescription:"Sausage, bell pepper, red onion, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        /*
         let FrancescoPersonalRound = FoodItem(title:"Francesco* Personal Round",itemDescription:"Grilled chicken, plum tomato, black olive, basil pesto, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :15.00)
         let FrancescoLargeRound = FoodItem(title:"Francesco* Large Round",itemDescription:"Grilled chicken, plum tomato, black olive, basil pesto, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :23.00)
         let FrancescoLargeSquare = FoodItem(title:"Francesco* Large Square",itemDescription:"Grilled chicken, plum tomato, black olive, basil pesto, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :23.00)
         francesco = [FrancescoPersonalRound,FrancescoLargeRound,FrancescoLargeSquare]
         */
        let francesco = FoodItem(title:"Francesco*",itemDescription:"Grilled chicken, plum tomato, black olive, basil pesto, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :[15.00,23.00,23.00])
        
        
        /*
         let GiardinoPersonalRound = FoodItem(title:"Giardino Personal Round",itemDescription:"Bell pepper, marinated mushroom, red onion, fresh garlic, plum tomato, black olive, sauce, mozzarella.",originalPrice :15.00)
         let GiardinoLargeRound = FoodItem(title:"Giardino Large Round",itemDescription:"Bell pepper, marinated mushroom, red onion, fresh garlic, plum tomato, black olive, sauce, mozzarella.",originalPrice :23.00)
         let GiardinoLargeSquare = FoodItem(title:"Giardino Large Square",itemDescription:"Bell pepper, marinated mushroom, red onion, fresh garlic, plum tomato, black olive, sauce, mozzarella.",originalPrice :23.00)
         
         giardino = [GiardinoPersonalRound,GiardinoLargeRound,GiardinoLargeSquare]
         */
        let giardino = FoodItem(title:"Giardino",itemDescription:"Bell pepper, marinated mushroom, red onion, fresh garlic, plum tomato, black olive, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        
        /*
         let GolosaPersonalRound = FoodItem(title:"Golosa* Personal Round",itemDescription:"Grilled chicken, marinated mushroom, spinach, bacon, red onion, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :15.00)
         let GolosaLargeRound = FoodItem(title:"Golosa* Large Round",itemDescription:"Grilled chicken, marinated mushroom, spinach, bacon, red onion, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :23.00)
         let GolosaLargeSquare = FoodItem(title:"Golosa* Large Square",itemDescription:"Grilled chicken, marinated mushroom, spinach, bacon, red onion, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :23.00)
         
         golosa = [GolosaPersonalRound,GolosaLargeRound,GolosaLargeSquare]
         */
        let golosa = FoodItem(title:"Golosa* Personal Round",itemDescription:"Grilled chicken, marinated mushroom, spinach, bacon, red onion, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :[15.00,23.00,23.00])
        
        /*
         let GrecaPersonalRound = FoodItem(title:"Greca* Personal Round",itemDescription:"Spinach, ricotta, fresh garlic, red onion, mozzarella.  Not made with tomato sauce, unless requested.",originalPrice :15.00)
         let GrecaLargeRound = FoodItem(title:"Greca* Large Round",itemDescription:"Spinach, ricotta, fresh garlic, red onion, mozzarella. Not made with tomato sauce, unless requested.",originalPrice :23.00)
         let GrecaLargeSquare = FoodItem(title:"Greca* Large Square",itemDescription:"Spinach, ricotta, fresh garlic, red onion, mozzarella.  Not made with tomato sauce, unless requested.",originalPrice :23.00)
         greca = [GrecaPersonalRound,GrecaLargeRound,GrecaLargeSquare]
         */
        let greca = FoodItem(title:"Greca*",itemDescription:"Spinach, ricotta, fresh garlic, red onion, mozzarella.  Not made with tomato sauce, unless requested.",originalPrice :[15.00,23.00,23.00])
        
        /*
         let GustosaPersonalRound = FoodItem(title:"Gustosa Personal Round",itemDescription:"Eggplant, roasted pepper, basil pesto, sauce, fresh mozzarella.",originalPrice :15.00)
         let GustosaLargeRound = FoodItem(title:"Gustosa Large Round",itemDescription:"Eggplant, roasted pepper, basil pesto, sauce, fresh mozzarella.",originalPrice :23.00)
         let GustosaLargeSquare = FoodItem(title:"Gustosa Large Square",itemDescription:"Eggplant, roasted pepper, basil pesto, sauce, fresh mozzarella.",originalPrice :23.00)
         gustosa = [GustosaPersonalRound,GustosaLargeRound,GustosaLargeSquare]
         */
        let gustosa = FoodItem(title:"Gustosa",itemDescription:"Eggplant, roasted pepper, basil pesto, sauce, fresh mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        /*
         
         let MafiosaPersonalRound = FoodItem(title:"Mafiosa Personal Round",itemDescription:"Sausage, roasted pepper, black & green olive, caper, sauce, mozzarella.",originalPrice :15.00)
         let MafiosaLargeRound = FoodItem(title:"Mafiosa Large Round",itemDescription:"Sausage, roasted pepper, black & green olive, caper, sauce, mozzarella.",originalPrice :23.00)
         let MafiosaLargeSquare = FoodItem(title:"Mafiosa Large Square",itemDescription:"Sausage, roasted pepper, black & green olive, caper, sauce, mozzarella.",originalPrice :23.00)
         mafiosa = [MafiosaPersonalRound,MafiosaLargeRound,MafiosaLargeSquare]
         */
        let mafiosa = FoodItem(title:"Mafiosa Personal Round",itemDescription:"Sausage, roasted pepper, black & green olive, caper, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        
        /*
         let MargheritaPersonalRound = FoodItem(title:"Margherita Personal Round",itemDescription:"Plum tomato, red onion, sauce, fresh basil & mozzarella.",originalPrice :15.00)
         let MargheritaLargeRound = FoodItem(title:"Margherita Large Round",itemDescription:"Plum tomato, red onion, sauce, fresh basil & mozzarella.",originalPrice :23.00)
         let MargheritaLargeSquare = FoodItem(title:"Margherita Large Square",itemDescription:"Plum tomato, red onion, sauce, fresh basil & mozzarella.",originalPrice :23.00)
         margherita = [MargheritaPersonalRound,MargheritaLargeRound,MargheritaLargeSquare]
         */
        let margherita = FoodItem(title:"Margherita",itemDescription:"Plum tomato, red onion, sauce, fresh basil & mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        /*
         let MarinaraPersonalRound = FoodItem(title:"Marinara Personal Round",itemDescription:"Toasted anchovy, fresh garlic, caper, oregano, sauce, fresh mozzarella.",originalPrice :15.00)
         let MarinaraLargeRound = FoodItem(title:"Marinara Large Round",itemDescription:"Toasted anchovy, fresh garlic, caper, oregano, sauce, fresh mozzarella.",originalPrice :23.00)
         let MarinaraLargeSquare = FoodItem(title:"Marinara Large Square",itemDescription:"Toasted anchovy, fresh garlic, caper, oregano, sauce, fresh mozzarella.",originalPrice :23.00)
         marinara = [MarinaraPersonalRound,MarinaraLargeRound,MarinaraLargeSquare]
         */
        let marinara = FoodItem(title:"Marinara",itemDescription:"Toasted anchovy, fresh garlic, caper, oregano, sauce, fresh mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        /*
         let NessaPersonalRound = FoodItem(title:"Nessa Personal Round",itemDescription:"Bacon, red onions, fresh basil, sauce, mozzarella, parmigiano aioli.",originalPrice :15.00)
         let NessaLargeRound = FoodItem(title:"Nessa Large Round",itemDescription:"Bacon, red onions, fresh basil, sauce, mozzarella, parmigiano aioli",originalPrice :23.00)
         let NessaLargeSquare = FoodItem(title:"Nessa Large Square",itemDescription:"Bacon, red onions, fresh basil, sauce, mozzarella, parmigiano aioli.",originalPrice :23.00)
         nessa = [NessaPersonalRound,NessaLargeRound,NessaLargeSquare]
         */
        let nessa = FoodItem(title:"Nessa Personal Round",itemDescription:"Bacon, red onions, fresh basil, sauce, mozzarella, parmigiano aioli.",originalPrice :[15.00,23.00,23.00])
        
        /*
         let ParmigianaPersonalRound = FoodItem(title:"Parmigiana Personal Round",itemDescription:"Eggplant, fresh basil, garlic & mozzarella, ricotta.",originalPrice :15.00)
         let ParmigianaLargeRound = FoodItem(title:"Parmigiana Large Round",itemDescription:"Eggplant, fresh basil, garlic & mozzarella, ricotta.",originalPrice :23.00)
         let ParmigianaLargeSquare = FoodItem(title:"Parmigiana Large Square",itemDescription:"Eggplant, fresh basil, garlic & mozzarella, ricotta.",originalPrice :23.00)
         parmigiana = [ParmigianaPersonalRound,ParmigianaLargeRound,ParmigianaLargeSquare]
         */
        let parmigiana = FoodItem(title:"Parmigiana",itemDescription:"Eggplant, fresh basil, garlic & mozzarella, ricotta.",originalPrice :[15.00,23.00,23.00])
        
        
        /*
         let PrimaveraPersonalRound = FoodItem(title:"Primavera Personal Round",itemDescription:"Spinach, fresh garlic, roasted pepper, red onion, black olive, sauce, fresh mozzarella.",originalPrice :15.00)
         let PrimaveraLargeRound = FoodItem(title:"Primavera Large Round",itemDescription:"Spinach, fresh garlic, roasted pepper, red onion, black olive, sauce, fresh mozzarella.",originalPrice :23.00)
         let PrimaveraLargeSquare = FoodItem(title:"Primavera Large Square",itemDescription:"Spinach, fresh garlic, roasted pepper, red onion, black olive, sauce, fresh mozzarella.",originalPrice :23.00)
         primavera = [PrimaveraPersonalRound,PrimaveraLargeRound,PrimaveraLargeSquare]
         */
        let primavera = FoodItem(title:"Primavera",itemDescription:"Spinach, fresh garlic, roasted pepper, red onion, black olive, sauce, fresh mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        /*
         let PuttanescaPersonalRound = FoodItem(title:"Puttanesca Personal Round",itemDescription:"Marinated mushroom, roasted pepper, red onion, black & green olive, caper, sauce, mozzarella.",originalPrice :15.00)
         let PuttanescaLargeRound = FoodItem(title:"Puttanesca Large Round",itemDescription:"Marinated mushroom, roasted pepper, red onion, black & green olive, caper, sauce, mozzarella.",originalPrice :23.00)
         let PuttanescaLargeSquare = FoodItem(title:"Puttanesca Large Square",itemDescription:"Marinated mushroom, roasted pepper, red onion, black & green olive, caper, sauce, mozzarella.",originalPrice :23.00)
         puttanesca = [PuttanescaPersonalRound,PuttanescaLargeRound,PuttanescaLargeSquare]
         */
        let puttanesca = FoodItem(title:"Puttanesca",itemDescription:"Marinated mushroom, roasted pepper, red onion, black & green olive, caper, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        
        /*
         let QuattroFormaggiPersonalRound = FoodItem(title:"Quattro Formaggi* Personal Round",itemDescription:"Ricotta, mozzarella, romano, fresh garlic, herbs, parmigiano aioli. Not made with tomato sauce, unless requested.",originalPrice :15.00)
         let QuattroFormaggiLargeRound = FoodItem(title:"Quattro Formaggi* Large Round",itemDescription:"Ricotta, mozzarella, romano, fresh garlic, herbs, parmigiano aioli. Not made with tomato sauce, unless requested.",originalPrice :23.00)
         let QuattroFormaggiLargeSquare = FoodItem(title:"Quattro Formaggi* Large Square",itemDescription:"Ricotta, mozzarella, romano, fresh garlic, herbs, parmigiano aioli. Not made with tomato sauce, unless requested.",originalPrice :23.00)
         quattroFormaggi = [QuattroFormaggiPersonalRound,QuattroFormaggiLargeRound,QuattroFormaggiLargeSquare]
         */
        let quattroFormaggi = FoodItem(title:"Quattro Formaggi*",itemDescription:"Ricotta, mozzarella, romano, fresh garlic, herbs, parmigiano aioli. Not made with tomato sauce, unless requested.",originalPrice :[15.00,23.00,23.00])
        
        
        /*
         let RusticaPersonalRound = FoodItem(title:"Rustica Personal Round",itemDescription:"Toasted anchovy, black olive, fresh garlic, caper, red onion, sauce, mozzarella.",originalPrice :15.00)
         let RusticaLargeRound = FoodItem(title:"Rustica Large Round",itemDescription:"Toasted anchovy, black olive, fresh garlic, caper, red onion, sauce, mozzarella.",originalPrice :23.00)
         let RusticaLargeSquare = FoodItem(title:"Rustica Large Square",itemDescription:"Toasted anchovy, black olive, fresh garlic, caper, red onion, sauce, mozzarella.",originalPrice :23.00)
         rustica = [RusticaPersonalRound,RusticaLargeRound,RusticaLargeSquare]
         */
        let rustica = FoodItem(title:"Rustica",itemDescription:"Toasted anchovy, black olive, fresh garlic, caper, red onion, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        /*
         let SottoSopraPersonalRound = FoodItem(title:"Sotto Sopra Personal Round",itemDescription:"Fresh garlic, ricotta, oregano, sauce, mozzarella.",originalPrice :15.00)
         let SottoSopraLargeRound = FoodItem(title:"Sotto Sopra Large Round",itemDescription:"Fresh garlic, ricotta, oregano, sauce, mozzarella.",originalPrice :23.00)
         let SottoSopraLargeSquare = FoodItem(title:"Sotto Sopra Large Square",itemDescription:"Fresh garlic, ricotta, oregano, sauce, mozzarella.",originalPrice :23.00)
         sottoSopra = [SottoSopraPersonalRound,SottoSopraLargeRound,SottoSopraLargeSquare]
         */
        let sottoSopra = FoodItem(title:"Sotto Sopra",itemDescription:"Fresh garlic, ricotta, oregano, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        /*
         
         let SpagnolaPersonalRound = FoodItem(title:"Spagnola Personal Round",itemDescription:"Pepperoni, green olive, red onion, roasted pepper, sauce, mozzarella.",originalPrice :15.00)
         let SpagnolaLargeRound = FoodItem(title:"Spagnola Sopra Large Round",itemDescription:"Pepperoni, green olive, red onion, roasted pepper, sauce, mozzarella.",originalPrice :23.00)
         let SpagnolaLargeSquare = FoodItem(title:"Spagnola Sopra Large Square",itemDescription:"Pepperoni, green olive, red onion, roasted pepper, sauce, mozzarella.",originalPrice :23.00)
         spagnola = [SpagnolaPersonalRound,SpagnolaLargeRound,SpagnolaLargeSquare]
         */
        let spagnola = FoodItem(title:"Spagnola",itemDescription:"Pepperoni, green olive, red onion, roasted pepper, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        /*
         let VerduraPersonalRound = FoodItem(title:"Verdura* Personal Round",itemDescription:"Pepperoni, green olive, red onion, roasted pepper, sauce, mozzarella.",originalPrice :15.00)
         let VerduraLargeRound = FoodItem(title:"Verdura* Large Round",itemDescription:"Pepperoni, green olive, red onion, roasted pepper, sauce, mozzarella.",originalPrice :23.00)
         let VerduraLargeSquare = FoodItem(title:"Verdura* Large Square",itemDescription:"Pepperoni, green olive, red onion, roasted pepper, sauce, mozzarella.",originalPrice :23.00)
         
         verdura = [VerduraPersonalRound,VerduraLargeRound,VerduraLargeSquare]
         */
        let verdura = FoodItem(title:"Verdura* Personal Round",itemDescription:"Pepperoni, green olive, red onion, roasted pepper, sauce, mozzarella.",originalPrice :[15.00,23.00,23.00])
        
        //        speciality = [Americana,AummaAumma,Bandiera,Cafona,Capponata,Carnosa,Contadina,Cortese,Diavola,Ditta,Fantasia,Forzuta,Francesco,Giardino,Golosa,Greca,Gustosa,Mafiosa,Margherita,Marinara,Nessa,Parmigiana,Primavera,Puttanesca,QuattroFormaggi,Rustica,SottoSopra,Spagnola,Verdura]
        
        
        /*
         pizzas = [PersonalRound,LargeRound,LargeSquare,CYOPersonalRound,CYOLargeRound,CYOLargeSquare,AmericanaPersonalRound,AmericanaLargeRound,AmericanaLargeSquare,AummaAummaPersonalRound,AummaAummaLargeRound,AummaAummaLargeSquare,BandieraPersonalRound,BandieraLargeRound,BandieraLargeSquare,CafonaPersonalRound,CafonaLargeRound,CafonaLargeSquare,CapponataPersonalRound,CapponataLargeRound,CapponataLargeSquare,CarnosaPersonalRound,CarnosaLargeRound,CarnosaLargeSquare,ContadinaPersonalRound,ContadinaLargeRound,ContadinaLargeSquare,CortesePersonalRound,CorteseLargeRound,CorteseLargeSquare,DiavolaPersonalRound,DiavolaLargeRound,DiavolaLargeSquare,DittaPersonalRound,DittaLargeRound,DittaLargeSquare,FantasiaPersonalRound,FantasiaLargeRound,FantasiaLargeSquare,ForzutaPersonalRound,ForzutaPersonalRound,ForzutaLargeRound,ForzutaLargeSquare,FrancescoPersonalRound,FrancescoLargeRound,FrancescoLargeSquare,GiardinoPersonalRound,GiardinoLargeRound,GiardinoLargeSquare,GolosaPersonalRound,GolosaLargeRound,GolosaLargeSquare,GrecaPersonalRound,GrecaLargeRound,GrecaLargeSquare,GustosaPersonalRound,GustosaLargeRound,GustosaLargeSquare,MafiosaPersonalRound,MafiosaLargeRound,MafiosaLargeSquare,MargheritaPersonalRound,MargheritaLargeRound,MargheritaLargeSquare,MarinaraPersonalRound,MargheritaLargeRound,MargheritaLargeSquare,MarinaraPersonalRound,MarinaraLargeRound,MarinaraLargeSquare,NessaPersonalRound,NessaLargeRound,NessaLargeSquare,ParmigianaPersonalRound,ParmigianaLargeRound,ParmigianaLargeSquare,PrimaveraPersonalRound,PrimaveraLargeRound,PrimaveraLargeSquare,PuttanescaPersonalRound,PuttanescaLargeRound,PuttanescaLargeSquare,QuattroFormaggiPersonalRound,QuattroFormaggiLargeRound,QuattroFormaggiLargeSquare,RusticaPersonalRound,RusticaLargeRound,RusticaLargeSquare,SottoSopraPersonalRound,SottoSopraLargeRound,SottoSopraLargeSquare,SpagnolaPersonalRound,SpagnolaLargeRound,SpagnolaLargeSquare,VerduraPersonalRound,VerduraLargeRound,VerduraLargeSquare]
         
         */
        /*
         pizzas = [plainPizzas,createYourOwn!,americana!,aummaAumma!,bandiera!,cafona!,capponata!,carnosa!,contadina!,cortese!,diavola!,ditta!,fantasia!,forzuta!,francesco!,giardino!,golosa!,greca!,gustosa!,mafiosa!,margherita!,marinara!,nessa!,parmigiana!,primavera!,puttanesca!,quattroFormaggi!,rustica!,sottoSopra!,spagnola!,verdura!]
         */
        
        /*
         speciality = [AmericanaPersonalRound,AmericanaLargeRound,AmericanaLargeSquare,AummaAummaPersonalRound,AummaAummaLargeRound,AummaAummaLargeSquare,BandieraPersonalRound,BandieraLargeRound,BandieraLargeSquare,CafonaPersonalRound,CafonaLargeRound,CafonaLargeSquare,CapponataPersonalRound,CapponataLargeRound,CapponataLargeSquare,CarnosaPersonalRound,CarnosaLargeRound,CarnosaLargeSquare,ContadinaPersonalRound,ContadinaLargeRound,ContadinaLargeSquare,CortesePersonalRound,CorteseLargeRound,CorteseLargeSquare,DiavolaPersonalRound,DiavolaLargeRound,DiavolaLargeSquare,DittaPersonalRound,DittaLargeRound,DittaLargeSquare,FantasiaPersonalRound,FantasiaLargeRound,FantasiaLargeSquare,ForzutaPersonalRound,ForzutaPersonalRound,ForzutaLargeRound,ForzutaLargeSquare,FrancescoPersonalRound,FrancescoLargeRound,FrancescoLargeSquare,GiardinoPersonalRound,GiardinoLargeRound,GiardinoLargeSquare,GolosaPersonalRound,GolosaLargeRound,GolosaLargeSquare,GrecaPersonalRound,GrecaLargeRound,GrecaLargeSquare,GustosaPersonalRound,GustosaLargeRound,GustosaLargeSquare,MafiosaPersonalRound,MafiosaLargeRound,MafiosaLargeSquare,MargheritaPersonalRound,MargheritaLargeRound,MargheritaLargeSquare,MarinaraPersonalRound,MargheritaLargeRound,MargheritaLargeSquare,MarinaraPersonalRound,MarinaraLargeRound,MarinaraLargeSquare,NessaPersonalRound,NessaLargeRound,NessaLargeSquare,ParmigianaPersonalRound,ParmigianaLargeRound,ParmigianaLargeSquare,PrimaveraPersonalRound,PrimaveraLargeRound,PrimaveraLargeSquare,PuttanescaPersonalRound,PuttanescaLargeRound,PuttanescaLargeSquare,QuattroFormaggiPersonalRound,QuattroFormaggiLargeRound,QuattroFormaggiLargeSquare,RusticaPersonalRound,RusticaLargeRound,RusticaLargeSquare,SottoSopraPersonalRound,SottoSopraLargeRound,SottoSopraLargeSquare,SpagnolaPersonalRound,SpagnolaLargeRound,SpagnolaLargeSquare,VerduraPersonalRound,VerduraLargeRound,VerduraLargeSquare]
         */
        /*
         speciality = [americana!,aummaAumma!,bandiera!,cafona!,capponata!,carnosa!,contadina!,cortese!,diavola!,ditta!,fantasia!,forzuta!,francesco!,giardino!,golosa!,greca!,gustosa!,mafiosa!,margherita!,marinara!,nessa!,parmigiana!,primavera!,puttanesca!,quattroFormaggi!,rustica!,sottoSopra!,spagnola!,verdura!]
         */
        
        let createYourOwnCalzone = FoodItem(title:"Create Your Own",itemDescription:"Create Your Own with any 3 items from our list of toppings.",originalPrice :[9.00])
        let chickenCalzone = FoodItem(title:"Chicken",itemDescription:"Ricotta, Mozzarella, Parmigiano, Romano and Grilled Chicken.",originalPrice :[9.00])
        let sausageCalzone = FoodItem(title:"Sausage",itemDescription:"Ricotta, Mozzarella, Parmigiano, Romano and Sausage.",originalPrice :[9.00])
        let meatballCalzone = FoodItem(title:"Meatball",itemDescription:"Ricotta, Mozzarella, Parmigiano, Romano and Meatball.",originalPrice :[9.00])
        let pepperoniCalzone = FoodItem(title:"Pepperoni",itemDescription:"Ricotta, Mozzarella, Parmigiano, Romano and Pepperoni.",originalPrice :[9.00])
        
        calzones = [createYourOwnCalzone,chickenCalzone,sausageCalzone,meatballCalzone,pepperoniCalzone]
        
        
        let threePieceGalicKnots = FoodItem(title:"3 piecce Knots",itemDescription:"A fan favorite! Extra fluffy knots, tossed with fresh garlic, chopped parsley, a blend of grated cheeses & a touch of extra virgin olive oil.",originalPrice :[1.00])
        let sixPieceGalicKnots = FoodItem(title:"6 piecce Knots",itemDescription:"A fan favorite! Extra fluffy knots, tossed with fresh garlic, chopped parsley, a blend of grated cheeses & a touch of extra virgin olive oil.",originalPrice :[2.00])
        let twelvePieceGalicKnots = FoodItem(title:"9 piecce Knots",itemDescription:"A fan favorite! Extra fluffy knots, tossed with fresh garlic, chopped parsley, a blend of grated cheeses & a touch of extra virgin olive oil.",originalPrice :[3.00])
        garlicKnots = [threePieceGalicKnots,sixPieceGalicKnots,twelvePieceGalicKnots]
        
        // House Salad
        
        let houseSalad = FoodItem(title:"HouseSalad",itemDescription:"We start with the Simple Salad then add bell pepper, red onion & black olive.",originalPrice :[1.00])
        let caesarSalad = FoodItem(title:"CaesarSalad",itemDescription:"Homemade croutons, creamy dressing & our own blend of grated cheeses.",originalPrice :[2.00])
        let specialSalad = FoodItem(title:"SpecialSalad",itemDescription:"Baby spinach, marinated mushroom, roasted pepper, fresh mozzarella & herbed vinaigrette.",originalPrice :[3.00])
        let farmersSalad = FoodItem(title:"FarmersSalad",itemDescription:"Baby spinach, marinated mushroom, roasted pepper, fresh mozzarella & herbed vinaigrette.",originalPrice :[3.00])
        salads = [houseSalad,caesarSalad,specialSalad,farmersSalad]
        
        //Salads
        let cokeCan = FoodItem(title:"CokeCan",itemDescription:"An awesome can of coke.",originalPrice :[1.50])
        let dietCokeCan = FoodItem(title:"DietCokeCan",itemDescription:"A beautiful can of diet coke",originalPrice :[1.50])
        let spriteCan = FoodItem(title:"SpriteCan",itemDescription:"A thirst quenching can of sprite.",originalPrice :[1.50])
        let liptonBriskTeaCan = FoodItem(title:"LiptonBriskTeaCan",itemDescription:"A brisk can of Lipton Iced Tea.",originalPrice :[3.00])
        let bottledWater = FoodItem(title:"BottledWater",itemDescription:"A healthy bottle of water.",originalPrice :[1.50])
        
        beverages = [cokeCan,dietCokeCan,spriteCan,liptonBriskTeaCan,bottledWater]
        
        
        let pizzettaNutella = FoodItem(title:"Pizzetta Nutella",itemDescription:"Mini thin crust pizza topped with Italy’s favorite rich chocolate hazelnut cream.",originalPrice :[4.00])
        let homemadeCanoli = FoodItem(title:"Homemade Canoli",itemDescription:"A six pack of flaky pastry shells filled with our own homemade sweet vanilla cream.",originalPrice :[4.00])
        desserts = [pizzettaNutella,homemadeCanoli]
        
        // allFoodItems = [plainPizzas,createYourOwn,speciality,calzones,garlicKnots,salads,beverages,desserts]
        
    }
    
    //Plain Pizzas
    
    func getPlainPizzasForSection() -> Int {
        // return plainPizzas.count ///3
        return 1
    }
    
    
    func plainPizzaItemAtIndex(index: Int) -> FoodItem {
        
        return plainPizzas[index]
        
    }
    func getPlainPizzas() -> [FoodItem]{
        return plainPizzas
        
    }
    func getPizza() -> [FoodItem]{
        return pizzas
        
    }
    
    func addPizza(pizza: FoodItem, index: Int) {
        if (pizzas.count >= index) {
            pizzas.insert(pizza, atIndex: index)
        } else {
            pizzas.append(pizza)
        }
    }
    
    func deletePizzaAtIndex(index: Int) {
        pizzas.removeAtIndex(index)
    }
    
    
    // Create Your Own Pizzas
    
    func getCYOPizzasForSection() -> Int {
        //    return createYourOwn.count///3
        return 1
        
    }
    func cyoPizzaItemAtIndex(index: Int) -> FoodItem {
        
        //   return createYourOwn[index]
        
        return createYourOwn[index]
    }
    func getCreateYourOwnPizzas()-> [FoodItem]{
        return createYourOwn
    }
    //
    
    func getSpecialityPizzasForSection() -> Int {
        return speciality.count///3
        
    }
    func specialityPizzaItemAtIndex(index: Int) -> FoodItem {
        
        return speciality[index]
        
    }
    func getSpecialityPizza() -> [FoodItem]{
        return speciality
    }
    //
    
    //
    func getCalzone() -> [FoodItem]{
        return calzones
        
    }
    func addCalzone(calzone: FoodItem, index: Int) {
        if (calzones.count >= index) {
            calzones.insert(calzone, atIndex: index)
        } else {
            pizzas.append(calzone)
        }
    }
    
    func deleteCalzoneAtIndex(index: Int) {
        calzones.removeAtIndex(index)
    }
    //
    
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
    
    //
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
    //
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
    //
    func getDesserts() -> [FoodItem]{
        return desserts
        
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
    
    //
    func getCalzoneForSection() -> Int {
        return calzones.count///3
        
    }
    func calzonesItemAtIndex(index: Int) -> FoodItem {
        
        return calzones[index]
        
    }
    
    func getKnotsForSection() -> Int {
        return garlicKnots.count///3
        
    }
    func knotsItemAtIndex(index: Int) -> FoodItem {
        
        return garlicKnots[index]
        
    }
    
    func getSaladForSection() -> Int {
        return salads.count///3
        
    }
    func saladItemAtIndex(index: Int) -> FoodItem {
        
        return salads[index]
        
    }
    
    func getDrinksForSection() -> Int {
        return beverages.count///3
        
    }
    func drinkItemAtIndex(index: Int) -> FoodItem {
        
        return beverages[index]
        
    }
    func getDessertForSection() -> Int {
        return desserts.count///3
        
    }
    func dessertItemAtIndex(index: Int) -> FoodItem {
        
        return desserts[index]
        
    }
    func getAllFoodItems() -> [[FoodItem]]{
        
        return allFoodItems
        
    }
}
