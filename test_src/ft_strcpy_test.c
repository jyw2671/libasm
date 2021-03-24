/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strcpy_test.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yjung <yjung@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:56:08 by yjung             #+#    #+#             */
/*   Updated: 2021/03/24 20:01:38 by yjung            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "test.h"

static void	do_test(char *dst, char *src)
{
	printf("try... ft_strcpy(dst, \"%s\");\n", src);
	ft_strcpy(dst, src);
	if (strcmp(src, dst) != 0)
	{
		printf("KO: diff src: \"%s\", dst: \"%s\"\n", src, dst);
		exit(1);
	}
}

void	ft_strcpy_test(void)
{
	int		i;
	char	dst[100];

	printf("===================================================\n");
	printf("test ft_strcpy();\n");
	i = 0;
	while (i < 10)
		do_test(&dst[0], g_string[i++]);
	do_test(&dst[0], "");
	do_test(&dst[0], "12345678901234567890123456789012345678901234567890");
	printf("SUCCESS!\n");
}
