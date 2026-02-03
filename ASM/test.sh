#!/usr/bin/env bash

set -e

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

ok()    { echo -e "${GREEN}[OK]${RESET} $1"; }
fail()  { echo -e "${RED}[FAIL]${RESET} $1"; exit 1; }

echo "=== Testing Colleen ==="
./Colleen > out_colleen
diff -u Colleen.* out_colleen || fail "Colleen output mismatch"
ok "Colleen"

echo "=== Testing Grace ==="
./Grace
diff -u Grace.* Grace_kid.* || fail "Grace output mismatch"
ok "Grace"

echo "=== Testing Sully ==="
./Sully

FILES=(Sully.s $(ls Sully_*.s 2>/dev/null | sort -V))
[ "${#FILES[@]}" -lt 2 ] && fail "Sully did not generate children"

for ((i=0; i<${#FILES[@]}-1; i++)); do
	PARENT="${FILES[i]}"
	CHILD="${FILES[i+1]}"

	DIFF="$(diff "$PARENT" "$CHILD" || true)"

	# Check parent and child i dq lines exist
	echo "$DIFF" | grep -Eq '^< i dq -?[0-9]+$' \
		|| fail "$CHILD: missing parent i dq line"
	echo "$DIFF" | grep -Eq '^> i dq -?[0-9]+$' \
		|| fail "$CHILD: missing child i dq line"

	# Ensure ONLY that line differs
	DIFF_LINES=$(echo "$DIFF" | grep -E '^<|^>')
	NUM_LINES=$(echo "$DIFF_LINES" | wc -l)
	[ "$NUM_LINES" -eq 2 ] || fail "$CHILD: unexpected extra differences"
done

ok "Sully"

rm -f out_colleen

echo
echo "🎉 All quines passed successfully 🎉"
