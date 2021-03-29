/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup_test.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yjung <yjung@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/29 19:24:34 by yjung             #+#    #+#             */
/*   Updated: 2021/03/29 19:25:06 by yjung            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "test.h"

static void	do_test(char *s)
{
	char	*dup_s;

	printf("try... ft_strdup(\"%s\");\n", s);
	dup_s = ft_strdup(s);
	if (strcmp(dup_s, s) != 0)
	{
		printf("KO: diff src: %s, dup: %s\n", s, dup_s);
		free(dup_s);
		exit(1);
	}
	free(dup_s);
}

void	ft_strdup_test(void)
{
	int	i;

	printf("===================================================\n");
	printf("ft_strdup_test();\n");
	i = 0;
	while (i < 10)
		do_test(g_string[i++]);
	printf("SUCCESS!\n");
}
