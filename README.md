Add the following to ~/.zshrc

```shell
function em() {
	# If no arguments provided, just bring Emacs to front / create frame if none exists
	if [[ $# -eq 0 ]]; then
		if [[ "$OSTYPE" == darwin* ]]; then
			osascript -e 'tell application "Emacs" to activate' 2>/dev/null
		else
			emacsclient -n -a ""
		fi
		return 0
	fi

	local args=()
	for input in "$@"; do
		# Match file:line:col or file:line
		if [[ "$input" =~ ^(.*):([0-9]+):([0-9]+)$ ]]; then
			args+=("+$match[2]:$match[3]" "$match[1]")
		elif [[ "$input" =~ ^(.*):([0-9]+)$ ]]; then
			args+=("+$match[2]" "$match[1]")
		else
			args+=("$input")
		fi
	done

	emacsclient -n -a "" "${args[@]}"
	if [[ "$OSTYPE" == darwin* ]]; then
		osascript -e 'tell application "Emacs" to activate' 2>/dev/null
	fi
}
```
