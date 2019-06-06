# SwiftUI - Landmarks

Introducing SwiftUI. A declarative way to create User Interfaces with Swift.

SwiftUI was introduced at WWDC 2019 by Apple. It is their declarative platform for create user interfaces for apps across their platforms. It can be seen as similar to React-Navtive or Flutter without being cross-platform at the moment, hopefully with Swift being open-sourced it can be in the future. With SwiftUI there isn't an existing Storyboard or View Controller present. SwiftUI views are constructed and can be composed of other SwiftUI views. Those views are rendered as code as written automatically via a **Live View** or **Static View** . So far SwiftUI is being heavily pushed by the Apple team and heading into the fall's release of iOS 13 to production SwiftUI will be fully ready for production as well. 

SwiftUI is the following: 
- Declarative
- Automatic 
- Compositional 
- Consistent


## Vocabulary

- View protocol   
- PreviewProvider protocol   
- Resume  
- **body** _property_   
- structured editing popover 
- stacks
- VStack 
- HStack 
- ZStack
- Spacer
- embed views e.g emben in VStack 
- padding 
- UIViewRepresentable - a view that represents a UIKit view 
- static preview (fully renders SwiftUI views)
- live view (to fully render UIKit views) 

## Readings 

- [SwiftUI Essentials: Creating and Combining Views](https://developer.apple.com/tutorials/swiftui/creating-and-combining-views)


```swift 
struct ContentView : View {
    var body: some View {
        Text("Hello San Jose, Welcome to WWDC 2019")
    }
}
```

For debugging in preview 

```swift 
#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
```

Customizing the Text View 

```swift
struct ContentView : View {
    var body: some View {
        Text("Turtle Rock")
        .font(.title)
        .color(.orange)
    }
}
```

## Combine Views using Stacks

The **body** property only returns a single view. 

```swift 
struct ContentView : View {
  var body: some View {
    VStack (alignment: .leading) {
      Text("Turtle Rock")
        .font(.title)
        .color(.green)
      HStack {
        Text("Joshua Tree National Park")
          .font(.subheadline)
        Spacer()
        Text("California")
          .font(.subheadline)
      }
    }
    .padding()
  }
}
```


## Create a Custom Image View

```swift
import SwiftUI

struct CircleImage : View {
    var body: some View {
        Image("turtlerock")
          .clipShape(Circle())
          .overlay(Circle().stroke(Color.white, lineWidth: 4))
          .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif
```

## Using UIView and SwiftUI together 

```swift 
struct MapView : View, UIViewRepresentable {
  func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
    let coordinate = CLLocationCoordinate2D(
      latitude: 34.011286, longitude: -116.166868)
    let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    view.setRegion(region, animated: true)
  }
  
  func makeUIView(context: Context) -> MKMapView {
    MKMapView(frame: CGRect.zero)
  }
}

#if DEBUG
struct MapView_Previews : PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
#endif
```

## Compose the Detail View

```swift 
struct ContentView : View {
  var body: some View {
    VStack {
      MapView()
        .edgesIgnoringSafeArea(.top)
        .frame(height: 300)
      CircleImage()
        .offset(y: -130)
        .padding(.bottom, -130)
      VStack (alignment: .leading) {
        Text("Turtle Rock")
          .font(.title)
          .color(.green)
        HStack {
          Text("Joshua Tree National Park")
            .font(.subheadline)
          Spacer()
          Text("California")
            .font(.subheadline)
        }
      }
      .padding()
      
      Spacer()
    }
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
    
    //ContentView()
  }
}
#endif
```



