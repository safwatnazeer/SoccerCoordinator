
// Soccer Coordinator Project 
// 10-Aug-2016


// Original players data data for team

var allPalyers = [[String: Any]]() // Create an array of dictionaries  to hold players data.


allPalyers.append(["name":"Joe Smith", "height":42 , "soccerExp":"YES" , "guardians":"Jim and Jan Smith"])
allPalyers.append(["name":"Jill Tanner", "height":36 , "soccerExp":"YES" , "guardians":"Clara Tanner"])
allPalyers.append(["name":"Bill Bon", "height":43 , "soccerExp":"YES" , "guardians":"Sara and Jenny Bon"])
allPalyers.append(["name":"Eva Gordon", "height":45 , "soccerExp":"NO" , "guardians":"Wendy and Mike Gordon"])
allPalyers.append(["name":"Matt Gill", "height":40 , "soccerExp":"NO" , "guardians":"Charles and Sylvia Gill"])
allPalyers.append(["name":"Kimmy Stein", "height":41 , "soccerExp":"NO" , "guardians":"Bill and Hillary Stein"])
allPalyers.append(["name":"Sammy Adams", "height":45 , "soccerExp":"NO" , "guardians":"Jeff Adams"])
allPalyers.append(["name":"Karl Saygan", "height":42 , "soccerExp":"YES" , "guardians":"Heather Bledsoe"])
allPalyers.append(["name":"Suzane Greenberg", "height":44 , "soccerExp":"YES" , "guardians":"Henrietta Dumas"])
allPalyers.append(["name":"Sal Dali", "height":41 , "soccerExp":"NO" , "guardians":"Gala Dali"])
allPalyers.append(["name":"Joe Kavalier", "height":39 , "soccerExp":"NO" , "guardians":"Henrietta Dumas"])
allPalyers.append(["name":"Ben Finkelstein", "height":44 , "soccerExp":"NO" , "guardians":"Aaron and Jill Finkelstein"])
allPalyers.append(["name":"Diego Soto", "height":41 , "soccerExp":"YES" , "guardians":"Robin and Sarika Soto"])
allPalyers.append(["name":"Chloe Alaska", "height":47 , "soccerExp":"NO" , "guardians":"David and Jamie Alaska"])
allPalyers.append(["name":"Arnold Willis", "height":43 , "soccerExp":"NO" , "guardians":"HClaire Willis"])
allPalyers.append(["name":"Phillip Helm", "height":44 , "soccerExp":"YES" , "guardians":"Thomas Helm and Eva Jones"])
allPalyers.append(["name":"Les Clay", "height":42 , "soccerExp":"YES" , "guardians":"Wynonna Brown"])
allPalyers.append(["name":"Herschel Krustofski", "height":45 , "soccerExp":"YES" , "guardians":"Hyman and Rachel Krustofski"])





for player in allPalyers {
    
    print("Name: \(player["name"]!) Height: \(player["height"]!)")
}

