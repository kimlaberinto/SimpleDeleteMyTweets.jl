import YAML
using Twitter
using Printf

SECRET_KEYS_FILENAME = "secret_keys.yaml"

if !ispath(SECRET_KEYS_FILENAME)
    println(@sprintf "%s file not found! Please make sure to create the appropriate file containing your TWitter Developer keys." SECRET_KEYS_FILENAME)

else
    secrets = YAML.load_file(SECRET_KEYS_FILENAME)

    twitterauth(secrets["consumer_key"],
        secrets["consumer_token"],
        secrets["oauth_token"],
        secrets["oauth_secret"])

    user_timeline_of_tweets = get_user_timeline(screen_name = secrets["twitter_handle"], count=500)
    number_tweets_for_deletion = length(user_timeline_of_tweets)

    println(@sprintf "%d tweets found from account %s... Would you like to delete these tweets? (Y/N)" number_tweets_for_deletion secrets["twitter_handle"])
    response = readline()
    
    if (response == "Y")
        println(@sprintf """ '%s' response detected. Tweets will now be deleted...""" response)
        for tweet in user_timeline_of_tweets
            tweet_id = tweet.id
            println(tweet_id)
            #post_destroy_single_tweet_id(string(tweet_id))
        end
        println("The tweets have now been deleted. Exiting...")
    else
        println(@sprintf """ '%s' response detected. No tweets will be deleted. Exiting...""" response)
    end
end