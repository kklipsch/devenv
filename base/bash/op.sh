function signin() {
	eval $(op signin $1)
}

function username() {
	op get item $1 | jq -r '.details.fields[] | select(.designation=="username").value'
}

function password() {
	op get item $1 | jq -r '.details.fields[] | select(.designation=="password").value'
}

function opsource() {
	sourced=$1

	op get document $sourced > $sourced
	source $sourced
	rm $sourced
}
