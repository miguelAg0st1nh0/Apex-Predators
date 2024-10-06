Apex Predators 🦖🌍

A demo Swift app built to showcase my skills in SwiftUI, JSON parsing, MapKit integration, and basic iOS UI elements. The app focuses on displaying a variety of apex predators, their habitats, and interesting details like their diet and appearances in movies.

Features 📱

Predator List: View a list of apex predators, filtered by type (land, air, sea) and sorted alphabetically or by movie appearances.
Predator Details: Detailed view of each predator, showing their diet, type, and movie scenes they’ve appeared in.
Interactive Map: Explore predator habitats on a map with pins representing the predator's locations.
Search Functionality: Search through the list of predators to find specific ones.
Dark Mode Support: The app adapts to both light and dark modes dynamically.

Technologies Used 🛠️

Swift: Core language for the app.
SwiftUI: UI framework for designing modern interfaces.
MapKit: Used to display predator habitats on an interactive map.
JSON Parsing: Fetching and decoding local JSON data to populate the app with information about predators.
Environment and State Management: Leveraging Swift’s @State, @Environment, and @StateObject for managing app state and user preferences.

Installation 🧑‍💻

Clone the repository:

git clone https://github.com/miguelAg0st1nh0/ApexPredators.git

Open the project in Xcode:

open ApexPredators.xcodeproj

Run the app on a simulator or a connected device.

JSON Data Structure 📄

The app reads data from a local JSON file. Here is an example structure for a predator:

{
  "id": 1,
  "name": "Tyrannosaurus Rex",
  "type": "land",
  "latitude": 35.6895,
  "longitude": 139.6917,
  "length": "12m",
  "height": "6m",
  "weight": "9000kg",
  "movies": ["Jurassic Park"],
  "movieScenes": [
    {
      "id": 1,
      "movie": "Jurassic Park",
      "sceneDescription": "Rex breaks out of its cage."
    }
  ],
  "link": "https://en.wikipedia.org/wiki/Tyrannosaurus",
  "diet": "carnivore"
}


Screenshots 📸

![Simulator Screenshot - iPhone 16 Pro Max - 2024-10-06 at 13 45 11](https://github.com/user-attachments/assets/9fd7f5e2-e2dd-4f9a-84c5-4d8d67c6f7ac)
![Simulator Screenshot - iPhone 16 Pro Max - 2024-10-06 at 13 44 43](https://github.com/user-attachments/assets/3d40fd21-7c76-467f-bffa-4b74da5b987a)
![Simulator Screenshot - iPhone 16 Pro Max - 2024-10-06 at 13 44 18](https://github.com/user-attachments/assets/844bbd45-75ae-4c46-9b80-b8761fb3be99)
![Simulator Screenshot - iPhone 16 Pro Max - 2024-10-06 at 13 44 05](https://github.com/user-attachments/assets/2323d51c-08fd-4381-9462-93718eba4494)
![Simulator Screenshot - iPhone 16 Pro Max - 2024-10-06 at 13 43 44](https://github.com/user-attachments/assets/aa5c0664-e0e0-4635-840b-6d3fc8cbb24b)
![Simulator Screenshot - iPhone 16 Pro Max - 2024-10-06 at 13 43 00](https://github.com/user-attachments/assets/aafcb114-28a9-4536-96b1-b237e3d670f1)
![Simulator Screenshot - iPhone 16 Pro Max - 2024-10-06 at 13 42 54](https://github.com/user-attachments/assets/f082be4d-9922-48a6-9145-52a0fae9c89f)

Future Improvements 🔧

Add more predator types.
Expand movie information with trailers and more detailed descriptions.
Implement ARKit to visualize predators in augmented reality.
Contact 📧

Feel free to reach out if you have any questions or feedback!

LinkedIn: [Your LinkedIn](https://www.linkedin.com/in/miguel-agostinho-870075b4/)
