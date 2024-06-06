# Moscow Time

This is a shell function to quickly get the price of one dollar in sats and the current block height copied to clipboard.

Simply paste the content of [`moscow_time.sh`](moscow_time.sh) into your shell configuration file or run the following command in the terminal:


```
echo -e "# Moscow Time\nbtctime() {\n  moscowTime=\$(curl -s https://bitcoinexplorer.org/api/price/sats | jq -r '.usd')\n\n  if [ -z \"\$moscowTime\" ]; then\n    echo \"Failed to fetch Moscow Time. Check your internet connection or try again later.\"\n    return 1\n  fi\n\n  moscowTimeFormatted=\$(echo \$moscowTime | sed -E 's/^([0-9]{2})/\\1:/')\n\n  height=\$(curl -s https://mempool.space/api/blocks/tip/height)\n\n  if [ -z \"\$height\" ]; then\n    echo \"Failed to fetch block height. Check your internet connection or try again later.\"\n    return 1\n  fi\n\n  result=\"\$moscowTimeFormatted @ \$height\"\n  echo -n \"\$result\" | pbcopy\n  echo \"\$result\"\n}" >> ~/.bashrc
```

The above command will add the function to `~/.bashrc`. If you use another shell, change it appropriately. Quit and reopen the terminal or run `source ~/.bashrc` to apply the new configuration.

### Usage

Run `btctime` in your terminal. That's it, Moscow time and block height are displayed and copied to the clipboard. Go ahead and paste it somewhere you want to timestamp.
