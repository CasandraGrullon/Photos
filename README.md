
# Photos

## The App

![mainapp](https://user-images.githubusercontent.com/55723318/132568457-a7f43f52-16df-4b1b-bc51-2923de0590f1.gif)

This is a simple project populating a collection view with data from an api.
While the network call is being made, a loading spinner is presented.

Selecting a cell will present a detail view with a larger UIImageView and title.

On the instance of a network related error, an alert is presented to the user.

![alertcontroller](https://user-images.githubusercontent.com/55723318/132568813-609450b0-94b8-4243-b453-7c7c2c49ed0a.gif)

## App Architecture

MVC architecture with programmatic views.

## CocoaPods

Utilized the Kingfisher CocoaPod to set the UIImageView images.
(https://cocoapods.org/pods/Kingfisher)

## Testing

Added unit tests for the model, APIClient, and view controllers

Unit test for the Photo model

<img width="781" alt="Screen Shot 2021-09-08 at 2 54 46 PM" src="https://user-images.githubusercontent.com/55723318/132568335-d2bc83e4-27b6-431e-ba3e-0f8a5d856cee.png">

## Future Iterations

For future implementations, I think it would be an interesting idea to translate the latin titles provided by the api to the device's set language.

