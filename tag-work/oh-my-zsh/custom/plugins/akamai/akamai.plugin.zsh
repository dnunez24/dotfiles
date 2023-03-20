function akamai-cache() {
  if [[ -z "$AKAMAI_PRAGMA_AUTH_TOKEN" ]]; then
    echo "The AKAMAI_PRAGMA_AUTH_TOKEN environment variable must have a value set" && exit 1
  fi

  PRAGMA_HEADER="Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-true-cache-key"
  PRAGMA_AUTH_HEADER="PragmaAuth: ${AKAMAI_PRAGMA_AUTH_TOKEN}"

  if [[ -z "$@" ]]; then
    echo "A URL arg is required" && exit 1
  fi

  curl -I -H "$PRAGMA_HEADER" -H "$PRAGMA_AUTH_HEADER" "$@"
}
