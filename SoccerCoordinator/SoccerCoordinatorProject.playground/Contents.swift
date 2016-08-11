
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
// dummy
allPalyers.append(["name":"Les Clay", "height":42 , "soccer experience":"YES" , "guardians":"Wynonna Brown"])
allPalyers.append(["name":"Herschel Krustofski", "height":45 , "soccer experience":"YES" , "guardians":"Hyman and Rachel Krustofski"])
allPalyers.append(["name":"Les Clay", "height":42 , "soccer experience":"YES" , "guardians":"Wynonna Brown"])
allPalyers.append(["name":"Les Clay", "height":42 , "soccer experience":"NO" , "guardians":"Wynonna Brown"])
allPalyers.append(["name":"Les Clay", "height":42 , "soccer experience":"NO" , "guardians":"Wynonna Brown"])


// Final teams goes into those 3 arrays
var Sharks = [[String: Any]]()
var Dragons = [[String: Any]]()
var Raptors = [[String: Any]]()

let numberOfTeams = 3                           // Constant to hold how many teams we need
var experiencedPlayers = [[String: Any]]()      // Intermediate array to hold expereinced players
var nonExperiencedPlayers = [[String: Any]]()   // Intermediate array to hold non- expereinced players

let maxNumberOfPlayersPerTeam = allPalyers.count / numberOfTeams   // contant that define maximum number of players per team


// Sort by experience in two groups
    for player in allPalyers {
        let experience = player["soccer experience"] as! String
        if experience == "YES" {
            experiencedPlayers.append(player)
        } else if experience == "NO" {
            nonExperiencedPlayers.append(player)
        }
        
    }



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

// Distribute players on teams
// First distribute expereinced players


var index = 0
for player in experiencedPlayers {
    let key = index % 3
    switch key {
    case   0 : Sharks.append(player)
    case   1 : Dragons.append(player)
    case   2 : Raptors.append(player)
    default:
        break
    }
    index += 1
}

// Then distribute expereinced players
for player in nonExperiencedPlayers {
    if Sharks.count < maxNumberOfPlayersPerTeam {
        Sharks.append(player)
    } else
    if Raptors.count < maxNumberOfPlayersPerTeam {
        Raptors.append(player)
    } else
    if Dragons.count < maxNumberOfPlayersPerTeam {
        Dragons.append(player)
    }
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


