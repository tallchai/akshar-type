# CONTRIBUTING
For new features or in case of bugs, please log an issue on the [tallchai/akshar-type](https://github.com/tallchai/akshar-type) repo.

## GlyphsApp
Akshar was built with [GlyphsApp](https://glyphsapp.com/) Version 2, a popular font development tool.
To contribute, you will need a Macbook and a licensed copy of GlyphsApp.

## Devanagari Conjuncts
[Conjuncts](https://en.wikipedia.org/wiki/Devanagari_conjuncts) are a key characteristic of Devanagari script and other Brahmic scripts. They are constructed of more than two consonant letters. For example: `क्य`, `ज्ञ`, `द्ध` and `श्र` etc.
The library [fontmake](https://github.com/googlefonts/fontmake) has an [known issue](https://github.com/googlefonts/fontmake/issues/703) with
reading the ligature/conjunct anchors and not handling them as expected.
The current workaround for this issue, when working with GlyphsApp, is as follows:
- Go to File > Font Info (or press `Cmd` + `I`)
- Go to the **Features** tab.
- From the features list, for the feature: `cjct` (Conjunct Forms), turn off "Generate feature automatically".
- Manually enter the lookup information for the conjuncts. Depending on the conjunct, the info must be specified in one of the three lookup table objects:
  - cjct_devanagari_rakar_forms
  - cjct_Halfdevanagari
  - cjct_devanagari
- Save (`Cmd` + `S` before closing)

## Building
To build the fonts from the source file, you will need to install [gftools](https://github.com/googlefonts/gftools).
Once you have installed it, run the following:
`gftools builder sources/builder.yaml` from the root of the project.

This should build the font files based on the configuration specified in sources/builder.yaml.

Update the version number for the font. Follow the [Semantic Versioning](https://semver.org/) guidelines when updating the version. In the [CHANGELOG](CHANGELOG.md) file, list the enhancements/updates/fixes made under the new version number.

