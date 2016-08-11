
// Soccer Coordinator Project 
// 10-Aug-2016


// Original players data data for team

var allPalyers = [[String: Any]]() // Create an array of dictionaries  to hold players data.


allPalyers.append(["name":"Joe Smith", "height":42 , "soccer experience":"YES" , "guardians":"Jim and Jan Smith"])
allPalyers.append(["name":"Jill Tanner", "height":36 , "soccer experience":"YES" , "guardians":"Clara Tanner"])
allPalyers.append(["name":"Bill Bon", "height":43 , "soccer experience":"YES" , "guardians":"Sara and Jenny Bon"])
allPalyers.append(["name":"Eva Gordon", "height":45 , "soccer experience":"NO" , "guardians":"Wendy and Mike Gordon"])
allPalyers.append(["name":"Matt Gill", "height":40 , "soccer experience":"NO" , "guardians":"Charles and Sylvia Gill"])
allPalyers.append(["name":"Kimmy Stein", "height":41 , "soccer experience":"NO" , "guardians":"Bill and Hillary Stein"])
allPalyers.append(["name":"Sammy Adams", "height":45 , "soccer experience":"NO" , "guardians":"Jeff Adams"])
allPalyers.append(["name":"Karl Saygan", "height":42 , "soccer experience":"YES" , "guardians":"Heather Bledsoe"])
allPalyers.append(["name":"Suzane Greenberg", "height":44 , "soccer experience":"YES" , "guardians":"Henrietta Dumas"])
allPalyers.append(["name":"Sal Dali", "height":41 , "soccer experience":"NO" , "guardians":"Gala Dali"])
allPalyers.append(["name":"Joe Kavalier", "height":39 , "soccer experience":"NO" , "guardians":"Henrietta Dumas"])
allPalyers.append(["name":"Ben Finkelstein", "height":44 , "soccer experience":"NO" , "guardians":"Aaron and Jill Finkelstein"])
allPalyers.append(["name":"Diego Soto", "height":41 , "soccer experience":"YES" , "guardians":"Robin and Sarika Soto"])
allPalyers.append(["name":"Chloe Alaska", "height":47 , "soccer experience":"NO" , "guardians":"David and Jamie Alaska"])
allPalyers.append(["name":"Arnold Willis", "height":43 , "soccer experience":"NO" , "guardians":"HClaire Willis"])
allPalyers.append(["name":"Phillip Helm", "height":44 , "soccer experience":"YES" , "guardians":"Thomas Helm and Eva Jones"])
/// reset teh following two players to YES , they were no to test code
allPalyers.append(["name":"Les Clay", "height":42 , "soccer experience":"NO" , "guardians":"Wynonna Brown"])
allPalyers.append(["name":"Herschel Krustofski", "height":45 , "soccer experience":"NO" , "guardians":"Hyman and Rachel Krustofski"])

// Final teams goes into those 3 arrays
var Sharks = [[String: Any]]()
var Dragons = [[String: Any]]()
var Raptors = [[String: Any]]()

let numberOfTeams = 3                           // Constant to hold how many teams we need
var experiencedPlayers = [[String: Any]]()      // Intermediate array to hold expereinced players
var nonExperiencedPlayers = [[String: Any]]()   // Intermediate array to hold non- expereinced players

let maxNumberOfPlayersPerTeam = allPalyers.count / numberOfTeams   // contant that define maximum number of players per team

var finalTeams = [[String:Any]]()

// Sort by experience in two groups
    for player in allPalyers {
        let experience = player["soccer experience"] as! String
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






/*
///////////////////////////////////
// Extra credit: Sort by Height 

func getAverageHeightOfTeam(teamName: String) -> Double
{
    
    var totalHeight: Int = 0
    var average: Double = 0
    var teamCount: Int = 0
    
    for player in finalTeams {
        if player["team"] as! String == teamName {
            let playerHeight = player["height"] as! Int
            totalHeight += playerHeight
            teamCount += 1
            print(playerHeight)
        }
    }
    average = Double(totalHeight)/Double(teamCount)
    return average
}

func getOverAllAverageHeight() -> Double {
    
    var totalHeight: Int = 0
    for player in allPalyers {
        let playerHeight = player["height"] as! Int
        totalHeight += playerHeight
        print(playerHeight)
    }
    let average: Double = Double(totalHeight)/Double(allPalyers.count)
    return average
}





experiencedPlayers.count
nonExperiencedPlayers.count
allPalyers.count

Sharks.count
Dragons.count
Raptors.count

countExpPlayers(Sharks)
countExpPlayers(Dragons)
countExpPlayers(Raptors)
/////////////

getAverageHeightOfTeam("Sharks")
getAverageHeightOfTeam("Dragons")
getAverageHeightOfTeam("Raptors")

func checkAverageDiff () -> Bool {
    
    if(
            abs(getAverageHeightOfTeam("Sharks") - getAverageHeightOfTeam("Dragons")) > 1.5 ||
            abs(getAverageHeightOfTeam("Sharks") - getAverageHeightOfTeam("Raptors")) > 1.5 ||
            abs(getAverageHeightOfTeam("Dragons") - getAverageHeightOfTeam("Raptors")) > 1.5
    ) {
        return false
    } else {
        return true
    }

}

var sortedTeams = [[String:Any]]()
func sortTeams() {
    
    
    let dragonAverage  = getAverageHeightOfTeam("Dragons")
    let raptorsAverage = getAverageHeightOfTeam("Raptors")
    let sharksAverage = getAverageHeightOfTeam("Sharks")
    
    sortedTeams.append(["team":"Dragons", "average":dragonAverage ])
    sortedTeams.append(["team":"Sharks", "average":sharksAverage ])
    sortedTeams.append(["team":"Raptors", "average":raptorsAverage ])
    
    for outer in 0..<sortedTeams.count
    {
        let outerTeam = sortedTeams[outer]
        let outerTeamAverage = outerTeam["average"] as! Double
        for inner in 0..<sortedTeams.count
        {
            var innerTeam = sortedTeams[inner]
            let innerTeamAverage = innerTeam["average"] as! Double
            if (innerTeamAverage > outerTeamAverage) {
                let tempTeam1 = sortedTeams[inner]
                 sortedTeams[inner] = sortedTeams[outer]
                 sortedTeams[outer] = tempTeam1
                
            }
        }
    }
    
}
sortTeams()
sortedTeams

func sortGroup(inout group: [[String:Any]], key: String) {
    
    for outer in 0..<group.count
    {
        let outerTeam = group[outer]
        let outerTeamValue = outerTeam [key] as! Int
        for inner in 0..<sortedTeams.count
        {
            var innerTeam = group[inner]
            let innerTeamValue = innerTeam[key] as! Int
            if (innerTeamValue > outerTeamValue) {
                let tempTeam1 = group[inner]
                group[inner] = group[outer]
                group[outer] = tempTeam1
                
            }
        }
    }

}

func getTallestInTeam(team:String)  {
    var temp = [[String:Any]]()
    
    for player in finalTeams {
        let t = player["team"] as! String
        if t == team {
            temp.append(player)
        }
    }
    
    sortGroup(&temp, key: "height")
    print (temp)
    
}
getTallestInTeam("Raptors")


*/
