#!/bin/bash
diff --brief <(wget -q -O - https://raw.githubusercontent.com/sambacha/solidity-parser-explorer/master/grammer.js) <(wget -q -O - https://raw.githubusercontent.com/JoranHonig/tree-sitter-solidity/master/grammar.js) >/dev/null
comp_value=$?

if [ $comp_value -eq 1 ]
then
    echo "DIFFERENT, NOT SAME"
else
    echo "SAME, BUT DIFF"
fi
