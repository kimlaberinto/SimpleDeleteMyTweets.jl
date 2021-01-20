# SimpleDeleteMyTweets.jl
Simple script to delete my own tweets using Twitter.jl

**NOTE: Still work in progress as of Jan 19 2021**

## Usage

```
git clone https://github.com/kimlaberinto/SimpleDeleteMyTweets.jl.git
```

Copy the `secret_keys_example.yaml` file and name the new version as `secret_keys.yaml`

Edit the new file as such to include your own Twitter Developer API

Then run the following

```
julia --project deletetweets.jl
```