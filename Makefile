LIBFT_PATH      = libraries/libft
LIBFT           = $(LIBFT_PATH)/libft.a

MINILIBX_PATH   = libraries/minilibx
MINILIBX        = $(MINILIBX_PATH)/libmlx.a

SOURCES_DIR     = sources
OBJECTS_DIR     = objects
INCLUDES        = -Iincludes

SOURCES_FILES   = cub3D.c \
                  draw/draw_textures.c draw/math.c\
                  errors/close_game.c \
                  errors/print_error.c \
                  initialize/init.c \
                  gameplay/gameplay.c \
                  gameplay/move_player.c \
                  render/render.c \
                  render/dda_algorithm.c \
                  parser/parse_map_file.c \
                  parser/parse_texture.c \
                  parser/parse_rgb.c \
                  parser/parse_map.c \
                  parser/trim_map.c \
                  parser/trim_map2.c \
                  parser/fill_map.c \
                  parser/parser_utils.c \
                  parser/parser_utils2.c \
                  parser/atoi_no_oflow.c

SOURCES         = $(addprefix $(SOURCES_DIR)/, $(SOURCES_FILES))
OBJECTS         = $(patsubst $(SOURCES_DIR)/%.c,$(OBJECTS_DIR)/%.o,$(SOURCES))
DEPS            = $(OBJECTS:.o=.d)

NAME            = cub3D

CC              = cc
RM              = rm -rf

CFLAGS          = -Wall -Wextra -Werror $(INCLUDES) -MMD -MP # -O0 -g -fsanitize=address
MLXFLAGS        = -L. -lXext -L. -lX11

$(OBJECTS_DIR)/%.o: $(SOURCES_DIR)/%.c
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -c $< -o $@

all: $(NAME)

bonus: $(NAME)

$(NAME): $(LIBFT) $(MINILIBX) $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) $(LIBFT) $(MINILIBX) $(MLXFLAGS) -o $(NAME) -lm

$(LIBFT):
	@$(MAKE) -C $(LIBFT_PATH)

$(MINILIBX):
	@$(MAKE) -C $(MINILIBX_PATH)

clean:
	@$(MAKE) -C $(LIBFT_PATH) clean
	@$(MAKE) -C $(MINILIBX_PATH) clean
	@$(RM) $(OBJECTS)
	@$(RM) $(DEPS)
	@$(RM) $(OBJECTS_DIR)

fclean: clean
	@$(MAKE) -C $(LIBFT_PATH) fclean
	@$(RM) $(NAME)

re: fclean all

valf = $(shell which clear); $(shell which valgrind) --leak-check=full --track-fds=all --track-origins=yes --show-reachable=yes --show-leak-kinds=all -s

mlx:
	curl -O https://cdn.intra.42.fr/document/document/25855/minilibx-linux.tgz
	tar -xzf minilibx-linux.tgz
	rm minilibx-linux.tgz
	rm -rf ./libraries/minilibx
	mv minilibx-linux ./libraries/minilibx

rmlx:
	rm -rf ./libraries/minilibx

norm:
	norminette includes/ sources/ libraries/libft/

val:
	clear; $(valf) ./cub3D $(PATH)

valre: re
	clear; $(valf) ./cub3D $(PATH)

-include $(DEPS)

.PHONY: all clean fclean re
