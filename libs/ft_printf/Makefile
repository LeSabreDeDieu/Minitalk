# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sgabsi <sgabsi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/21 16:28:59 by sgabsi            #+#    #+#              #
#    Updated: 2024/01/10 12:52:42 by sgabsi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#################
##  VARIABLES  ##
#################

# Directories
SRCDIR		=	./srcs
INCDIR		=	./includes
OBJDIR		=	objs

# Sources
SRCS = $(SRCDIR)/ft_printf.c \
       $(SRCDIR)/ft_printf_utils.c \
       $(SRCDIR)/ft_print_hex.c \
       $(SRCDIR)/ft_print_ptr.c \
       $(SRCDIR)/ft_print_unsigned.c

# Objects
OBJS = $(SRCS:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

# Libraries
LIBFT_DIR = ../libft
LIBFT = $(LIBFT_DIR)/libft.a

# Output
NAME		=	libftprintf.a
NAMESO		=	libftprintf.so

# Compiler
CC			=	cc
CFLAGS		=	-Wall -Werror -Wextra
OPTIONS		=	-I $(INCDIR) -I $(LIBFT_DIR)/includes

# Colors
GREEN		=	\033[0;32m
YELLOW		=	\033[0;33m
RED			=	\033[0;31m
NC			=	\033[0m

#################
##  TARGETS    ##
#################

all: pre_comp $(NAME)

pre_comp :
	@echo "$(YELLOW)********* Début de la compilation de la librairie libftprintf *********$(NC)"
	
$(NAME): $(OBJS)
	@cp $(LIBFT_DIR)/libft.a .
	@mv libft.a $(NAME)
	@ar rcs $@ $^
	@echo "$(GREEN)********* Compilation terminée avec succès! *********$(NC)"
	@echo "$(GREEN)********* La librairie $(NAME) a été créée. *********$(NC)"

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) $(OPTIONS) -c $< -o $@

clean:
	@rm -rf $(OBJDIR)

fclean: clean
	@rm -f $(NAME)
	@echo "$(RED)********* Suppression de la librairie $(NAME) *********$(NC)"

re: fclean all

.PHONY: all clean fclean re
