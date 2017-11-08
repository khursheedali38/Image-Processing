# Image-Processing
This repository contains work involved in processing medical images. We demonstrate two applications:
- Skull Stripping of MRI Brain images, so as to calculate volume of brain from each 2D slice.
- Image denoising using Rough Sets Theory.

## Skull Stripping 
Involves extracting out the gray matter and white matter of brain. Morphological operators are used for extraction.
`skullStripping/brain_extract.m` represents the flow of algorithm.

## Image denoising using Rough Sets Theory
Work carried is an implementation of paper [On Medical Image Denoising using Rough Sets Theory](http://ieeexplore.ieee.org/document/4666537/).
In a nutshell it involves:
- Enhancing image using Rough Sets
- Following the flow represented and implemented in `denoiseRST/denoise.m`and `filters.m`.

## Counting the number of unused tablets
This is an approach to get a count of unused tablets from a tablet strip. It gives an approach to following two questions:
- Count the number of unused tablets.
- Find the centre location of the used tablet.
The flow and implementation can be found in `tabletsCount\tablets.m`

## Built With
- Matlab(R2015a RELEASE)
