Twitify
=======


objective: interact with the Twitter streaming & rest api's in interesting ways with Rails
--

getting started:
==

persist tweets to your rails app in two different ways:

1. rake twitify:startstream[username] will open a long-lived stream connection with Twitter. The default filter pulls in all tweets that contain that phrase 'mac'. You should probably change that to something relevant, but it's there for testing purposes.

2. rake twitify:load[username] will grab the given user's entire tweet history (working on that, now grabs last 199 tweets)