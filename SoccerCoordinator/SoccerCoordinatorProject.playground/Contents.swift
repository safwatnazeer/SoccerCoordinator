
// Soccer Coordinator Project 
// 10-Aug-2016


// Original players data data for team

var allPalyers = [[String: String]]() // Create an array of dictionaries  to hold players data.


allPalyers.append(["name":"Joe Smith", "height":"42" , "soccer experience":"YES" , "guardians":"Jim and Jan Smith"])
allPalyers.append(["name":"Jill Tanner", "height":"36" , "soccer experience":"YES" , "guardians":"Clara Tanner"])
allPalyers.append(["name":"Bill Bon", "height":"43" , "soccer experience":"YES" , "guardians":"Sara and Jenny Bon"])
allPalyers.append(["name":"Eva Gordon", "height":"45" , "soccer experience":"NO" , "guardians":"Wendy and Mike Gordon"])
allPalyers.append(["name":"Matt Gill", "height":"40" , "soccer experience":"NO" , "guardians":"Charles and Sylvia Gill"])
allPalyers.append(["name":"Kimmy Stein", "height":"41", "soccer experience":"NO" , "guardians":"Bill and Hillary Stein"])
allPalyers.append(["name":"Sammy Adams", "height":"45" , "soccer experience":"NO" , "guardians":"Jeff Adams"])
allPalyers.append(["name":"Karl Saygan", "height":"42" , "soccer experience":"YES" , "guardians":"Heather Bledsoe"])
allPalyers.append(["name":"Suzane Greenberg", "height":"44" , "soccer experience":"YES" , "guardians":"Henrietta Dumas"])
allPalyers.append(["name":"Sal Dali", "height":"41" , "soccer experience":"NO" , "guardians":"Gala Dali"])
allPalyers.append(["name":"Joe Kavalier", "height":"39" , "soccer experience":"NO" , "guardians":"Henrietta Dumas"])
allPalyers.append(["name":"Ben Finkelstein", "height":"44" , "soccer experience":"NO" , "guardians":"Aaron and Jill Finkelstein"])
allPalyers.append(["name":"Diego Soto", "height":"41" , "soccer experience":"YES" , "guardians":"Robin and Sarika Soto"])
allPalyers.append(["name":"Chloe Alaska", "height":"47" , "soccer experience":"NO" , "guardians":"David and Jamie Alaska"])
allPalyers.append(["name":"Arnold Willis", "height":"43" , "soccer experience":"NO" , "guardians":"HClaire Willis"])
allPalyers.append(["name":"Phillip Helm", "height":"44" , "soccer experience":"YES" , "guardians":"Thomas Helm and Eva Jones"])
/// reset teh following two players to YES , they were no to test code
allPalyers.append(["name":"Les Clay", "height":"42" , "soccer experience":"NO" , "guardians":"Wynonna Brown"])
allPalyers.append(["name":"Herschel Krustofski", "height":"45" , "soccer experience":"NO" , "guardians":"Hyman and Rachel Krustofski"])

// Final teams goes into those 3 arrays
var Sharks = [[String: String]]()
var Dragons = [[String: String]]()
var Raptors = [[String: String]]()

let numberOfTeams = 3                           // Constant to hold how many teams we need
var experiencedPlayers = [[String: String]]()      // Intermediate array to hold expereinced players
var nonExperiencedPlayers = [[String: String]]()   // Intermediate array to hold non- expereinced players

let maxNumberOfPlayersPerTeam = allPalyers.count / numberOfTeams   // contant that define maximum number of players per team



// Sort by experience in two groups
    for player in allPalyers {
        let experience = player["soccer experience"]
        if experience == "YES" {
            experiencedPlayers.append(player)
        } else if experience == "NO" {
            nonExperiencedPlayers.append(player)
        
        }
        
    }


experiencedPlayers.count
nonExperiencedPlayers.count

// Helper function to count how many experienced player in a team
func countExpPlayers(team:[[String: Any]]) -> Int
{
    var counter = 0
    for player in team {
        let experience = player["soccer experience"] as! String
        if experience == "YES" {
            counter += 1
        }
    }
    return counter
}


// Distribute players on 3 teams
// First distribute expereinced players

var index = 0
while experiencedPlayers.count > 0 {
    let player =  experiencedPlayers.last
    let key = index % 3
    switch key {
    case   0 : if Sharks.count<maxNumberOfPlayersPerTeam  { Sharks.append(player!) ; experiencedPlayers.removeLast() }
    case   1 : if Dragons.count<maxNumberOfPlayersPerTeam { Dragons.append(player!); experiencedPlayers.removeLast() }
    case   2 : if Raptors.count<maxNumberOfPlayersPerTeam { Raptors.append(player!); experiencedPlayers.removeLast() }
    default:
        break
    }
    index += 1
    
    
 }


Sharks.count
Dragons.count
Raptors.count


// Then distribute non expereinced players

index = 0
while nonExperiencedPlayers.count > 0 {
    let player =  nonExperiencedPlayers.last
    let key = index % 3
    switch key {
    case   0 : if Sharks.count<maxNumberOfPlayersPerTeam  { Sharks.append(player!) ; nonExperiencedPlayers.removeLast() }
    case   1 : if Dragons.count<maxNumberOfPlayersPerTeam { Dragons.append(player!); nonExperiencedPlayers.removeLast() }
    case   2 : if Raptors.count<maxNumberOfPlayersPerTeam { Raptors.append(player!); nonExperiencedPlayers.removeLast() }
    default:
        break
    }
    index += 1
}

Sharks.count
Dragons.count
Raptors.count







///////////////////////////////////
// Extra credit: Sort by Height 




func getAverageHeightOfTeam(team: [[String:String]]) -> Double
{
    
    var totalHeight: Double = 0
    var average: Double = 0
    
    for player in team {
        
            let playerHeight = player["height"]!
        
            let playerHeightValue = Double(playerHeight)
            totalHeight += playerHeightValue!
            print(playerHeight)
        
    }
    average = totalHeight/Double(team.count)
    return average
}

getAverageHeightOfTeam(Dragons)
getAverageHeightOfTeam(Raptors)
getAverageHeightOfTeam(Sharks)

func getOverAllAverageHeight() -> Double {
    
    var totalHeight: Double = 0
    for player in allPalyers {
        let playerHeight = player["height"]!
        let playerHeightValue = Double(playerHeight)
        totalHeight += playerHeightValue!
        // print(playerHeight)
    }
    let average: Double = Double(totalHeight)/Double(allPalyers.count)
    return average
}
getOverAllAverageHeight()

func checkAverageDiff () -> Bool {
    
    if(
            abs(getAverageHeightOfTeam(Sharks) - getAverageHeightOfTeam(Dragons)) > 1.5 ||
            abs(getAverageHeightOfTeam(Sharks) - getAverageHeightOfTeam(Raptors)) > 1.5 ||
            abs(getAverageHeightOfTeam(Dragons) - getAverageHeightOfTeam(Raptors)) > 1.5
    ) {
        return false
    } else {
        return true
    }

}

///
//Bubble sort an array
func sortGroup(inout group: [[String:String]], key: String) {
    
    for _ in 0..<group.count
    {
        for inner in 0..<(group.count-1)
        {
            var firstElement = group[inner]
            var secondElement = group[inner+1]
            let firstValue = firstElement[key]!
            let secondValue = secondElement[key]!
            
            if (Double(firstValue) > Double(secondValue)) {
                let temp = group[inner]
                group[inner] = group[inner+1]
                group[inner+1] = temp
                
            }
        }
    }
    
}

var sortedTeams = [[String:String]]()

func sortTeams() {
    
    let dragonAverage  = String(getAverageHeightOfTeam(Dragons))
    let raptorsAverage = String(getAverageHeightOfTeam(Raptors))
    let sharksAverage = String(getAverageHeightOfTeam(Sharks))
    
    sortedTeams.append(["team":"Dragons", "average":dragonAverage ])
    sortedTeams.append(["team":"Sharks", "average":sharksAverage ])
    sortedTeams.append(["team":"Raptors", "average":raptorsAverage ])
    
    sortGroup(&sortedTeams, key: "average")
    
}
sortTeams()
sortedTeams


sortGroup(&Raptors, key: "height")
sortGroup(&Dragons, key: "height")
sortGroup(&Sharks, key: "height")
