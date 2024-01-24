# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sgabsi <sgabsi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/07 13:44:09 by sgabsi            #+#    #+#              #
#    Updated: 2024/01/15 09:54:44 by sgabsi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#################
##  VARIABLES  ##
#################

# Directories
SRCDIR			=	./srcs
INCDIR			=	./includes
LIBDIR			= 	./libs
OBJDIR			=	objs

# Sources
SRC_SUBDIRS		=	serveur client
SRCS 			=	$(SRCDIR)/serveur/serveur.c $(SRCDIR)/client/client.c

# Objects
OBJ_SUBDIRS	=	$(SRC_SUBDIRS:%=$(OBJDIR)/%)
OBJ			=	$(SRC_FILES:%.c=$(OBJDIR)/%.o)

# Libraries
LIBFT_NAME 		= 	libft.a
LIBFT_DIR		=	$(LIBDIR)/libft
LIBFT 			= 	$(LIBFT_DIR)/$(LIBFT_NAME)

FTPRINTF_NAME 	= 	libftprintf.a
FTPRINTF_DIR 	= 	$(LIBDIR)/ft_printf
FTPRINTF 		= 	$(FTPRINTF_DIR)/$(FTPRINTF_NAME)

# Output
NAME			=	serveur client

# Compiler
CC				=	cc
CFLAGS			=	-Wall -Werror -Wextra -g3 -O3
OPTIONS			=	-I $(INCDIR) -I $(LIBFT_DIR)/$(INCDIR) -I $(FTPRINTF_DIR)/$(INCDIR)
LDFLAGS			=	-L$(LIBDIR) -L $(LIBFT_DIR) -L $(FTPRINTF_DIR) -L $(MLX_DIR) -lft -lftprintf

# Colors
GREEN			=	\033[0;32m
YELLOW			=	\033[0;33m
RED				=	\033[0;31m
NC				=	\033[0m

#################
##  TARGETS    ##
#################

all: pre_comp $(NAME)

pre_comp:
	@echo "$(YELLOW)********* Début de la compilation de Minitalk *********$(NC)"

serveur: $(OBJDIR)/serveur/serveur.o $(LIBFT) $(FTPRINTF)
	@$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@
	@echo "$(GREEN)********* Compilation de $@ terminée avec succès! *********$(NC)"

client: $(OBJDIR)/client/client.o $(LIBFT) $(FTPRINTF)
	@$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@
	@echo "$(GREEN)********* Compilation de $@ terminée avec succès! *********$(NC)"

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) $(OPTIONS) -c $< -o $@

$(LIBFT):
	@make -sC $(LIBFT_DIR)

$(FTPRINTF): $(LIBFT)
	@make -sC $(FTPRINTF_DIR)

norminette:
	@echo "$(YELLOW)********* Exécution de norminette *********$(NC)"
	@norminette | grep -B 1 -e "Error" || echo "Tous les fichiers ont passé le check norminette !"

clean:
	@rm -rf $(OBJDIR)
	@make -sC $(LIBFT_DIR) clean
	@make -sC $(FTPRINTF_DIR) clean
	@echo "$(YELLOW)********* Suppression des fichiers objets *********$(NC)"

fclean: clean
	@rm -f $(NAME)
	@make -sC $(LIBFT_DIR) fclean
	@make -sC $(FTPRINTF_DIR) fclean
	@echo "$(RED)********* Suppression des programmes $(NAME) *********$(NC)"
	
re: fclean all

.PHONY: all clean fclean re serveur client