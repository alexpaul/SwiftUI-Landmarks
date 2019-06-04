# SwiftUI-Creating-Views
SwiftUI. Creating and Combining Views


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



