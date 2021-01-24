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

    user_favorites_list = get_favorites_list(screen_name = secrets["twitter_handle"], count=200)
    number_likes_for_deletion = length(user_favorites_list)

    println(@sprintf "%d favorites/likes found from account %s... Would you like to delete these favorites? (Y/N)" number_likes_for_deletion secrets["twitter_handle"])
    response = readline()
    
    if (response == "Y")
        println(@sprintf """'%s' response detected. Likes/Favorites will now be deleted...""" response)
        for favorite in user_favorites_list
            favorite_id = favorite.id
            post_favorites_destroy(id=favorite_id)
        end
        println("The tweets have now been deleted. Exiting...")
    else
        println(@sprintf """ '%s' response detected. No tweets will be deleted. Exiting...""" response)
    end
end