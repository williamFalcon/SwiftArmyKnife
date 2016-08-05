#SwiftArmyKnife
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftArmyKnife.svg)](http://cocoapods.org/pods/SwiftArmyKnife)    
[![Platform](https://img.shields.io/cocoapods/p/SwiftArmyKnife.svg?style=flat)](http://cocoapods.org/pods/SwiftArmyKnife)     
[![License](https://img.shields.io/cocoapods/l/SwiftArmyKnife.svg?style=flat)](http://cocoapods.org/pods/SwiftArmyKnife)    
    
## What is it?     
Collection of low level Swift extensions

##Installation
Cocoapods:
```bash
pod install SwiftArmyKnife
```

##Current Tools
- [**Array**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/Array)
- [**GCD**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/GCD)
- [**Integer**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/Integer)
- [**NSArray**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/NSArray)
- [**NSAttributedString**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/NSAttributedString)
- [**NSDate**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/NSDate)
- [**NSMutableAttributedString**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/NSMutableAttributedString)
- [**NSNumber**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/NSNumber)
- [**NSString**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/NSString)
- [**NSUrl**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/NSUrl)
- [**Set**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/Set)
- [**String**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/String)
- [**UIApplication**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/UIApplication)
- [**UIButton**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/UIButton)
- [**UICollectionReusableHeaderView**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/UICollectionReusableHeaderView)
- [**UICollectionView**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/UICollectionView)
- [**UICollectionViewCell**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/UICollectionViewCell)
- [**UIColor**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/UIColor)
- [**UIImageView**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/UIImageView)
- [**UIPanGestureRecognizer**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/UIPanGestureRecognizer)
- [**UIScrollView**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/UIScrollView)
- [**UITableViewCell**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/UITableViewCell)
- [**UIView**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/UIView)
- [**UIViewController**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/UIViewController)
- [**UIWindow**](https://github.com/williamFalcon/SwiftArmyKnife/tree/master/Classes/UIWindow)
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
- New tools are added every few weeks while we continue to build them as we progress with our client apps.

##Upcoming Tools
- Only additions to existing tools

##Tools in Development
- Most tools will be receiving new functionality throughout the next few months.

##Contributors wanted!
Pick any of the upcoming tools to implement.

*To contribute:*
1. Email me (email at the bottom) so I can add your Tool to Tools being worked on
2. Fork project
3. Implement new Tool
4. Implement Tool Tests
5. Add documentation
6. Submit a pull request

###Contact me
Email me at will@hacstudios.com for questions
