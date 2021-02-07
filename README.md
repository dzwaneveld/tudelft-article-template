# TU Delft - Unofficial Article Template (v1.2)

A simple article template following all the guidelines of AE2223-I, based on the official AIAA template. Supports one and two columns. This template is made specifically for AE2223-I, but it is essentially a very simple article template that looks very similar to the official AIAA template. A preview for the one and two column layout can be found below.

<p align="center">
  <img align="centre"  src="https://raw.githubusercontent.com/dzwaneveld/TU-Delft-Unofficial-Article-Template/master/figures/sample.png" alt="" width="650" />

## Usage

This template is made for pdfLaTeX and uses BibTeX for the bibliography. If you would like to use it on [Overleaf](https://overleaf.com), download this project as a .zip file and create a new project > upload project.

If you would like to switch to two columns, simply add 'twocolumn' to the global options, resulting in the first line in `article.tex` as can be seen below. The title and abstract remain one column, as a consequence of the `\AlwaysPagewidth{}` command.

```
\documentclass[twocolumn]{layout/tudelft-aiaa}
```

## Changelog

| Version | Notable Changes |
|---------|-----------------|
| 1.0     | Initial Release |
| 1.1     | Fixed issues with the nomenclature in `twocolumn` mode. |
|         | Minor adjustments and fixes |
| 1.2     | Fixed inconsistency with nomenclature |
|         | Minor adjustments and fixes |

The updates in-between consist of minor bug fixes.

## License

This template is available under CC BY-NC 4.0. For more information, see https://creativecommons.org/licenses/by-nc/4.0/. No attribution is required in articles created using this template.
