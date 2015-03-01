# ImageCompareViewController

ImageCompareViewController gives you beautiful slide effect for viewing your images. It's fully written in Swift.

![Screenshot](https://raw.githubusercontent.com/AndrewTurkin/ImageCompareViewController/master/ImageCompareViewController/ImageCompareViewController/screenshot1.gif)

## Usage
```swift
let imageCompareViewController = ImageCompareViewController()
imageCompareViewController.images = ["carbon.jpg", "classique.jpg", "gold.jpg", "minimal.jpg"]
imageCompareViewController.delimeterColor = UIColor.redColor()
navigationController.pushViewController(imageCompareViewController, animated:true)
```
