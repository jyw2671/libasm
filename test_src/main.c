/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yjung <yjung@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/23 15:32:33 by yjung             #+#    #+#             */
/*   Updated: 2021/03/25 14:54:44 by yjung            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "test.h"

char	*g_string[10] = {
	"hello world!",
	"string test",
	"abcdefg",
	"42seoul",
	"yjung",
	"seoul42",
	"a b c d e f g",
	"123456789",
	"42NetWork",
	"test program!"
};

void	putstr_slow(char *s)
{
	while (*s)
	{
		usleep(50000);
		write(1, s++, 1);
	}
}

int	main(void)
{
	// system("clear");
	// 역할? -> 
	putstr_slow("🤩 TEST Libasm!!!! 🚀\n");
	ft_strlen_test();
	ft_strcpy_test();
	ft_strcmp_test();
	ft_write_test();
	return (0);
}
