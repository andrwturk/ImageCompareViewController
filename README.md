# ImageCompareViewController

ImageCompareViewController gives you beautiful slide effect for viewing your images. It's fully written in Swift.
![Screenshot](https://raw.githubusercontent.com/AndrewTurkin/ImageCompareViewController/master/ImageCompareViewController/ImageCompareViewController/screenshot0.png)
![Screenshot](https://raw.githubusercontent.com/AndrewTurkin/ImageCompareViewController/master/ImageCompareViewController/ImageCompareViewController/screenshot1.gif)

Usage
=====
```swift
let imageCompareViewController = ImageCompareViewController()
imageCompareViewController.images = ["carbon.jpg", "classique.jpg", "gold.jpg", "minimal.jpg"]
imageCompareViewController.delimeterColor = UIColor.redColor()
navigationController.pushViewController(imageCompareViewController, animated:true)
```

License and Author
==================

Author: Andrew Turkin https://twitter.com/andrwturk

Image design and original idea by Vlad Moroz http://vladmoroz.com/

Copyright 2015 Squareheart

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
