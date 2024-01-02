# Fail fast
set -e

# Build font
gftools builder sources/builder.yaml
fonttools varLib.instancer -o "fonts/variable/Akshar[YOPQ,wght].ttf"
