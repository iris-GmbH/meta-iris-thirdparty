This README file contains information on the contents of the meta-iris-thirdparty layer.

Please see the corresponding sections below for details.

Dependencies
============
 -

Patches
=======

Please submit any patches against the meta-iris-thirdparty layer via github pull requests

Maintainers: 
- Jasper Orschulko <Jasper [dot] Orschulko [at] iris-sensing.com>
- Erik Schumacher <Erik [dot] Schumacher [at] iris-sensing.com>

Table of Contents
=================

   I. Adding the meta-iris-thirdparty layer to your build
  II. Misc


I. Adding the meta-iris-base layer to your build
=================================================

Run 'bitbake-layers add-layer meta-iris-thirdparty'

III. Misc
========

This repository contains recipes for various software contained in our IRIS IRMA SIX product.
We try to keep the recipes as generic as possible in order to cover common use-cases.
Feel free to integrate this layer into your own Yocto builds. Contributions are welcome!

The Maintainers of this layer focus on supporting the current Yocto LTS release.
However, feel free to add support for other layers via pull requests.
In the future we plan to include all currently supported Yocto releases in a CI workflow.
