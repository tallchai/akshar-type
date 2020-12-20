#!/bin/sh
set -e

fontName="akshar"
variableName="Akshar[wght].ttf"
fontDir="fonts"


# fontmake currently does not completely support Devanagari conjuncts.
# GitHub issue: https://github.com/googlefonts/fontmake/issues/706
# echo "CREATING A NEW FONTS FOLDER"
# rm -rf $fontDir
# mkdir -p $fontDir $fontDir/ttf $fontDir/variable

# echo "GENERATING FONT INSTANCES: TTF & VARIABLE"
# fontmake -g $fontName.glyphs -i -o ttf --output-dir $fontDir/ttf
# fontmake -g $fontName.glyphs -o variable --output-path $fontDir/variable/$variableName

echo "FIXING HINTING"
for font in $fontDir/ttf/*.ttf
do
	gftools fix-hinting $font;
	if [ -f "$font.fix" ]; then mv "$font.fix" $font; fi
done

rm -rf instance_ufo/ master_ufo/
echo "BUILD COMPLETE"
