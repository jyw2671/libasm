/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlen_test.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yjung <yjung@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/23 15:30:24 by yjung             #+#    #+#             */
/*   Updated: 2021/03/24 20:01:27 by yjung            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "test.h"

static void	do_test(char *s)
{
	int	ori;
	int	ft;

	printf("try... ft_strlen(\"%s\");\n", s);
	ori = strlen(s);
	ft = ft_strlen(s);
	if (ori != ft)
	{
		printf("KO: diff ori: %d, ft: %d\n", ori, ft);
		exit(1);
	}
}

void	ft_strlen_test(void)
{
	int		i;

	printf("===================================================\n");
	printf("testing ft_strlen();\n");
	i = 0;
	while (i < 10)
		do_test(g_string[i++]);
	do_test("");
	do_test("123456789012345678901234567890123456789012345678901234567890");
	printf("SUCCESS!\n");
}
