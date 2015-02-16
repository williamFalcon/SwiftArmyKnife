# JString
Swift string with Javascript sugar.
- In swift without relying on NSString.    

##To Use
- Import JString.swift into your project.    
- That's it!     

##Overview    
###Properties
|  Property | Return | Description
|----|----|----|
|  **length** | Int | Length of string |    

###Subscripting
|  Subscript | Return | Description
|----|----|----|
|  **myString[1]** | String | Returns string at the index |
|  **myString["art"]** | Int | Returns index of string |
|  **myString[0...2]** | String | Returns string in the range  |

###Methods
|  Method | Return | Description
|----|----|----|
|  **matchesForRegex()**| [String] | Searches a string for a match against a regular expression, and returns the matches |
|  **search()** | Int? | Searches a string for a specified value, or regular expression, and returns the position of the match |
|  **contains()** | Bool | Returns true if string contains input string   |
|  **charAt()** | Int? | Returns the character at the specified index (position) |
|  **indexOf()** | Int? | Returns the position of the first found occurrence of a specified value in a string |
|  **lastIndexOf()** | Int? | Returns the position of the last found occurrence of a specified value in a string |
|  **substringFromIndex()** | String? | Extracts the characters from a string, after a specified index |
|  **substringToIndex()** | String? | Extracts the characters from a string, before a specified index |
|  **substringFromIndex()** | String | Extracts a part of a string and returns a new string |
|  **substringFromIndex:toIndex** | String | Extracts a part of a string and returns a new string |
|  **substringFromIndex:length** | String | Extracts a part of a string and returns a new string |
|  **slice()** | String | Extracts a part of a string and returns a new string |
|  **splitOn()** | [String] | Splits a string into an array of substrings |
|  **replaceAll()** | String | Searches a string for a specified value, or a regular expression, and returns a new string where the specified values are replaced. Can take in an regular expression |
|  **trim()** | String | Removes whitespace from both ends of a string |
|  **trimLastChar()** | String | Removes the last char of the string |
|  **trimFirstChar()** | String | Removes the first char of the string |
|  **concat()** | String? | Joins two or more strings, and returns a new joined string |
|  **reverse()** | String | Reverses the string |
|  **toCharArray()** | [Character] | Separates string into an array of characters |


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
#### *indexOf(string: String?) -> Int?*
- Returns the position of the first found occurrence of a specified value in a string
````swift
var word = "he3arts in he2arth"
var result = word.indexOf("3a")
println(result) //2
````    
#### *lastIndexOf(string: String?) -> Int?*
- Returns the position of the last found occurrence of a specified value in a string
````swift
var word = "he3arts in he2arth"
var result = word.lastIndexOf("ar")
println(result) //14
````    
#### *substringFromIndex(index:Int) -> String?*
- Extracts the characters from a string, after a specified index
````swift
var word = "he3arts in he2arth"
var result = word.substringFromIndex(4)
println(result) //"rts in he2arth"
````    
#### *substringToIndex(index:Int) -> String?*
- Extracts the characters from a string, before a specified index
````swift
var word = "he3arts in he2arth"
var result = word.substringToIndex(2)
println(result) //"he"
````    
#### *substringFromIndex(index:Int, toIndex to:Int) -> String*
- Extracts a part of a string and returns a new string
````swift
var word = "he3arts in he2arth"
var result = word.substringFromIndex(2, toIndex: 5)
println(result) //"3art"
````    
#### *substringFromIndex(index:Int, length:Int) -> String*
- Extracts a part of a string and returns a new string starting at an index and
    going for the length requested
````swift
var word = "he3arts in he2arth"
var result = word.substringFromIndex(2, length: 4)
println(result) //"3arts"
````    
#### *slice(start: Int, end: Int) -> String*
- Extracts a part of a string and returns a new string
````swift
var word = "he3arts in he2arth"
var result = word.slice(3, end: 6)
println(result) //"arts"
````    
#### *splitOn(separator: String) -> [String]*
- Splits a string into an array of substrings
````swift
var word = "he3arts in he2arth"
var result = word.splitOn("a")
println(result) //[he3, rts in he2, rth]
````    
#### *replaceAll(regex: String?, replacement:String?) -> String*
- Searches a string for a specified value, or a regular expression, and returns a new string where the specified values are replaced. Can take in an regular expression
````swift
var word = "he3arts in he2arth"
var result = word.replaceAll("art", replacement: "##")
println(result) //he3##s in he2##h
````    
#### *trim() -> String*
- Removes whitespace from both ends of a string
````swift
var word = "he3arts in he2arth "
var result = word.trim()
println(result) //he3arts in he2arth
````    
#### *trimLastChar() -> String*
- Removes the last char of the string
````swift
var word = "heart"
var result = word.trimLastChar()
println(result) //hear
````    
#### *trimFirstChar() -> String*
- Removes the last char of the string
````swift
var word = "heart"
var result = word.trimFirstChar()
println(result) //eart
````    
#### *concat(string:String) -> String?*
- Joins two or more strings, and returns a new joined string
````swift
var word = "food"
var result = word.concat(" is good")
println(result) //food is good
````    
#### *reverse() -> String*
- Reverses the string
````swift
var word = "food"
var result = word.reverse()
println(result) //doof
````    
#### *toCharArray() -> [Character]*
- Separates string into an array of characters
````swift
var word = "food"
var result = word.toCharArray()
println(result) //[f, o, o, d]
````    
