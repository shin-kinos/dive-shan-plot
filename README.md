## Description
* This script is used only for https://github.com/shin-kinos/dive-shannon 
* Visualize a result with lolipop plot.

## Dependencies 
### R 

Version `4.1.0` or more. 

```
version.string R version 4.1.0 (2021-05-18)
```

### Tidyverse
* https://www.tidyverse.org/

Version `1.3.1` or more.

```
> packageVersion("tidyverse")
[1] ‘1.3.1’
```

### ggplot2
* https://ggplot2.tidyverse.org/

Version `3.3.5` or more.

```
> packageVersion("ggplot2")
[1] ‘3.3.5’
```

## Input file format
A result file of https://github.com/shin-kinos/dive-shannon

See some demo files in `demo` directory.🤟

## Utility
* `-i` : Input file name, REQUIRED.
* `-o` : Output file name. REQUIRED.
* `-c` : Types of colour gradient.
* `-w` : Size of width (px).
* `-h` : Size of height (px).

[e.g.]

```
% rscript dive-shan-plot.r -i input_file.txt -o result_pic -c 1
```

## Output
A graph in PNG format.

[e.g.]

![result_01](https://user-images.githubusercontent.com/83740080/126022788-dc7cdc20-88b6-4383-93b2-8d4d8debe453.png)

![result_02](https://user-images.githubusercontent.com/83740080/126022849-025b25b7-60f4-4813-8b0b-70dfd95a6eba.png)

