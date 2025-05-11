# Scout Motors Weather iOS Take Home Assignment

### Architecture
- For this project I elected to use the Model-View-ViewModel (MVVM) architecture. This decision was based on the fact that this project is 100% in SwiftUI. SwiftUI and MVVM pair exceptionally well due to their complimentary architectures and the way SwiftUI handles data and UI updates.
    - One core principle of MVVM and SwiftUI is to **Decouple and Separate out Concerns**. SwiftUI is a declarative style of programming where you describe *what* the UI should be instead of specifying *how* to update it. This aligns perfectly with MVVM, where the Vie wModel provides the state, and the View simply *declares* how to present that state. We can clearly separate our business logic code from our view code, allowing for clear separation of concerns throughout the project.
    - A second core principle of MVVM and SwiftUI is **Data Binding**. SwiftUI's built in binding capabilities pairs perfectly with one of MVVM's main strengths, which is data binding.
    - Another core principle of MVVM and SwiftUI is **Testability**. By separating out our view logic from the business logic, it makes for mocking and testing behaviors of our View Models without needing to instantiate any UI components.

### Project Thoughts/Assumptions
- As mentioned in the comments I have left in various views, I have elected to only pair ***complex*** views with corresponding view models. I made this decision as I think view's that only display passed in data, what I consider ***simple*** views, do not require a corresponding view model. Once a view evolves into the need for doing more than displaying data (i.e. fetching data, creating child view models, etc), then a corresponding view model can be created for it.
    - If a ***simple*** view requires many data points to display, it may make sense to create a corresponding **datasource** for that view to help manage.
- As mentioned in another comment, for the sake of this assignment and time, I access my API key locally from the method I need it in. In a real, production level application, this would **not** be my choice of action. The API key most likely would be fetched from the backend or something similar instead of accessing it inline.
- Rate limiting for the API is handled via the architecture of the application. An API call is only ever made once in the .task view modifier of ForecastListContainerView and that view modifier is triggered only once.
- **Swift 6 and Swift Concurrency**
        - Since this was a brand new Xcode project, I decided to support the latest iOS version as my minimum required iOS version, which is iOS 18.4. Because of this, I elected to fully use Swift 6 and strict concurrency using async/await, Actors and Tasks. Swift concurrency makes writing and testing concurrent code more manageable and easy to understand compared to using completion handlers or Combine.
