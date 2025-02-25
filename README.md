# 42-cub3d

## Installation

Install minilib library
Linux
https://cdn.intra.42.fr/document/document/25855/minilibx-linux.tgz

Install X11 Library

``` bash
sudo apt update
sudo apt upgrade
sudo apt install xorg
```

Verify installation

```bash
X -version
```

Install X11 Development Packages

```bash
sudo apt install libx11-dev
```

`sudo apt install libx11-dev libxext-dev libxrandr-dev libxrender-dev libxi-dev`

`docker build -t c-project .`

`docker run -it c-project`

Added macro SF (Scale Factor) which multiplies both width and height. Default value is 3.
Compile with:  
`-D ZOOM=n` where `n` is `1`, `2` or `3`. (or `4`?)


Map elements can come in any order and separated by 0+ empty lines.
Element information can be separated by 0+ spaces. // ! CHECK THIS
Type identifier must come first.
`F` floor and `C` ceiling must be RGB colours [0-255, 0-255, 0-255]
NO
SO
EA
WE

Map Errors:

- Bad extension (not .cub)
- File is directory
- File cannot be opened
- Texture is not .xpm
- Invalid RGB colour
- Colour is missing
- Map not at end of cub file
- Bad char (Not `10NSEW`)
- More than one player or no players
- Not surrounded by walls
- Empty line in map
- 
- 

Do we handle spaces in PATH?

change fsm symbol
- instead of flags, can check if data->field already exists/NULL
file descriptor or PATH to texture fields ??
RGB 1,2,300, (extra comma)
 111
10001
10001   <- is this valid (NO YOU CAN CLIP THROUGH CORNERS)
10001
 111

maybe a flag that all textures NSWE and RGB FC are set is a good idea, because then when the map starts parsing we can check.

added my libft (there was an error in maggie's strtrim!!!)
- check file descriptors are being closed

### Parsing Order

#### Map

- Trim trailing chars from beyond last usable (non-space) char.
- Calculate lowest index of first usable char in each string.
  - Trim leading space of each string to that length.
- Calculate highest index of last usable char in each string.
  - Trim trailing space of each string to that length and fill additional indices with `' '` (space) to create rectangular map of usable data.
- Checking algorithm

Need to check before fill for invalid chars in case a sentinel char is entered.
Or use `\xFF` as sentinel

Do we check every floor tile for validity or only the ones that can be reached by a player?
- possible issue, clipping through corner to viable floor tile

like this:
1111
1011
1101
1111

flag linking issue
The external library flags should be after the libraries that are dependent on them. So
gcc -g -Wall -Wextra -Werror -o cub3d obj/main.o ...  deps/Linux/dmy/libdmy.a  deps/Linux/mlx/libmlx.a -L/usr/lib -lXext -lX11 -lm -lz
 Instead of
gcc -g -Wall -Wextra -Werror -L/usr/lib -lXext -lX11 -lm -lz -o cub3d obj/main.o ...  deps/Linux/dmy/libdmy.a  deps/Linux/mlx/libmlx.a

collisions
https://42born2code.slack.com/archives/CMX2R5JSW/p1713782362848349

can use data->active 0, 1, 2 or use safe_free.

collision needs a bit of work