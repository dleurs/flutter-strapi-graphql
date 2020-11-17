# Flutter Strapi

Link Flutter and Strapi locally 

![](/assets/phone.png)

![](/assets/bash-strapi.png)

Strapi locally<a href="https://stackoverflow.com/questions/60001536/flutter-socketexception-socketexception-os-error-connection-refused-errno"> does not work with Flutter Android</a> but works with Flutter iOS.

To run strapi locally :
```bash
cd backend-strapi;
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
- In Permissions, cound, find and findone. Save

