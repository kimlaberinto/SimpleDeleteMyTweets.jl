import YAML
using Twitter
using Printf

SECRET_KEYS_FILENAME = "secret_keys.yaml"

if !ispath(SECRET_KEYS_FILENAME)
    print(@sprintf "%s file not found! Please make sure to create the appropriate file containing your TWitter Developer keys." SECRET_KEYS_FILENAME)

else
    secrets = YAML.load_file(SECRET_KEYS_FILENAME)

    twitterauth(secrets["consumer_key"],
        secrets["consumer_token"],
        secrets["oauth_token"],
        secrets["oauth_secret"])

    user_timeline_of_tweets = get_user_timeline(screen_name = "KimPLab", count=500)
    for tweet in user_timeline_of_tweets
        tweet_id = tweet.id
        println(tweet_id)
        #post_destroy_single_tweet_id(string(tweet_id))
    end
end