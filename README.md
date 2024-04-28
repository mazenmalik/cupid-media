Hello!

Here's my attempt to solve this test.

Overview:
I build a one page app with cascading dropdowns using Clean Architecture and flutter_bloc as my state managent. This is to make sure that the app is easier to maintain, scale and testable.

#### Requirements:

- Flutter SDK version: 3.19.6 on channel stable (latest as of writing)

Architecture/Structure
-Followed the basic concept a clean architecture with 3 layers:

1. Data Layer
   - datasource - local or remote data source
   - repository - repository implentation of domain repo
   - models - model extended from entities in domain
2. Domain Layer
   - entities - enties for api response, one for each endpoint
   - repositories - abstract repo
   - usecases - usecases
3. Presentation Layer
   - pages
   - state management - (e.g. provider, flutter_bloc, riverpod)
4. Other folders:
   Core
   -constanst
   -reusables
   -and etc
   Config folder - configuration of the app
   -theme
   -route
   -firebase (prod/staging) and many more

The same structure in the Test Folder - Domain, Data and Presentation for better tracking and organize unit test.

Made sure to perform unit test on all files that are testable with the help test mocks.

GIT

Branch Naming
feat/ feature_name
chore/ part of the feature but in a separate branch

Commit Messages
fix: fixing something
chore: task
merge: merging a branch to another

Key points:
I used two blocs to separate the state of countries and states/cities. So they are independent of one another.
I used http package for network for an easier approach on testing repositories and other data related files.

Note: to make it secure i would place api credentials in .ENV and add it to .getignore for a better security. I would have use dotenv package for this and send .ENV to fellow devs.

If you have any questions or need assistance, please feel free to contact me at malikmazen@gmail.com.

Excited to work you soon. Thank you!

- Mazen Malik
