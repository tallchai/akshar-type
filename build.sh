#!/bin/sh
set -e

fontName="akshar"
variableName="Akshar[wght,cntr].ttf"
sourceDir="sources"
fontDir="fonts"

# fontmake currently does not completely support Devanagari conjuncts.
# GitHub issue: https://github.com/googlefonts/fontmake/issues/706
echo "CREATING A NEW FONTS FOLDER"
rm -rf $fontDir
mkdir -p $fontDir $fontDir/ttf $fontDir/variable

echo "GENERATING FONT INSTANCES: TTF & VARIABLE"
fontmake -g $sourceDir/$fontName.glyphs -i -o ttf --output-dir $fontDir/ttf
fontmake -g $sourceDir/$fontName.glyphs -o variable --output-path $fontDir/variable/$variableName --flatten-components --no-production-names

echo "FIXING HINTING"
for font in $fontDir/ttf/*.ttf
do
	gftools fix-hinting $font;
	if [ -f "$font.fix" ]; then mv "$font.fix" $font; fi
done
gftools fix-dsig --autofix $fontDir/variable/$variableName
gftools gen-stat $fontDir/variable/$variableName --axis-order wdth cntr
gftools fix-unwanted-tables $fontDir/variable/$variableName

rm -rf instance_ufo/ master_ufo/
echo "BUILD COMPLETE"
