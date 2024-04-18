# FriendFaces

<table>
<tr>
<td>

## About the Project

FriendFaces fetches a collection of randomly generated user data from a provided URL, decodes the JSON into Swift types, and presents it.

### Features

- **Networking with URLSession:** Efficiently fetches JSON data from the internet.
- **JSON Parsing with Codable:** Seamlessly converts JSON data into Swift structs for `User` and `Friend`.
- **Dynamic Lists:** Displays a list of users, showing brief information like their name and active status.
- **Detailed User Profiles:** Tapping on a user reveals a detailed view with more comprehensive information, including their friends' names.
- **SwiftUI Navigation:** Utilizes `NavigationStack` for intuitive navigation between user lists and detailed views.

### Technical Highlights

- Implementing `URLSession` to fetch data from the web.
- Utilizing `Codable` for efficient JSON parsing and data model creation.
- Designing user interfaces with SwiftUI, including lists and detail views.
- Applying Swift's `DateDecodingStrategy` for handling ISO-8601 date formats.
- Encouraging best practices for loading data only when necessary to avoid redundant network requests.

</td>
<td>

![export777C6D61-B019-4229-8D69-32519E4816C4](https://github.com/ricardonovelot/FriendFaces/assets/84286086/aab55761-764b-4cfc-a0e0-72a27b71466e)
![export933BF086-300A-462E-99A9-8E6B41FA2136](https://github.com/ricardonovelot/FriendFaces/assets/84286086/ad92d033-5ded-4907-a35b-e80fa39c4b2c)

</td>
</tr>
</table>

## Installation and Usage

To experience FriendFace:

1. Clone the GitHub repository: git clone https://github.com/yourusername/FriendFace.git
2. Open the project in Xcode.
3. Choose your target device or simulator.
4. Build and run the application.
 
Ensure your development environment is up to date, specifically with the latest Xcode version, to fully support all SwiftUI features showcased in this project.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

## Acknowledgments

"100 Days with SwiftUI" for presenting the challenge and guiding through advanced concepts of SwiftUI and Swift.
The iOS development community for sharing knowledge and best practices.
