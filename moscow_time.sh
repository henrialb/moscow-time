# Moscow Time
btctime() {
  moscowTime=$(curl -s https://bitcoinexplorer.org/api/price/sats | jq -r '.usd')

  if [ -z "$moscowTime" ]; then
    echo "Failed to fetch Moscow Time. Check your internet connection or try again later."
    return 1
  fi

  moscowTimeFormatted=$(echo $moscowTime | sed -E 's/^([0-9]{2})/\1:/')

  height=$(curl -s https://mempool.space/api/blocks/tip/height)

  if [ -z "$height" ]; then
    echo "Failed to fetch block height. Check your internet connection or try again later."
    return 1
  fi

  result="$moscowTimeFormatted @ $height"
  echo -n "$result" | pbcopy
  echo "$result"
}
