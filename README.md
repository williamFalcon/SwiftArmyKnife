# JString
Swift string with Javascript sugar.
- In swift without relying on NSString.    

##Overview    
|  Method | Return | Description
|----|----|----|
|  **myString[1]** | String | Returns string at the index |
|  **myString["art"]** | Int | Returns index of string |
|  **myString[0...2]** | String | Returns string in the range  |
|  **matchesForRegex()**| [String] | Searches a string for a match against a regular expression, and returns the matches |
|  **search()** | Int? | Searches a string for a specified value, or regular expression, and returns the position of the match |
|  **contains()** | Bool | Returns true if string contains input string   |
|  **charAt()** | Int? | Returns the character at the specified index (position) |


##Subscripting        
#### *myString[1]*
- Returns string at the index    
````swift
var word = "heart"
var letter = word[0]
println(letter) //h
````    
#### *myString["art"]*
- Returns index of string    
````swift
var word = "heart"
var index = word["art"]
println(index) //2
````    
#### *myString[0...2]*
- Returns string in the range    
````swift
var word = "heart"
var substring = word[0...2]
println(substring) //he
````    
##Methods      
#### *matchesForRegex(regex: String) -> [String]*
- Searches a string for a match against a regular expression, and returns the matches    
````swift
var word = "he3arts in he2arth"
var matches = word.matchesForRegex("he[0-9]{1}")
println(matches) //[he3, he2]
````    
#### *search(string:String?) -> Int?*
- Searches a string for a specified value, or regular expression, and returns the position of the match    
````swift
var word = "he3arts in he2arth"
var result = word.search("3a")
println(result) //2
````    
#### *contains(s: String) -> Bool*
- Returns true if string contains input string   
````swift
var word = "he3arts in he2arth"
var result = word.contains("in")
println(result) //true
````    
#### *charAt(index:Int?) -> String?*
- Returns the character at the specified index (position) 
````swift
var word = "he3arts in he2arth"
var result = word.charAt(0)
println(result) //h
````    
