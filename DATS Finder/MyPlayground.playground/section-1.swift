// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Car {
    var brand = ""
}

let names = ["Kawasaki", "Yamaha", "Suzuki", "BMW"]

let cars = map(names, { (let name: String) -> Car in
    let car = Car()
    car.brand = name
    return car
})

class FuelStation {
    var name = ""
    /*
    var longitude : Double = 0
    var latitude : Double = 0
    var sp95 = true
    var sp98 = true
    var diesel = true
    var cng = true
    */
    var description : String {
        return name
    }
}

let fuelStation = FuelStation()
let allFuelStations = map(names, { (let name: String) -> FuelStation in
    let station = FuelStation()
    station.name = name
    return station
})

var all: [String] = []
var doAppend: () -> () = { () -> () in
    all.append("hello")
}
    
for i in 0...10 {
    doAppend()
}
println(all)


