import YAML
using Twitter
using Printf

SECRET_KEYS_FILENAME = "secret_keys.yaml"

if !ispath(SECRET_KEYS_FILENAME)
    print(@sprintf "%s file not found! Please make sure to create the appropriate file containing your TWitter Developer keys." SECRET_KEYS_FILENAME)

else
    secrets = YAML.load_file(SECRET_KEYS_FILENAME)

end