/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cub.h                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: thopgood <thopgood@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/21 18:27:26 by mistery576        #+#    #+#             */
/*   Updated: 2025/03/03 16:10:38 by thopgood         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef CUB_H
# define CUB_H
# include "../libraries/libft/include/libft.h"
# include "../libraries/minilibx/mlx.h"
# include "errors.h"
# include "macro.h"
# include "structs.h"
# include <fcntl.h>
# include <linux/types.h>
# include <X11/X.h>
# include <errno.h>
# include <math.h>
# include <stdbool.h>
# include <stdio.h>
# include <stdlib.h>
# include <string.h>

// * ERRORS *
int		close_game(t_data *data, int exit_code);
int		print_error(char *prefix, char *msg, int code);

// * PARSER *
bool	is_map_valid(t_data *data, int argc, char **argv);
int		parse_rgb(t_data *data, char *line);
int		parse_texture(t_data *data, char *line, t_txt_type type);
int		parse_map(t_data *data, int fd, char *line);
int		trim_map(t_data *data);
int		find_longest_usable_string(char **arr);
char	*trim_chars_from_start(char *str, int num_chars);
int		find_shortest_lead(char **arr);
int		parse_map_chars(t_data *data, t_map *map_d, char **map);
void	set_player_starting_angle(t_data *data, char c);

// * PARSER UTILS *
bool	is_line_only_spaces(char *line);
bool	are_textures_parsed(t_texture *t);
bool	is_file_dir(char *path);
bool	is_ext_valid(char *str, char *ext);
bool	is_first_occurrence(t_data *data, t_txt_type type);
int		ft_atoi_no_oflow(const char *nptr, bool *out_of_range);
int		print_matrix(char **matrix);
bool	isspace_not_nl(char c);
int		last_usable_char_index(char *str);
bool	is_valid_char(char c);

// * INIT *
int		create_window(t_data *data);
void	initialize_data(t_data *data);

// * GAMEPLAY *
void	gameplay(t_data *data);
void	move_player(t_data *data);

// * UTILS *

// * VERIFY_MATRIX *
int		check_up_down(char *line);
int		check_line_limit(char *line);
int		check_line(t_data *data, char *line, int x);

// * RENDER *
float	dda_algorithm(t_data *data, t_ray *ray, int i);
void	put_pixel(int x, int y, int color, t_data *data);
void	clear_image(t_data *data);
int		draw_loop(t_data *data);

// * TEXTURES *
float	fixed_calculate_distance(float x2, float y2, t_data *data);
void	set_speed(t_player *player, float *speed);
void	draw_textures(t_data *data, int i, float ray_x, float ray_y);
int		verify_side(t_data *data, float ray_x, float ray_y);

#endif