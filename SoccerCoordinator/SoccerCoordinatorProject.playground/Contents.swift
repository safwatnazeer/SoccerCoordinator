
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
allPalyers.append(["name":"Les Clay", "height":42 , "soccer experience":"YES" , "guardians":"Wynonna Brown"])
allPalyers.append(["name":"Herschel Krustofski", "height":45 , "soccer experience":"NO" , "guardians":"Hyman and Rachel Krustofski"])


var Sharks = [[String: Any]]()
var Dragons = [[String: Any]]()
var Raptors = [[String: Any]]()

let numberOfTeams = 3
var experiencedPlayers = [[String: Any]]()
var nonExperiencedPlayers = [[String: Any]]()

let maxNumberOfPlayersPerTeam = allPalyers.count / numberOfTeams



// decide if number of experinced players can be divided equally on the 3 teams, otherwise one team will get less
//let experincedPlayersEven:Bool = ((numberOfAllExperienceeriencedPlayers%3) == 0) ? true : false

// Sort by experience in two groups
    for player in allPalyers {
        let experience = player["soccer experience"] as! String
        if experience == "YES" {
            experiencedPlayers.append(player)
        } else if experience == "NO" {
            nonExperiencedPlayers.append(player)
        }
        
    }

// Decide what is min and max number of experienced players per team
// This will solve the problem when not having enough experienced players for all teams

var minExpPlayersPerTeam: Int = experiencedPlayers.count / numberOfTeams
var doWeHaveEvenExpPlayers : Bool
if experiencedPlayers.count % numberOfTeams == 0 { doWeHaveEvenExpPlayers = true } else {doWeHaveEvenExpPlayers = false}
var maxExpPlayersPerTeam = 0
if doWeHaveEvenExpPlayers == true {maxExpPlayersPerTeam = minExpPlayersPerTeam } else {maxExpPlayersPerTeam = minExpPlayersPerTeam+1}

// distribute players on teams
// condition 1: each team has min number of expereinced players and not exceeding max number
// condition 2: all teams have equal number of players

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

func checkIfPlayerCanBeAdded(player:[String:Any], teamName:String) -> Bool {
    
    switch teamName {
    case "Sharks":
        if (countExpPlayers(Sharks) < maxExpPlayersPerTeam) && Sharks.count < maxNumberOfPlayersPerTeam{
            return true
        }
    case "Dragons":
        if (countExpPlayers(Dragons) < maxExpPlayersPerTeam) && Dragons.count < maxNumberOfPlayersPerTeam{
            
            return true
        }
    case "Raptors":
        if (countExpPlayers(Raptors) < maxExpPlayersPerTeam) && Raptors.count < maxNumberOfPlayersPerTeam {
            return true
        }
    default:
        return false
    }
    return false
}

for player in allPalyers {
    if checkIfPlayerCanBeAdded(player, teamName: "Sharks") {
         Sharks.append(player)
    } else if checkIfPlayerCanBeAdded(player, teamName: "Dragons"){
        Dragons.append(player)
    }
    else if checkIfPlayerCanBeAdded(player, teamName: "Raptors"){
        Raptors.append(player)
    }
}


Sharks.count
Dragons.count
Raptors.count

