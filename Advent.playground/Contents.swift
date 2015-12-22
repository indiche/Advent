import Foundation

let bundle = NSBundle.mainBundle()
let path = bundle.pathForResource("1", ofType: "txt")
let input = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)

// Day 1
func instructionForCharacter(char: Character) -> Int {
    switch (char) {
    case "(": return 1
    case ")": return -1
    default: return 0
    }
}

func day1(input: String) {
    input.characters.reduce(0) { floor, instruction in
        return floor + instructionForCharacter(instruction)
    }
}

func day1_2(input: String) {
    input.characters.reduce((0, 0)) { (var floorAndSteps, instruction) in
        if (floorAndSteps.0 != -1) {
            floorAndSteps.0 += instructionForCharacter(instruction)
            floorAndSteps.1 += 1
        }

        return floorAndSteps
    }
}
