import YAML
using Twitter

SECRET_KEYS_FILENAME = "secret_keys.yaml"

secrets = YAML.load_file(SECRET_KEYS_FILENAME)