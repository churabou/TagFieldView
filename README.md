# TagFieldView

[![CI Status](https://img.shields.io/travis/churabou/TagFieldView.svg?style=flat)](https://travis-ci.org/churabou/TagFieldView)
[![Version](https://img.shields.io/cocoapods/v/TagFieldView.svg?style=flat)](https://cocoapods.org/pods/TagFieldView)
[![License](https://img.shields.io/cocoapods/l/TagFieldView.svg?style=flat)](https://cocoapods.org/pods/TagFieldView)
[![Platform](https://img.shields.io/cocoapods/p/TagFieldView.svg?style=flat)](https://cocoapods.org/pods/TagFieldView)

## Example

<table>
   <tr>
     <th>TagField</th>
     <th>TagListView</th>
  </tr>
  <tr>
    <td><img src="./Assets/demo.gif" width="250"/></td>
    <td><img src="./Assets/img.png" width="250"/></td>
  </tr>
</table>

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Usage

just make TagFieldView object and add it as a subview

``` .swift
    let tagFieldView = TagFieldView()
    tagFieldView.frame = CGRect(x: 0, y: 100, width: 300, height: 80)
    view.addSubview(tagFieldView)
```



## How to make TagView?

create TagViewStyle object and add it with tag names

``` .swift
        var style = Style()
        style.showDeleteButton = false
        style.backgroundColor = .hex(hexStr: "#dddddd")
        style.textColor = .darkGray
        style.cornerRadius = 3        
        tagView.addTags("aaa", "bbb", "cccc", "ddddd", "ee", "fffff", with: style)
```

you can set TagViewStyle for each tagView

``` .swift
        let tagView = TagListView()
        let tags = ["aaa", "bbb", "cccc", "ddddd", "ee", "fffff"]
        let colors = (1...10).map { UIColor(hue: CGFloat($0) / 10, saturation: 1, brightness: 1, alpha: 1)}        
        tags.enumerated().forEach { index, text in
            var style = Style()
            style.backgroundColor = colors[index]
            style.textColor = .darkGray
            style.cornerRadius = 3
            style.margin = Margin(x: 5, y: 10)
            tagView.addTag(text, style: style)
        }
```


## Requirements

## Installation

TagFieldView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TagFieldView'
```

## Author

churabou, ginga7888@gmail.com

## License

TagFieldView is available under the MIT license. See the LICENSE file for more info.
