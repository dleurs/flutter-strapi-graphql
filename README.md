# Flutter Strapi

Link Flutter and Strapi locally 

![app-backend-demo](/assets/app-backend-demo.gif)

Strapi locally<a href="https://stackoverflow.com/questions/60001536/flutter-socketexception-socketexception-os-error-connection-refused-errno"> does not work with Flutter Android</a> but <strong>works with Flutter iOS on simulator</strong>.


To run strapi locally :
```bash
cd backend-strapi;

npm install -g npm
npm install 

yarn develop;
```
You can also setup an online demo of strapi <a href="https://strapi.io/demo">here</a>. Instructions to setup this live demo below.


To run flutter : 
```bash
cd frontend;
flutter run; # or F5 in vscode
```


# GraphQL on Flutter
https://medium.com/better-programming/how-to-use-graphql-in-flutter-7decd04a511f

https://github.com/zino-app/graphql-flutter

https://hasura.io/learn/graphql/flutter-graphql/introduction/

https://strapi.io/documentation/v3.x/plugins/graphql.html#query-api

https://www.youtube.com/watch?v=GxmQd8IaghE

VSCode :<br/>
- Prisma
- GraphQL

# Tutorial

https://www.youtube.com/watch?v=M7PvukaN6PM<br/>
https://github.com/itsmaheshkariya/flutter-strapi-crud

# To reset GraphQL schema, use GraphQL plugin on Android Studio 

I just use Android Studio to update GraphQL, follow guide :

https://medium.com/@v.ditsyak/ultimate-toolchain-to-work-with-graphql-in-flutter-13aef79c6484

# Json_serializable

https://flutter.dev/docs/development/data-and-backend/json#code-generation

# Backend Strapi 

A quick description of your strapi application

To launch the project, use
```bash
yarn develop
```
Then, from your browser, you can access :
- http://localhost:1337/admin
- http://localhost:1337/graphql

### Creation of the API 

https://strapi.io/documentation/v3.x/installation/cli.html

To create the project, I used 
```bash
yarn create strapi-app my-project --quickstart
```
- Then, create an admin user on browser that just popup
- In your browser, localhost:1337/admin, go to "Content-Types Builder"
- + Creta new collection type
- Display name : todo > continue
- Text > name > finish
- Save
- Todos > Add New todo > "Do sport", "Cooking pelmenis" and "Meditation" > save AND publish
- Marketplace > GraphQL > Download
- Settings > Roles > Public 
- In Permissions, application > todos, add find and findone. Save
- In Permissions, users-permissions > user, add find and findone. Save


