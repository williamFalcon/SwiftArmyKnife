#Bolt_Swift (Bolt underscore Swift)
Library for the missing bolts in Swift.
Help shape Bolt_Swift, become a contributor!

##To Use
Include the [BoltLibrary] (https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary) folder in your app.  
-- OR --   
Cocoapods:
```bash
pod install Bolt_Swift
```

##Current Bolts
- [**Array**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/Array)
- [**GCD**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/GCD)
- [**Integer**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/Integer)
- [**NSArray**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/NSArray)
- [**NSAttributedString**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/NSAttributedString)
- [**NSDate**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/NSDate)
- [**NSMutableAttributedString**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/NSMutableAttributedString)
- [**NSNumber**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/NSNumber)
- [**NSString**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/NSString)
- [**NSUrl**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/NSUrl)
- [**Set**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/Set)
- [**String**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/String)
- [**UIApplication**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/UIApplication)
- [**UIButton**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/UIButton)
- [**UICollectionReusableHeaderView**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/UICollectionReusableHeaderView)
- [**UICollectionView**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/UICollectionView)
- [**UICollectionViewCell**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/UICollectionViewCell)
- [**UIColor**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/UIColor)
- [**UIImageView**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/UIImageView)
- [**UIPanGestureRecognizer**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/UIPanGestureRecognizer)
- [**UIScrollView**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/UIScrollView)
- [**UITableViewCell**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/UITableViewCell)
- [**UIView**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/UIView)
- [**UIViewController**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/UIViewController)
- [**UIWindow**](https://github.com/williamFalcon/Bolt_Swift/tree/master/Bolt/BoltLibrary/UIWindow)
````swift
//String Examples

var word = "heart"
println(word[0]) //h
println(word[-1]) //t

var index = word["art"]
println(index) //2

println(word._length) //5
println(word._reverse()) //treah

var word = "he3arts in he2arth"
var matches = word._matchesForRegex("he[0-9]{1}")
println(matches) //[he3, he2]
//much more...
````
##Notes
- New bolts are added every few weeks while we continue to build them as we progress with our client apps.

##Upcoming Bolts
- Only additions to existing bolts

##Bolts in Development
- Most bolts will be receiving new functionality throughout the next few months.

##Contributors wanted!
Pick any of the upcoming bolts to implement.

*To contribute to Bolt_Swift:*
1. Email me (email at the bottom) so I can add your Bolt to bolts being worked on
2. Fork project
3. Implement new Bolt
4. Implement Bolt Tests
5. Add documentation
6. Submit a pull request

###Contact me
Email me at will@hacstudios.com for questions
