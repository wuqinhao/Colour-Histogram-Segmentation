# Colour-Histogram-Segmentation
RGB 3D histogram segmentation designed for retinal optic nerve head segmentation.

The method is modified from Ramella and Baja [1]. Histogram blurring inspired by Kurugollu et al. [2].

Process of segmentation is offered by 2-step threshold of selecting dominant peak, resulting in the recreate image as the segmentation map.

Several output for giving the quantifying result of the diameter of optic disc.

Example running script is runsegmentation_drions.m, which required DRIONS-DB dataset.
DRIONS-DB website: http://www.ia.uned.es/~ejcarmona/DRIONS-DB.html

[1] Ramella, Giuliana, and Gabriella Sanniti di Baja. "Color histogram-based image segmentation." International Conference on Computer Analysis of Images and Patterns. Springer, Berlin, Heidelberg, 2011.
[2] Kurugollu, Fatih, Bülent Sankur, and A. Emre Harmanci. "Color image segmentation using histogram multithresholding and fusion." Image and vision computing 19.13 (2001): 915-928.
