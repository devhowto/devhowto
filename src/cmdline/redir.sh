#!/bin/bash

>&1 cat << EOF
OK
EOF

>&2 cat << EOF
ERR
EOF

cat << EOF >&1
X
EOF

cat >&1 << EOF
Y
EOF

>&1 cat << EOF
Z
EOF
