//
//  main.swift
//  swiftPractice
//
//  Created by StudentAM on 1/12/24.
//

import Foundation

//creating variables to hold the number of items
var milkItems : Int = 0;
var cerealItems : Int = 0;
var cupsItems : Int = 0;
var syrupItems : Int = 0;

//creating variables for the availabilty check0
var milkAvailabilty : Int = 100;
var cerealAvailabilty : Int = 100;
var cupsAvailabilty : Int = 100;
var syrupAvailabilty : Int = 100;

//creating variables containing the price of the items
let cerealPrice : Double = 2.99
let milkPrice : Double = 5.99
let syrupPrice : Double = 3.99
let cupsPrice : Double = 1.99

//    can't multiply a double and an int so, i turned the int variable into a double
//    I then stored the total price into a variable called total _ price
//stored it outside a function so i can use it for the other function
var totalCerealPrice = Double(cerealItems) * (cerealPrice)
var totalMilkPrice = Double(milkItems) * (milkPrice)
var totalSyrupPrice = Double(syrupItems) * (syrupPrice)
var totalCupsPrice = Double(cupsItems) * (cupsPrice)
    
var totalWOutTax = totalCupsPrice + totalMilkPrice + totalSyrupPrice + totalCerealPrice
    
var price = Double(totalWOutTax) * 1.0925

//creating them outside the function so i could use it on the genrate report function
var cerealStock =  cerealAvailabilty - cerealItems;
var milkStock =  milkAvailabilty - milkItems;
var syrupStock =  syrupAvailabilty - syrupItems;
var cupsStock =  cupsAvailabilty - cupsItems;

//creating variable to update the restock

var cerealRestock : Int = 0;
var milkRestock : Int = 0;
var syrupRestock : Int = 0;
var cupsRestock : Int = 0;

//let optionsSelected = 5

//making a function to hold the main display menu
func mainMenuDisplay(){
    print("Welcome to the grocery store! Lets us know how we can help you (Enter number of selection):")
    print("1.) Add item to cart")
    print( "2.) Remove item from cart")
    print( "3.) Check item availability in stock")
    print( "4.) Access Admin Menu")
    print( "5.) Checkout")
    
    //    if the userinput is succesfully stored run the displayAddMenu
    //        Only if it's equal to 1 though
    if let userInput = readLine(){
        if userInput == "1"{
            displayAddMenu()
        }
        //        if the user types 2, run the remove item function
        if userInput == "2"{
            removeItem()
        }
        if userInput == "3"{
        itemavAilabilty()
       }
        if userInput == "4"{
        adminPin()
       }
        if userInput == "5"{
        checkOut()
       }
    }
}


mainMenuDisplay()


//function to add
func displayAddMenu(){
         print ("What would you like to add to cart?")
         print ("1.) Cereal")
         print ("2.) Milk")
         print ("3.) Syrup")
         print ("4.) Cups")

    if let userInput = readLine(){
        //    if the user types 1 ask how many cereals they want to add to cart
        if userInput == "1"{
            print("How many cereal(s) would you like to add to your cart?: ")
          
//             storing  the quantity into the variable I created earlier
//            turning the string into a number
       //quantity = Int(userInput) this turn it into a number
            if let userInput = readLine(),let quantity = Int(userInput){
                 cerealItems += quantity
//                updatring the price
                totalCerealPrice = Double(cerealItems) * (cerealPrice)
//                taking the cereals in cart from stock
                cerealStock -= quantity
                totalWOutTax = totalCupsPrice + totalMilkPrice + totalSyrupPrice + totalCerealPrice
                print ("There are \(cerealItems) cereals in your cart")
                print ("Your current total is $\(String(format: "%.2f", totalWOutTax))")
                //                returning the user to the main display
                 return mainMenuDisplay()
            }
        }
        //    if the user types 2 ask how many milks they want to add to cart
        if userInput == "2"{
            print("How many milk(s) would you like to add to your cart?: ")
            if let userInput = readLine(),let quantity = Int(userInput){
                 milkItems += quantity
                milkStock -= quantity
                 totalMilkPrice = Double(milkItems) * (milkPrice)
                 totalWOutTax = totalCupsPrice + totalMilkPrice + totalSyrupPrice + totalCerealPrice
                print ("There are \(milkItems) milks in your cart")
                print ("Your current total is $\(String(format: "%.2f", totalWOutTax))")
                return mainMenuDisplay()
            }
        }
        //    if the user types 3 ask how many syrups they want to add to cart
        if userInput == "3"{
            print("How many syrup(s) would you like to add to your cart?: ")
            if let userInput = readLine(),let quantity = Int(userInput){
                 syrupItems += quantity
                syrupStock -= quantity
                totalSyrupPrice = Double(syrupItems) * (syrupPrice)
                totalWOutTax = totalCupsPrice + totalMilkPrice + totalSyrupPrice + totalCerealPrice
                print ("There are \(syrupItems) syrups in your cart")
                print ("Your current total is $\(String(format: "%.2f", totalWOutTax))")
                return mainMenuDisplay()
            }
        }
        //    if the user types 4 ask how many cups they want to add to cart
        if userInput == "4"{
            print("How many cup(s) would you like to add to your cart?: ")
            if let userInput = readLine(),let quantity = Int(userInput){
                 cupsItems += quantity
                cupsStock -= quantity
                totalCupsPrice = Double(cupsItems) * (cupsPrice)
                totalWOutTax = totalCupsPrice + totalMilkPrice + totalSyrupPrice + totalCerealPrice
                print ("There are \(cupsItems) cups in your cart")
                print ("Your current total is $\(String(format: "%.2f", totalWOutTax))")
                return mainMenuDisplay()
            }
        }
        
    }
 
    
}



//creating a function so the user can remove an item from their cart
func removeItem(){
    print ("What would you like to remove cart?")
    print ("1.) Cereal")
    print ("2.) Milk")
    print ("3.) Syrup")
    print ("4.) Cups")
//    if the user types 1, remove cereals from their cart
    if let userInput = readLine(){
        if userInput == "1"{
            print("How many cereal(s) would you like to remove from your cart?: ")
//   removing the number insterted by the user from the variable.
            if let userInput = readLine(),let quantity = Int(userInput){
                 cerealItems -= quantity
                totalCerealPrice = Double(cerealItems) * (cerealPrice)
                totalWOutTax = totalCupsPrice + totalMilkPrice + totalSyrupPrice + totalCerealPrice
                print ("There are \(cerealItems) cereals in your cart")
                print ("Your current total is $\(String(format: "%.2f", totalWOutTax))")
                //                returning the user to the main display
                 return mainMenuDisplay()
            }
        }
        if userInput == "2"{
            print("How many milk(s) would you like to remove from your cart?: ")
            if let userInput = readLine(),let quantity = Int(userInput){
                 milkItems -= quantity
                totalMilkPrice = Double(milkItems) * (milkPrice)
                totalWOutTax = totalCupsPrice + totalMilkPrice + totalSyrupPrice + totalCerealPrice
               print ("There are \(milkItems) milks in your cart")
               print ("Your current total is $\(String(format: "%.2f", totalWOutTax))")
               return mainMenuDisplay()
            }
        }
        if userInput == "3"{
            print("How many syrup(s) would you like to remove from your cart?: ")
            if let userInput = readLine(),let quantity = Int(userInput){
                 syrupItems -= quantity
                totalSyrupPrice = Double(syrupItems) * (syrupPrice)
                totalWOutTax = totalCupsPrice + totalMilkPrice + totalSyrupPrice + totalCerealPrice
                print ("There are \(syrupItems) syrups in your cart")
                print ("Your current total is $\(String(format: "%.2f", totalWOutTax))")
                return mainMenuDisplay()
            }
        }
        if userInput == "4"{
            print("How many cup(s) would you like to remove from your cart?: ")
            if let userInput = readLine(),let quantity = Int(userInput){
                 cupsItems -= quantity
                totalCupsPrice = Double(cupsItems) * (cupsPrice)
                totalWOutTax = totalCupsPrice + totalMilkPrice + totalSyrupPrice + totalCerealPrice
                print ("There are \(cupsItems) cups in your cart")
                print ("Your current total is $\(String(format: "%.2f", totalWOutTax))")
                return mainMenuDisplay()
            }
        }
    }
}

//creating a function to check the availability of the item
func itemavAilabilty(){
    print ("What item would you like to check the availabilty for?")
    print ("1.) Cereal")
    print ("2.) Milk")
    print ("3.) Syrup")
    print ("4.) Cups")
    
// creating a new variable that stores how many items are left by subtracting how many they started with by how much the customer put in their cart
    if let userInput = readLine(){
        if userInput == "1"{
            print ("There are \(cerealStock ) cereals left in stock")
            return mainMenuDisplay()
        }
        if userInput == "2"{
            print ("There are \(milkStock ) milks left in stock")
            return mainMenuDisplay()
        }
        if userInput == "3"{
            print ("There are \(syrupStock ) syrups left in stock")
            return mainMenuDisplay()
        }
        if userInput == "4"{
            print ("There are \(cupsStock) cups left in stock")
            return mainMenuDisplay()
        }
    }
    
}

func adminPin(){
    print("Admin pin #:")
    //    if the user types the pin number 2006 they can run the following code
    if let userInput = readLine(){
        if userInput == "2006"{
            return accessAdmin()
        }
        else{
            print("Wrong pin number!")
            return mainMenuDisplay()
        }
    }
}

//function listing all the inventory thats left
func generatereport(){
   
  print("Summary Report")
  print("Remaining cereals: \(cerealStock)")
  print("Remaining milk: \(milkStock)")
  print("Remaining syrup: \(syrupStock)")
  print("Remaining cup(s): \(cupsStock)")
   
//    creating a variable where were gonna store all of the inventory in the shelfs
  let totalInventory = cerealStock + milkStock + syrupStock + cupsStock
  print("Remaining Inventory: \(totalInventory) items")
  print("Total Sales: $\(String(format: "%.2f", totalWOutTax))")
    
  return accessAdmin()
}


func accessAdmin(){

    print("What would you like to do?")
    print("1.) Restock Inventory")
    print("2.) Generate reports")
    print("3.) Number of items available")
    print("4.) Quit admin menu")
            
//            creating an if statement to restock
    if let userInput = readLine(){
        if userInput == "1"{
        print("What Item would you like to restock?")
        print ("1.) Cereal")
        print ("2.) Milk")
        print ("3.) Syrup")
        print ("4.) Cups")
            
        if let userInput = readLine(){
           if userInput == "1"{
               print("How much would you like to restock?")
                //turning the userinput into a number and not a string
                if let userInput = readLine(),let restock = Int(userInput){
                    cerealStock += restock
                print("There are \(cerealStock) cereal(s) in stock")
                    return accessAdmin()
                        }
                    }
                        
        if userInput == "2"{
                print("How much would you like to restock?")
                            //turning the userinput into a number and not a string
                            if let userInput = readLine(),let restock = Int(userInput){
                                milkStock += restock
                                print("There are \(milkStock) ,milk(s) in stock")
                                return accessAdmin()
                            }
                        }
                        
        if userInput == "3"{
                print("How much would you like to restock?")
                            //turning the userinput into a number and not a string
                            if let userInput = readLine(),let restock = Int(userInput){
                                syrupStock += restock
                                print("There are \(syrupStock) syrup(s) in stock")
                                return accessAdmin()
                            }
                        }
                        
        if userInput == "4"{
                print("How much would you like to restock?")
                            //turning the userinput into a number and not a string
                            if let userInput = readLine(),let restock = Int(userInput){
                                cupsStock += restock
                                print("There are \(cupsStock) cup(s) in stock")
                                return accessAdmin()
                            }
                        }
                    }
                }
    if userInput == "2"{
        return generatereport()
    }
    if userInput == "3"{
                    print("What Item would you like to check if its in stock?")
                    print ("1.) Cereal")
                    print ("2.) Milk")
                    print ("3.) Syrup")
                    print ("4.) Cups")
       if let userInput = readLine(){
            if userInput == "1"{
                print("There are currently \(cerealStock) cereal(s) in stock!")
                return accessAdmin()
            }
            if userInput == "2"{
                print("There are currently \(milkStock) milk(s) in stock!")
                return accessAdmin()
            }
            if userInput == "3"{
                print("There are currently \(syrupStock) syrup(s) in stock!")
                return accessAdmin()
            }
            if userInput == "4"{
                print("There are currently \(cupsStock) cup(s) in stock!")
                return accessAdmin()
            }
          }
        }
//            returning to the main menu display if they want to quit admin access
     if userInput == "4"{
                    return mainMenuDisplay()
     }
            
  }
}

func checkOut(){
    print("Thank you for shopping with us!")
    print("You have purshased the following:")
    print("Cereal(s): \(cerealItems)")
    print("Milk(s): \(milkItems)")
    print("Syrup(s): \(syrupItems)")
    print("Cups(s): \(cupsItems)")
    
//    updating the prices
    totalCerealPrice = Double(cerealItems) * (cerealPrice)
    totalMilkPrice = Double(milkItems) * (milkPrice)
    totalSyrupPrice = Double(syrupItems) * (syrupPrice)
    totalCupsPrice = Double(cupsItems) * (cupsPrice)
    totalWOutTax = totalCupsPrice + totalMilkPrice + totalSyrupPrice + totalCerealPrice
    price = Double(totalWOutTax) * 1.0925
//    the string format thing makes only 2 decimal places appear
    print("Your grand total including tax (9.25%) is: $\(String(format: "%.2f", price))")
}

