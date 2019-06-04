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
- Spacer
- embed views e.g emben in VStack 
- padding 


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

