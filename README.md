# RottenTomatoes
Sample iOS app using Rotten Tomatoes apis, to demonstrate tableview, master detail navigation, basic networking, json parsing

Time Spent : 8 hours

Features implemented :

- List of top movies with async (low res) poster loader
- Tapping on the row takes to movie details with a high res image and more information
- Tapping on the high res image in the detail view shows a full screen image. Tapping on it again dismisses it.
- Loading state is shown when the movie list feed is getting loaded using SVProgressHUD
- Error message appears at the top (replacing the search bar) if there is any network error. This is only on the main screen right now.
- Pull to refresh the list.
- Added a search bar
- Images fade in
- A low res poster is shown which is replaced by the high res which fades in (if not from cache)
- Custom navigation bar

![Video Walkthrough](tomatoes.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).
