/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.h                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yjung <yjung@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/23 15:31:24 by yjung             #+#    #+#             */
/*   Updated: 2021/03/24 19:19:49 by yjung            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef TEST_H
# define TEST_H

# include <stdio.h>
# include <stdlib.h>
# include <unistd.h>
# include <fcntl.h>
# include <string.h>
# include <errno.h>

extern char	*g_string[10];

char	*ft_strcpy(char *dst, const char *src);
void	ft_strcpy_test(void);

size_t	ft_strlen(const char *s);
void	ft_strlen_test(void);

int		ft_strcmp(const char *s1, const char *s2);
void	ft_strcmp_test(void);

// ssize_t	ft_write(int fd, const char *buf, size_t count);
// void	ft_write_test(void);

// ssize_t	ft_read(int fd, const char *buf, size_t count);
// void	ft_read_test(void);

// char	*ft_strdup(const char *s1);
// void	ft_strdup_test(void);

#endif