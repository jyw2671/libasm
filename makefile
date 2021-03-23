# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yjung <yjung@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/23 16:48:15 by yjung             #+#    #+#              #
#    Updated: 2021/03/23 20:41:06 by yjung            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

ASMC = nasm
ASMFLAGS = -fmacho64 -g

AR = ar
ARFLAGS = crs

CC = gcc
CFLAGS = -Wall -Wextra -Werror -g -fsanitize=address

RM = rm
RMFLAGS = -f

SRC_DIR = ./src
OBJ_DIR = ./obj

SRCS = $(wildcard $(SRC_DIR)/*.s)
OBJS = $(addprefix $(OBJ_DIR)/, $(notdir $(SRCS:.s=.o)))

all : $(NAME)

$(OBJ_DIR) :
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.s
	$(ASMC) $(ASMFLAGS) -s $< -o $@

$(NAME) : $(OBJS)
	@$(AR) $(ARFLAGS) $(NAME) $(OBJS)

clean :
	$(RM) $(OBJ)
	rm -rf $(OBJ_DIR)

fclean : clean
	$(RM) $(NAME)

#bonus : $(NAME)

re: fclean all

TEST_INC_DIR = ./test_inc
TEST_SRC_DIR = ./test_src
TEST_OBJ_DIR = ./test_obj

TEST_INC = $(wildcard $(TEST_INC_DIR)/*.h)
TEST_SRCS = $(wildcard $(TEST_SRC_DIR)/*.s)
TEST_OBJS = $(addprefix $(TEST_OBJ_DIR)/, $(notdir $(TEST_SRCS:.c=.o)))

$(TEST_OBJ_DIR) :
	mkdir -p $(TEST_OBJ_DIR)

$(TEST_OBJ_DIR)/%.o : $(TEST_SRC_DIR)/%.c
	$(CC) $(CFLAGS)  -I $(TEST_INC) -c $< -o $@ -L./ -lasm

test : $(NAME) $(TEST_OBJS)
	@$(CC) $(CFLAGS) $(TEST_OBJS) -o $(NAME) $(OBJS_B)

test_clean : clean
	$(RM) $(RMFLAGS) $(TEST_OBJ_DIR)

test_fclean : fclean test_clean

.PHONY: all clean fclean re