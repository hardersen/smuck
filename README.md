# Shared Frameworks for Xcode 6

Smuck is a boilerplate workspace for Xcode 6 that consists of a Shared Framework, an OS X app and an iOS app. For now it's only Objective-C, not Swift.

To use Smuck simply clone and run the included smuckify script:

```
#
# Script to rebrand Smuck and make your own project.
#
# Usage: ./smuckify.sh ProjectName BundleIdentifier CopyrightName
#
# Example ./smuckify.sh "MyApp" "com.example" "John Appleseed"
#
# This will rebrand Smuck to MyApp with the bundle identifier
# com.example.MyApp and change all copyright stuff to
# John Appleseed. 
#
# It will also take care of the 'created by' dates.
#
# smuckify.sh needs to be run from the root directory of 
# the Smuck project.
#
```

Smuck is licensed under the MIT license, but I've removed the copyright condition so you're free to use this boilerplate without having to mention me or anything else. The smuckify script will make it look like you did all the hard work yourself, which is the exact point of this boilerplate.

The process of setting up Shared Frameworks for Xcode 6 manually is thoroughly explained on [my blog](http://blog.hardersen.net/2015/03/shared-frameworks-in-xcode-6.html). 
