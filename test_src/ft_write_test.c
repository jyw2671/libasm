/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_write_test.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yjung <yjung@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/25 14:52:07 by yjung             #+#    #+#             */
/*   Updated: 2021/03/25 15:27:51 by yjung            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "test.h"

static void	do_test(int fd, char *s)
{
	int	ori[2];
	int	ft[2];
	int	s_len;

	s_len = strlen(s);
	printf("\ntry... ft_write(%d, \"%s\", %d);\n", fd, s, s_len);
	ori[0] = write(fd, s, s_len);
	ori[1] = errno;
	write(1, " , ", 3);
	ft[0] = ft_write(fd, s, s_len);
	ft[1] = errno;
	if ((ori[0] != ft[0]) || (ori[1] != ft[1]))
	{
		printf("\nKO: diff ori: %d (___errno : %d), ft: %d (___errno : %d)\n", \
			ori[0], ori[1], ft[0], ft[1]);
		exit(1);
	}
}

void	ft_write_test(void)
{
	int	i;

	printf("===================================================\n");
	printf("testing ft_write();\n");
	i = 0;
	while (i < 10)
	{
		do_test(i, g_string[i]);
		++i;
	}
	printf("\nSUCCESS!\n");
}
