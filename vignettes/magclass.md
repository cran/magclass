---
title: "MAGPIE Class Tutorial"
author: "Jan Philipp Dietrich"
date: "2017-08-04"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{MAGPIE Class Tutorial}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---



This tutorial provides a basic introduction to magpie objects in R. If you would like to get more details on the concept of and the idea behind magpie objects you can have a look at [magclass-concept](magclass-concept.html), where this is explained in more detail by comparing the magpie class to other data classes in R.

## Generate a magpie object

Generation of magpie objects can either be done from scratch, by reading in files or by converting objects from other classes to magpie objects. For creation of a new magpie object you can use `new.magpie`, conversion of an existing object happens with `as.magpie`:


```r
library(magclass)

# creating a magpie object with 2 regions, 2 years and 2 different values
m <- new.magpie(cells_and_regions=c("AFR","CPA"),
                years=c(1995,2000),
                names=c("bla","blub"),
                sets=c("region","year","value"),
                fill=0)
print(m)
#> , , value = bla
#> 
#>       year
#> region y1995 y2000
#>    AFR     0     0
#>    CPA     0     0
#> 
#> , , value = blub
#> 
#>       year
#> region y1995 y2000
#>    AFR     0     0
#>    CPA     0     0

# converting a simple vector with one value per region to a magpie object
v <- c(ENG=10, USA=20, BRA=30, CHN=40, IND=50)
m2 <- as.magpie(v)
str(m2)
#> Formal class 'magpie' [package "magclass"] with 1 slot
#>   ..@ .Data: num [1:5, 1, 1] 10 20 30 40 50
#>   .. ..- attr(*, "dimnames")=List of 3
#>   .. .. ..$ fake: chr [1:5] "ENG" "USA" "BRA" "CHN" ...
#>   .. .. ..$ NA  : NULL
#>   .. .. ..$ NA  : NULL
```


In the example above the names were automatically detected as regions, if for some reason the automatic detection fails you can also indicate to what type of dimension the data belongs. Lets assume in the following example, that the names are not representing regions but something else. The argument `spatial=0` indicates the non-existence of a spatial dimension, but it can also be used to point to the spatial dimension in the data.


```r
m3 <- as.magpie(v, spatial=0) 
str(m3)
#> Formal class 'magpie' [package "magclass"] with 1 slot
#>   ..@ .Data: num [1, 1, 1:5] 10 20 30 40 50
#>   .. ..- attr(*, "dimnames")=List of 3
#>   .. .. ..$ fake: chr "GLO"
#>   .. .. ..$ NA  : NULL
#>   .. .. ..$ NA  : chr [1:5] "ENG" "USA" "BRA" "CHN" ...
```

## Accessing magpie objects

For the following the example data set `population_magpie` is used. For convenience we will just shorten its name:


```r
data("population_magpie")
pm <- population_magpie
```

### General properties

Let's first have a look at the content of the magpie object:

Show the structure of the object:

```r
str(pm)
#> Formal class 'magpie' [package "magclass"] with 1 slot
#>   ..@ .Data: num [1:10, 1:16, 1:2] 553 1281 554 276 452 ...
#>   .. ..- attr(*, "dimnames")=List of 3
#>   .. .. ..$ i       : chr [1:10] "AFR" "CPA" "EUR" "FSU" ...
#>   .. .. ..$ t       : chr [1:16] "y1995" "y2005" "y2015" "y2025" ...
#>   .. .. ..$ scenario: chr [1:2] "A2" "B1"
```

Show the first elements:

```r
head(pm)
#> An object of class "magpie"
#> , , scenario = A2
#> 
#>      t
#> i         y1995   y2005   y2015   y2025   y2035   y2045
#>   AFR  552.6664  696.44  889.18 1124.11 1389.33 1659.73
#>   CPA 1280.6350 1429.53 1518.46 1592.09 1640.95 1671.94
#>   EUR  554.4384  582.36  593.76  605.27  614.58  618.97
#> 
#> , , scenario = B1
#> 
#>      t
#> i         y1995   y2005   y2015   y2025   y2035   y2045
#>   AFR  552.6664  721.85  932.04 1118.33 1267.33 1383.24
#>   CPA 1280.6350 1429.26 1499.74 1531.12 1518.73 1463.68
#>   EUR  554.4384  587.21  603.63  613.98  619.48  617.12
```
Show the last elements:

```r
tail(pm)
#> An object of class "magpie"
#> , , scenario = A2
#> 
#>      t
#> i       y2095   y2105   y2115   y2125   y2135   y2145
#>   PAO  166.31  167.49  167.49  167.49  167.49  167.49
#>   PAS  843.52  839.53  839.53  839.53  839.53  839.53
#>   SAS 3007.86 2972.39 2972.39 2972.39 2972.39 2972.39
#> 
#> , , scenario = B1
#> 
#>      t
#> i       y2095   y2105   y2115   y2125   y2135   y2145
#>   PAO  140.82  138.80  138.80  138.80  138.80  138.80
#>   PAS  536.24  507.06  507.06  507.06  507.06  507.06
#>   SAS 1629.07 1528.15 1528.15 1528.15 1528.15 1528.15
```

Which regions are in the data and how many?

```r
getRegions(pm)
#>  [1] "AFR" "CPA" "EUR" "FSU" "LAM" "MEA" "NAM" "PAO" "PAS" "SAS"
nregions(pm)
#> [1] 10
```

Which years and how many?

```r
getYears(pm)
#>  [1] "y1995" "y2005" "y2015" "y2025" "y2035" "y2045" "y2055" "y2065"
#>  [9] "y2075" "y2085" "y2095" "y2105" "y2115" "y2125" "y2135" "y2145"
nyears(pm)
#> [1] 16
```

Which data elements?

```r
getNames(pm)
#> [1] "A2" "B1"
```

...and splitted in subdimensions

```r
getNames(pm,fulldim=TRUE)
#> $scenario
#> [1] "A2" "B1"
```

...and how many?

```r
ndata(pm)
#> [1] 2
```

What are the sets (dimensions names) of the data?

```r
getSets(pm)
#> [1] "i"        "t"        "scenario"
```

are there any comments which come with the data?

```r
getComment(pm)
#> NULL
```

let's have a look at the full dimensionality of the object

```r
fulldim(pm)
#> [[1]]
#> [1] 10 16  2
#> 
#> [[2]]
#> [[2]]$i
#>  [1] "AFR" "CPA" "EUR" "FSU" "LAM" "MEA" "NAM" "PAO" "PAS" "SAS"
#> 
#> [[2]]$t
#>  [1] "y1995" "y2005" "y2015" "y2025" "y2035" "y2045" "y2055" "y2065"
#>  [9] "y2075" "y2085" "y2095" "y2105" "y2115" "y2125" "y2135" "y2145"
#> 
#> [[2]]$scenario
#> [1] "A2" "B1"
```

if this is a bit confusing, this is the condensed version analogous to the standard 3 dim subsetting

```r
dimnames(pm)
#> $i
#>  [1] "AFR" "CPA" "EUR" "FSU" "LAM" "MEA" "NAM" "PAO" "PAS" "SAS"
#> 
#> $t
#>  [1] "y1995" "y2005" "y2015" "y2025" "y2035" "y2045" "y2055" "y2065"
#>  [9] "y2075" "y2085" "y2095" "y2105" "y2115" "y2125" "y2135" "y2145"
#> 
#> $scenario
#> [1] "A2" "B1"
```

These functions can also be used to manipulate the object:

set a comment

```r
getComment(pm) <- "This is a comment!" 
getComment(pm)
#> [1] "This is a comment!"
```
...or alternatively

```r
pm2 <- setComment(pm,"This is comment for pm2!")
getComment(pm2)
#> [1] "This is comment for pm2!"
```
rename 1st region in "RRR" 

```r
getRegions(pm)[1] <- "RRR" 
```
rename region set in "zones" 

```r
getSets(pm)[2] <- "year" 
```

The other functions such as getYears,... can be used in a similar manner.

### Subsets

Now that we have had a look into the structure of the object let's extract some subsets out of it. There are different methods that can be used to extract data from a magpie object. Here are some examples:

Return all A2 related data for LAM and the years 2005 and 2015

```r
pm["LAM",c(2005,2015),"A2"]
#> An object of class "magpie"
#> , , scenario = A2
#> 
#>      year
#> i      y2005  y2015
#>   LAM 558.29 646.02
```

Return data for regions which have "AS" in its name (pmatch allows for partial matching of the given search string)

```r
pm["AS",,,pmatch=TRUE]
#> An object of class "magpie"
#> , , scenario = A2
#> 
#>      year
#> i         y1995   y2005   y2015   y2025   y2035   y2045   y2055   y2065
#>   PAS  383.2277  534.73  604.94  668.49  723.13  767.30  798.68  819.21
#>   SAS 1269.9243 1505.02 1796.76 2095.48 2369.60 2600.68 2783.75 2920.70
#>      year
#> i       y2075   y2085   y2095   y2105   y2115   y2125   y2135   y2145
#>   PAS  834.31  844.38  843.52  839.53  839.53  839.53  839.53  839.53
#>   SAS 3006.60 3040.10 3007.86 2972.39 2972.39 2972.39 2972.39 2972.39
#> 
#> , , scenario = B1
#> 
#>      year
#> i         y1995   y2005   y2015   y2025   y2035   y2045   y2055   y2065
#>   PAS  383.2277  530.67  590.42  639.68  674.98  692.45  689.79  668.98
#>   SAS 1269.9243 1475.64 1687.80 1870.96 1999.15 2072.68 2090.96 2049.18
#>      year
#> i       y2075   y2085   y2095   y2105   y2115   y2125   y2135   y2145
#>   PAS  634.64  590.05  536.24  507.06  507.06  507.06  507.06  507.06
#>   SAS 1953.77 1811.83 1629.07 1528.15 1528.15 1528.15 1528.15 1528.15
```

If you want to specifically select from one dimension from which you have the dimension name:

```r
mselect(pm, scenario="B1", i=c("FSU","LAM"))
#> An object of class "magpie"
#> , , scenario = B1
#> 
#>      year
#> i        y1995  y2005  y2015  y2025  y2035  y2045  y2055  y2065  y2075
#>   FSU 276.3431 296.84 305.26 309.78 311.47 309.03 301.99 292.46 281.39
#>   LAM 451.9981 552.79 623.20 681.60 723.44 747.70 753.98 743.05 718.79
#>      year
#> i      y2085  y2095  y2105  y2115  y2125  y2135  y2145
#>   FSU 269.77 257.52 251.04 251.04 251.04 251.04 251.04
#>   LAM 683.68 637.69 611.88 611.88 611.88 611.88 611.88
```

### Data transformations / calculations

Now we can perform some calculations with it.

take a subset of the data as an example

```r
d <- head(pm)
```

create a new object with some fancy calculations

```r
d2 <- d^2+12*d+99/exp(d)
getNames(d2) <- c("NEWSCEN1","NEWSCEN2")
getSets(d2)[3] <- "newscen"
d2
#> An object of class "magpie"
#> , , newscen = NEWSCEN1
#> 
#>      year
#> i         y1995     y2005     y2015   y2025     y2035     y2045
#>   RRR  312072.1  493386.0  801311.2 1277113 1946909.7 2774620.4
#>   CPA 1655393.6 2060710.5 2323942.2 2553856 2712408.1 2815446.4
#>   EUR  314055.2  346131.5  359676.1  373615  385083.6  390551.5
#> 
#> , , newscen = NEWSCEN2
#> 
#>      year
#> i         y1995     y2005     y2015     y2025     y2035     y2045
#>   RRR  312072.1  529729.6  879883.0 1264081.9 1621333.2 1929951.8
#>   CPA 1655393.6 2059935.3 2267216.9 2362701.9 2324765.5 2159923.5
#>   EUR  314055.2  351862.1  371612.7  384339.2  391189.2  388242.5
```

multiply both data sets with each other

```r
d <- d*d2
d
#> An object of class "magpie"
#> , , scenario.newscen = A2.NEWSCEN1
#> 
#>      year
#> i          y1995      y2005      y2015      y2025      y2035      y2045
#>   RRR  172471773  343613717  712509904 1435615002 2704899949 4605120609
#>   CPA 2119955061 2945847491 3528813140 4065967778 4450926008 4707257368
#>   EUR  174124277  201573119  213561266  226137981  236664659  241739628
#> 
#> , , scenario.newscen = B1.NEWSCEN1
#> 
#>      year
#> i          y1995      y2005      y2015      y2025      y2035      y2045
#>   RRR  172471773  356150641  746854091 1428233254 2467376967 3837965851
#>   CPA 2119955061 2945291059 3485309011 3910259280 4119415564 4120912807
#>   EUR  174124277  203251869  217111267  229392153  238551555  241017118
#> 
#> , , scenario.newscen = A2.NEWSCEN2
#> 
#>      year
#> i          y1995      y2005      y2015      y2025      y2035      y2045
#>   RRR  172471773  368924875  782374360 1420967030 2252566752 3203198781
#>   CPA 2119955061 2944739364 3442678113 3761633954 3814823856 3611262304
#>   EUR  174124277  204910425  220648786  232628981  240417069  240310466
#> 
#> , , scenario.newscen = B1.NEWSCEN2
#> 
#>      year
#> i          y1995      y2005      y2015      y2025      y2035      y2045
#>   RRR  172471773  382385289  820086132 1413660600 2054764104 2669586440
#>   CPA 2119955061 2944183141 3400235879 3617580090 3530691083 3161436886
#>   EUR  174124277  206616969  224316602  235976560  242333882  239592227
```
Because we changed the names of the elements in the data dimension it is assumed that they reflect different dimensions. Therefor the object is blown up in size instead of just having the elements multiplied pairwise with each other as it happens when two objects with identical dimensionality are multiplied with each other:


```r
d2*d2
#> An object of class "magpie"
#> , , newscen = NEWSCEN1
#> 
#>      year
#> i            y1995        y2005        y2015        y2025        y2035
#>   RRR 9.738901e+10 2.434297e+11 6.420997e+11 1.631017e+12 3.790457e+12
#>   CPA 2.740328e+12 4.246528e+12 5.400707e+12 6.522178e+12 7.357158e+12
#>   EUR 9.863068e+10 1.198070e+11 1.293669e+11 1.395882e+11 1.482893e+11
#>      year
#> i            y2045
#>   RRR 7.698518e+12
#>   CPA 7.926739e+12
#>   EUR 1.525304e+11
#> 
#> , , newscen = NEWSCEN2
#> 
#>      year
#> i            y1995        y2005        y2015        y2025        y2035
#>   RRR 9.738901e+10 2.806134e+11 7.741941e+11 1.597903e+12 2.628721e+12
#>   CPA 2.740328e+12 4.243333e+12 5.140273e+12 5.582360e+12 5.404535e+12
#>   EUR 9.863068e+10 1.238070e+11 1.380960e+11 1.477166e+11 1.530290e+11
#>      year
#> i            y2045
#>   RRR 3.724714e+12
#>   CPA 4.665269e+12
#>   EUR 1.507323e+11
```

sum over the data dimension

```r
dimSums(d,dim=3)
#> An object of class "magpie"
#> , , 1
#> 
#>      year
#> i          y1995       y2005       y2015       y2025       y2035
#>   RRR  689887091  1451074522  3061824487  5698475887  9479607771
#>   CPA 8479820244 11780061055 13857036143 15355441102 15915856510
#>   EUR  696497109   816352383   875637922   924135674   957967165
#>      year
#> i           y2045
#>   RRR 14315871681
#>   CPA 15600869364
#>   EUR   962659440
```
..over the second data dimension only

```r
dimSums(d,dim=3.2)
#> An object of class "magpie"
#> , , scenario = A2
#> 
#>      year
#> i          y1995      y2005      y2015      y2025      y2035      y2045
#>   RRR  344943546  712538592 1494884264 2856582032 4957466700 7808319390
#>   CPA 4239910122 5890586855 6971491254 7827601732 8265749863 8318519671
#>   EUR  348248554  406483544  434210052  458766961  477081728  482050095
#> 
#> , , scenario = B1
#> 
#>      year
#> i          y1995      y2005      y2015      y2025      y2035      y2045
#>   RRR  344943546  738535930 1566940224 2841893854 4522141071 6507552291
#>   CPA 4239910122 5889474200 6885544890 7527839370 7650106647 7282349693
#>   EUR  348248554  409868839  441427869  465368713  480885436  480609345
```
..or alternatively addressed by name

```r
dimSums(d,dim="newscen")
#> An object of class "magpie"
#> , , scenario = A2
#> 
#>      year
#> i          y1995      y2005      y2015      y2025      y2035      y2045
#>   RRR  344943546  712538592 1494884264 2856582032 4957466700 7808319390
#>   CPA 4239910122 5890586855 6971491254 7827601732 8265749863 8318519671
#>   EUR  348248554  406483544  434210052  458766961  477081728  482050095
#> 
#> , , scenario = B1
#> 
#>      year
#> i          y1995      y2005      y2015      y2025      y2035      y2045
#>   RRR  344943546  738535930 1566940224 2841893854 4522141071 6507552291
#>   CPA 4239910122 5889474200 6885544890 7527839370 7650106647 7282349693
#>   EUR  348248554  409868839  441427869  465368713  480885436  480609345
```
sum over regions and first data dimension

```r
dimSums(d,dim=c(1,3.1))
#> An object of class "magpie"
#> , , newscen = NEWSCEN1
#> 
#>       year
#> region      y1995      y2005      y2015       y2025       y2035
#>    GLO 4933102222 6995727898 8904158681 11295605448 14217834702
#>       year
#> region       y2045
#>    GLO 17754013380
#> 
#> , , newscen = NEWSCEN2
#> 
#>       year
#> region      y1995      y2005      y2015       y2025       y2035
#>    GLO 4933102222 7051760063 8890339872 10682447215 12135596744
#>       year
#> region       y2045
#>    GLO 13125387105
```

apply a lowpass filter on the data

```r
lowpass(d)
#> An object of class "magpie"
#> , , scenario.newscen = A2.NEWSCEN1
#> 
#>      year
#> i          y1995      y2005      y2015      y2025      y2035      y2045
#>   RRR  215257259  393052278  801062132 1572159964 2862633877 4130065444
#>   CPA 2326428169 2885115796 3517360387 4027918676 4418769290 4643174528
#>   EUR  180986488  197707946  213708408  225625472  235301732  240470886
#> 
#> , , scenario.newscen = B1.NEWSCEN1
#> 
#>      year
#> i          y1995      y2005      y2015      y2025      y2035      y2045
#>   RRR  218391490  407906787  819523019 1517674392 2550238260 3495318630
#>   CPA 2326289061 2873961548 3456542090 3856310784 4067500804 4120538496
#>   EUR  181406175  199434821  216716639  228611782  236878095  240400727
#> 
#> , , scenario.newscen = A2.NEWSCEN2
#> 
#>      year
#> i          y1995      y2005      y2015      y2025      y2035      y2045
#>   RRR  221585048  423173971  838660156 1469218793 2282324829 2965540774
#>   CPA 2326151137 2863027975 3397932386 3695192469 3750635992 3662152692
#>   EUR  181820814  201148478  219709244  231580954  238443396  240337117
#> 
#> , , scenario.newscen = B1.NEWSCEN2
#> 
#>      year
#> i          y1995      y2005      y2015      y2025      y2035      y2045
#>   RRR  224950152  439332121  859054538 1425542859 2048193812 2515880856
#>   CPA 2326012081 2852139305 3340558747 3541521785 3460099785 3253750435
#>   EUR  182247450  202918704  222806683  234650901  240059138  240277641
```

do a linear interpolation of the data over time (yearly)

```r
time_interpolate(d,2005:2030)
#> An object of class "magpie"
#> , , NA = A2.NEWSCEN1
#> 
#>      NA
#> fake       y2005      y2006      y2007      y2008      y2009      y2010
#>   RRR  343613717  380503336  417392955  454282573  491172192  528061811
#>   CPA 2945847491 3004144056 3062440621 3120737186 3179033751 3237330316
#>   EUR  201573119  202771934  203970749  205169563  206368378  207567193
#>      NA
#> fake       y2011      y2012      y2013      y2014      y2015      y2016
#>   RRR  564951429  601841048  638730667  675620285  712509904  784820414
#>   CPA 3295626881 3353923446 3412220011 3470516576 3528813140 3582528604
#>   EUR  208766008  209964822  211163637  212362452  213561266  214818938
#>      NA
#> fake       y2017      y2018      y2019      y2020      y2021      y2022
#>   RRR  857130924  929441434 1001751943 1074062453 1146372963 1218683473
#>   CPA 3636244068 3689959532 3743674995 3797390459 3851105923 3904821386
#>   EUR  216076609  217334281  218591952  219849624  221107295  222364966
#>      NA
#> fake       y2023      y2024      y2025      y2026      y2027      y2028
#>   RRR 1290993983 1363304493 1435615002 1562543497 1689471992 1816400486
#>   CPA 3958536850 4012252314 4065967778 4104463601 4142959424 4181455247
#>   EUR  223622638  224880309  226137981  227190648  228243316  229295984
#>      NA
#> fake       y2029      y2030
#>   RRR 1943328981 2070257476
#>   CPA 4219951070 4258446893
#>   EUR  230348652  231401320
#> 
#> , , NA = B1.NEWSCEN1
#> 
#>      NA
#> fake       y2005      y2006      y2007      y2008      y2009      y2010
#>   RRR  356150641  395220986  434291331  473361676  512432021  551502366
#>   CPA 2945291059 2999292855 3053294650 3107296445 3161298240 3215300035
#>   EUR  203251869  204637809  206023749  207409689  208795629  210181568
#>      NA
#> fake       y2011      y2012      y2013      y2014      y2015      y2016
#>   RRR  590572711  629643056  668713401  707783746  746854091  814992008
#>   CPA 3269301830 3323303626 3377305421 3431307216 3485309011 3527804038
#>   EUR  211567508  212953448  214339388  215725328  217111267  218339356
#>      NA
#> fake       y2017      y2018      y2019      y2020      y2021      y2022
#>   RRR  883129924  951267840 1019405756 1087543673 1155681589 1223819505
#>   CPA 3570299065 3612794092 3655289119 3697784146 3740279173 3782774199
#>   EUR  219567445  220795533  222023622  223251710  224479799  225707887
#>      NA
#> fake       y2023      y2024      y2025      y2026      y2027      y2028
#>   RRR 1291957422 1360095338 1428233254 1532147626 1636061997 1739976368
#>   CPA 3825269226 3867764253 3910259280 3931174909 3952090537 3973006165
#>   EUR  226935976  228164064  229392153  230308093  231224033  232139974
#>      NA
#> fake       y2029      y2030
#>   RRR 1843890739 1947805111
#>   CPA 3993921794 4014837422
#>   EUR  233055914  233971854
#> 
#> , , NA = A2.NEWSCEN2
#> 
#>      NA
#> fake       y2005      y2006      y2007      y2008      y2009      y2010
#>   RRR  368924875  410269823  451614772  492959720  534304669  575649617
#>   CPA 2944739364 2994533238 3044327113 3094120988 3143914863 3193708738
#>   EUR  204910425  206484261  208058097  209631933  211205769  212779605
#>      NA
#> fake       y2011      y2012      y2013      y2014      y2015      y2016
#>   RRR  616994566  658339514  699684463  741029411  782374360  846233627
#>   CPA 3243502613 3293296488 3343090363 3392884238 3442678113 3474573697
#>   EUR  214353441  215927278  217501114  219074950  220648786  221846805
#>      NA
#> fake       y2017      y2018      y2019      y2020      y2021      y2022
#>   RRR  910092894  973952161 1037811428 1101670695 1165529962 1229389229
#>   CPA 3506469281 3538364865 3570260450 3602156034 3634051618 3665947202
#>   EUR  223044825  224242844  225440864  226638883  227836903  229034922
#>      NA
#> fake       y2023      y2024      y2025      y2026      y2027      y2028
#>   RRR 1293248496 1357107763 1420967030 1504127002 1587286974 1670446946
#>   CPA 3697842786 3729738370 3761633954 3766952945 3772271935 3777590925
#>   EUR  230232942  231430961  232628981  233407789  234186598  234965407
#>      NA
#> fake       y2029      y2030
#>   RRR 1753606919 1836766891
#>   CPA 3782909915 3788228905
#>   EUR  235744216  236523025
#> 
#> , , NA = B1.NEWSCEN2
#> 
#>      NA
#> fake       y2005      y2006      y2007      y2008      y2009      y2010
#>   RRR  382385289  426155374  469925458  513695542  557465627  601235711
#>   CPA 2944183141 2989788415 3035393688 3080998962 3126604236 3172209510
#>   EUR  206616969  208386932  210156896  211926859  213696822  215466785
#>      NA
#> fake       y2011      y2012      y2013      y2014      y2015      y2016
#>   RRR  645005795  688775879  732545964  776316048  820086132  879443579
#>   CPA 3217814784 3263420057 3309025331 3354630605 3400235879 3421970300
#>   EUR  217236749  219006712  220776675  222546639  224316602  225482598
#>      NA
#> fake       y2017      y2018      y2019      y2020      y2021      y2022
#>   RRR  938801026  998158473 1057515919 1116873366 1176230813 1235588260
#>   CPA 3443704721 3465439142 3487173563 3508907984 3530642406 3552376827
#>   EUR  226648593  227814589  228980585  230146581  231312577  232478572
#>      NA
#> fake       y2023      y2024      y2025      y2026      y2027      y2028
#>   RRR 1294945706 1354303153 1413660600 1477770950 1541881301 1605991651
#>   CPA 3574111248 3595845669 3617580090 3608891189 3600202289 3591513388
#>   EUR  233644568  234810564  235976560  236612292  237248024  237883756
#>      NA
#> fake       y2029      y2030
#>   RRR 1670102001 1734212352
#>   CPA 3582824487 3574135586
#>   EUR  238519489  239155221
```

split the data, do some calculations and bind it back together

```r
d1 <- d[,1:3,]*100
d2 <- d[,4:6,]*(-1)
dd <- mbind(d1,d2)
dd
#> An object of class "magpie"
#> , , scenario.newscen = A2.NEWSCEN1
#> 
#>      year
#> i            y1995        y2005        y2015       y2025       y2035
#>   RRR  17247177286  34361371712  71250990410 -1435615002 -2704899949
#>   CPA 211995506103 294584749142 352881314048 -4065967778 -4450926008
#>   EUR  17412427723  20157311917  21356126643  -226137981  -236664659
#>      year
#> i           y2045
#>   RRR -4605120609
#>   CPA -4707257368
#>   EUR  -241739628
#> 
#> , , scenario.newscen = B1.NEWSCEN1
#> 
#>      year
#> i            y1995        y2005        y2015       y2025       y2035
#>   RRR  17247177286  35615064104  74685409122 -1428233254 -2467376967
#>   CPA 211995506103 294529105935 348530901109 -3910259280 -4119415564
#>   EUR  17412427723  20325186949  21711126748  -229392153  -238551555
#>      year
#> i           y2045
#>   RRR -3837965851
#>   CPA -4120912807
#>   EUR  -241017118
#> 
#> , , scenario.newscen = A2.NEWSCEN2
#> 
#>      year
#> i            y1995        y2005        y2015       y2025       y2035
#>   RRR  17247177286  36892487484  78237435983 -1420967030 -2252566752
#>   CPA 211995506103 294473936352 344267811303 -3761633954 -3814823856
#>   EUR  17412427723  20491042497  22064878583  -232628981  -240417069
#>      year
#> i           y2045
#>   RRR -3203198781
#>   CPA -3611262304
#>   EUR  -240310466
#> 
#> , , scenario.newscen = B1.NEWSCEN2
#> 
#>      year
#> i            y1995        y2005        y2015       y2025       y2035
#>   RRR  17247177286  38238528941  82008613234 -1413660600 -2054764104
#>   CPA 211995506103 294418314075 340023587875 -3617580090 -3530691083
#>   EUR  17412427723  20661696919  22431660178  -235976560  -242333882
#>      year
#> i           y2045
#>   RRR -2669586440
#>   CPA -3161436886
#>   EUR  -239592227
```

set all values greater than 0.5 to 0.51

```r
d[d > 0.5] <- 0.51
d
#> An object of class "magpie"
#> , , scenario.newscen = A2.NEWSCEN1
#> 
#>      year
#> i     y1995 y2005 y2015 y2025 y2035 y2045
#>   RRR  0.51  0.51  0.51  0.51  0.51  0.51
#>   CPA  0.51  0.51  0.51  0.51  0.51  0.51
#>   EUR  0.51  0.51  0.51  0.51  0.51  0.51
#> 
#> , , scenario.newscen = B1.NEWSCEN1
#> 
#>      year
#> i     y1995 y2005 y2015 y2025 y2035 y2045
#>   RRR  0.51  0.51  0.51  0.51  0.51  0.51
#>   CPA  0.51  0.51  0.51  0.51  0.51  0.51
#>   EUR  0.51  0.51  0.51  0.51  0.51  0.51
#> 
#> , , scenario.newscen = A2.NEWSCEN2
#> 
#>      year
#> i     y1995 y2005 y2015 y2025 y2035 y2045
#>   RRR  0.51  0.51  0.51  0.51  0.51  0.51
#>   CPA  0.51  0.51  0.51  0.51  0.51  0.51
#>   EUR  0.51  0.51  0.51  0.51  0.51  0.51
#> 
#> , , scenario.newscen = B1.NEWSCEN2
#> 
#>      year
#> i     y1995 y2005 y2015 y2025 y2035 y2045
#>   RRR  0.51  0.51  0.51  0.51  0.51  0.51
#>   CPA  0.51  0.51  0.51  0.51  0.51  0.51
#>   EUR  0.51  0.51  0.51  0.51  0.51  0.51
```

round the data

```r
round(d,0)
#> An object of class "magpie"
#> , , scenario.newscen = A2.NEWSCEN1
#> 
#>      year
#> i     y1995 y2005 y2015 y2025 y2035 y2045
#>   RRR     1     1     1     1     1     1
#>   CPA     1     1     1     1     1     1
#>   EUR     1     1     1     1     1     1
#> 
#> , , scenario.newscen = B1.NEWSCEN1
#> 
#>      year
#> i     y1995 y2005 y2015 y2025 y2035 y2045
#>   RRR     1     1     1     1     1     1
#>   CPA     1     1     1     1     1     1
#>   EUR     1     1     1     1     1     1
#> 
#> , , scenario.newscen = A2.NEWSCEN2
#> 
#>      year
#> i     y1995 y2005 y2015 y2025 y2035 y2045
#>   RRR     1     1     1     1     1     1
#>   CPA     1     1     1     1     1     1
#>   EUR     1     1     1     1     1     1
#> 
#> , , scenario.newscen = B1.NEWSCEN2
#> 
#>      year
#> i     y1995 y2005 y2015 y2025 y2035 y2045
#>   RRR     1     1     1     1     1     1
#>   CPA     1     1     1     1     1     1
#>   EUR     1     1     1     1     1     1
```




