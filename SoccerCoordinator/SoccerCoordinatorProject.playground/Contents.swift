
// Soccer Coordinator Project 
// 10-Aug-2016


// Original players data data for team

var allPalyers = [[String: String]]() // Create an array of dictionaries  to hold all players data.


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
allPalyers.append(["name":"Les Clay", "height":"42" , "soccer experience":"YES" , "guardians":"Wynonna Brown"])
allPalyers.append(["name":"Herschel Krustofski", "height":"45" , "soccer experience":"YES" , "guardians":"Hyman and Rachel Krustofski"])


// Final teams goes into those 3 arrays of dictionaries
var Sharks = [[String: String]]()
var Dragons = [[String: String]]()
var Raptors = [[String: String]]()


let numberOfTeams = 3                              // Constant to hold how many teams we need
var experiencedPlayers = [[String: String]]()      // Intermediate array to hold expereinced players
var nonExperiencedPlayers = [[String: String]]()   // Intermediate array to hold non- expereinced players

let maxNumberOfPlayersPerTeam = allPalyers.count / numberOfTeams   // constant that define maximum number of players per team



// Sort by experience in two groups experienced and non experienced
    for player in allPalyers {
        let experience = player["soccer experience"]
        if experience == "YES" {
            experiencedPlayers.append(player)
        } else if experience == "NO" {
            nonExperiencedPlayers.append(player)
        
        }
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

// Helper function to write personalized letters
func wirteLetter(player:[String:String] , firstPractiseDate: String , team:String) {

    let playerName = player["name"]!
    let guradiansName = player["guardians"]!
    
    // print letter
    print("Hi \(guradiansName), \n")
    print("We are happy to inform you that your child \(playerName) has been selected for team \(team).\nThe first training day for this team is scheduled on \(firstPractiseDate). We hope to see you then.")
    print("\nRegards,\nSafwat Shenouda\nFootball Club Administration\n")
    
}

// Set dates
let DrgaonsDates = "March 17, 1pm"
let RaptorsDate = "March 18, 1pm"
let SharksDate = "March 17, 3pm"


// Print letters for 3 teams
// I commented this part as it will come later after the end of extra credit section.
//for player in Dragons { wirteLetter(player, firstPractiseDate: DrgaonsDates, team: "Dragons") }
//for player in Sharks  { wirteLetter(player, firstPractiseDate: SharksDate, team: "Sharks") }
//for player in Raptors { wirteLetter(player, firstPractiseDate: RaptorsDate, team: "Raptors") }


//////////////////////////////////////////////////////////////////
// Extra credit: Make sure average height of each team is not different by more than 1.5 inch, while maintaining the number of expereinced players equal
// First I set several helper functions then go through a logic to swap players when needed

// Helper Function to get average height of a team
func getAverageHeightOfTeam(team: [[String:String]]) -> Double
{
    
    var totalHeight: Double = 0
    var average: Double = 0
    
    for player in team {
        
            let playerHeight = player["height"]!
            let playerHeightValue = Double(playerHeight)
            totalHeight += playerHeightValue!
        
        
    }
    average = totalHeight/Double(team.count)
    return average
}



// Helper Function to decide if the difference between teams is more  1.5inch
let maxDiff = 1.5  // maximum allowable diff
func isThereBigDiff () -> Bool {
    
    if(
            abs(getAverageHeightOfTeam(Sharks) - getAverageHeightOfTeam(Dragons)) > maxDiff ||
            abs(getAverageHeightOfTeam(Sharks) - getAverageHeightOfTeam(Raptors)) > maxDiff ||
            abs(getAverageHeightOfTeam(Dragons) - getAverageHeightOfTeam(Raptors)) > maxDiff
    ) {
        return true
    } else {
        return false
    }

}


//Helper Function to sort an array using the bubble sort logic
// I use this as closures/ array sort are not allowed
func sortGroup(inout group: [[String:String]], key: String) {
    
    for _ in 0..<group.count
    {
        for inner in 0..<(group.count-1)
        {
            
            let firstValue = group[inner][key]!
            let secondValue = group[inner+1][key]!
            
            if (Double(firstValue) > Double(secondValue)) {
                let temp = group[inner]
                group[inner] = group[inner+1]
                group[inner+1] = temp
                
            }
        }
    }
    
}

// Helper Function to sort teams by thier average height and store in an array sortedTeams
var sortedTeams = [[String:String]]()
func sortTeams() {
    
    let dragonAverage  = String(getAverageHeightOfTeam(Dragons))
    let raptorsAverage = String(getAverageHeightOfTeam(Raptors))
    let sharksAverage = String(getAverageHeightOfTeam(Sharks))
    
    sortedTeams.append(["team":"Dragons", "average":dragonAverage ])
    sortedTeams.append(["team":"Sharks", "average":sharksAverage ])
    sortedTeams.append(["team":"Raptors", "average":raptorsAverage ])
    
    sortGroup(&sortedTeams, key: "average") // I had to use inout variables to be able to sort the array
    
}


// Helper Function to return team dictionary when asked by name
func getTeam(teamName:String) -> [[String:String]]? {
    switch teamName {
    case "Sharks": return Sharks
    case "Dragons": return Dragons
    case "Raptors": return Raptors
    default:
        return nil
    }
}

// Helper Function to help during swap operation.
// We want to make sure that the two players we are swapping have same soccer expereince.
// If not same then we can the next player in order who has same experience\
// Before calling this function players are sorted by height in their group
func getNextSuitableShortest(team:[[String:String]], key: String) -> Int?
{
    
    for index in 0..<team.count {
        if team[index]["soccer experience"] == key { return index }
    }
    return nil
}
// Helper function to copyData from temp array to final team array based on team name
func copyData(team:[[String:String]], key: String){
    
    switch key {
    case "Sharks":
        Sharks.removeAll()
        Sharks = team
    
    case "Raptors":
        Raptors.removeAll()
        Raptors = team
    case "Dragons":
        Dragons.removeAll()
        Dragons = team
    default:
        break
    }
}


// Main logic loop:
// First check if there is a big differnce between teams
// If there is a big difference then we take teh shortest player from shortest team and swap with tallest player in tallest team
// Before swap, we check if the two players have same level of soccer expereince, so we dont disturbe the main distribution

while isThereBigDiff() {
sortedTeams.removeAll() // clear up array and prepare for new sort
sortTeams()             // Sort 3 teams based on each team avergae height

    
sortGroup(&Raptors, key: "height") // sort players in each team from shortest to tallest
sortGroup(&Dragons, key: "height")
sortGroup(&Sharks, key: "height")

let shortestTeamName = sortedTeams[0]["team"]!          // get shortest team name
let tallestTeamName =  sortedTeams.last!["team"]!       // get  tallest team name
var shortestTeam = getTeam(shortestTeamName)            // assign team to a variable to prepare for swap
var tallestTeam =  getTeam(tallestTeamName)             // assign team to a variable to prepare for swap

let tallestPlayer = tallestTeam!.last                   // Get tallest player , who will be the last one in the tallest team
let indexOfTallest = (tallestTeam?.count)! - 1          // store index of this player to prepare for swap

// knowing the tallest player already, we need to find the shortest with same expereince in the shortest team
let indexOfSuitableShortest = getNextSuitableShortest(shortestTeam!, key: tallestPlayer!["soccer experience"]!)!
let shortestPlayer = shortestTeam![indexOfSuitableShortest] // Get shortest player , who will be the first one in the shortest team (or next one suitable)


// Swap two players using temp variables
let tempPlayer = tallestTeam!.last
tallestTeam![indexOfTallest] = shortestTeam![indexOfSuitableShortest]
shortestTeam![indexOfSuitableShortest] = tempPlayer!

// copy data to final teams based on names
copyData(shortestTeam!, key: shortestTeamName  )
copyData(tallestTeam!, key : tallestTeamName)

// now check and loop again
   
}

//////////////////////////////////
// Print letters for 3 teams agian
for player in Dragons { wirteLetter(player, firstPractiseDate: DrgaonsDates, team: "Dragons") }
for player in Sharks  { wirteLetter(player, firstPractiseDate: SharksDate, team: "Sharks") }
for player in Raptors { wirteLetter(player, firstPractiseDate: RaptorsDate, team: "Raptors") }
