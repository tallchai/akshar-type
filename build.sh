# Build font
gftools builder sources/builder.yaml

# Remove CNTR axis as long as Google Fonts doesn't support it:
fonttools varLib.instancer -o "fonts/variable/Akshar[wght].ttf" "fonts/variable/Akshar[CNTR,wght].ttf" CNTR=0
