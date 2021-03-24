/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strcmp_test.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yjung <yjung@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 19:19:30 by yjung             #+#    #+#             */
/*   Updated: 2021/03/24 19:42:01 by yjung            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "test.h"

static void	do_test(char *s1, char *s2)
{
	int	ori;
	int	ft;

	printf("try... ft_strcmp(\"%s\", \"%s\");\n", s1, s2);
	ori = strcmp(s1, s2);
	ft = ft_strcmp(s1, s2);
	printf("	ori: %d, ft: %d\n", ori, ft);
	if ((ori == 0 && ft != 0) || (ori < 0 && ft > 0) || (ori > 0 && ft < 0))
	{
		printf("KO: diff ori: %d, ft: %d\n", ori, ft);
		exit(1);
	}
}

void	ft_strcmp_test(void)
{
	int	i;

	printf("===================================================\n");
	printf("ft_strcmp_test();\n");
	i = 0;
	while (i < 10)
	{
		do_test(g_string[i], g_string[9 - i]);
		do_test(g_string[i], g_string[i]);
		++i;
	}
	do_test("", "");
	do_test("hello", "");
	do_test("", "hello");
	do_test("Hello", "lorem teste");
	printf("SUCCESS!\n");
}
