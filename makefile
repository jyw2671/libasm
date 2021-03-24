# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yjung <yjung@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/23 16:48:15 by yjung             #+#    #+#              #
#    Updated: 2021/03/24 22:33:43 by yjung            ###   ########.fr        #
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

vpath %.s $(SRC_DIR)

all : $(NAME)

$(OBJ_DIR) :
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o : %.s | $(OBJ_DIR)
	@$(ASMC) $(ASMFLAGS) $< -o $@

$(NAME) : $(OBJS)
	@$(AR) $(ARFLAGS) $(NAME) $(OBJS)

clean :
	$(RM) $(OBJS)
	rm -rf $(OBJ_DIR)

fclean : clean
	$(RM) $(NAME)
	@rm a.out

#bonus : $(NAME)

re: fclean all

TEST_INC_DIR = ./test_inc
TEST_SRC_DIR = ./test_src
TEST_OBJ_DIR = ./test_obj

TEST_INC = $(wildcard $(TEST_INC_DIR)/*.h)
TEST_SRCS = $(wildcard $(TEST_SRC_DIR)/*.c)

vpath %.c ${TEST_SRC_DIR}


test : $(NAME) $(TEST_OBJS)
	$(CC) $(CFLAGS) $(NAME) -I $(TEST_INC_DIR) -o a.out $(TEST_SRCS)
	@./a.out

test_clean : fclean
	$(RM) $(RMFLAGS) $(TEST_OBJ_DIR)
	@rm a.out

.PHONY: all clean fclean re test test_clean