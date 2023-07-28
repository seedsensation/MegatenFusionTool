import Cocoa

var greeting = "Hello, playground"

compendium = Compendium()

compendium.current_game = .smtsj
compendium.Update()




if var demonA = compendium.demon_data.find("Abaddon") {
    print(demonA,demonA.g_pcoeff,demonA.skills)
} else {
    print("Couldn't find the demon :(")
}

compendium.current_game = .smt1
compendium.Update()

if var demonA = compendium.demon_data.find("Abaddon") {
    print(demonA,demonA.g_pcoeff,demonA.skills)
}

compendium.current_game = .smt9
compendium.Update()

if var demonA = compendium.demon_data.find("Jack Frost") {
    print(demonA)
}
