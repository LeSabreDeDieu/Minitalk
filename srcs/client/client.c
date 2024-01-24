/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sgabsi <sgabsi@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/05 15:23:42 by sgabsi            #+#    #+#             */
/*   Updated: 2024/01/11 15:05:41 by sgabsi           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

int	g_confirm_flag = 0;

void	ft_resp_handler(int signum)
{
	g_confirm_flag = 1;
	(void)signum;
}

void	ft_send_bit(int pid, int bit)
{
	int	signal;

	if (bit == 1)
		signal = SIGUSR1;
	else
		signal = SIGUSR2;
	if (kill(pid, signal) == -1)
	{
		ft_putstr_fd("Erreur : Échec de l'envoi du signal\n", 2);
		exit(EXIT_FAILURE);
	}
	while (!g_confirm_flag)
		;
	g_confirm_flag = 0;
}

void	ft_send_char(int pid, unsigned char c)
{
	int	i;

	i = 7;
	while (i >= 0)
	{
		ft_send_bit(pid, (c >> i) & 1);
		usleep(400);
		i--;
	}
}

void	ft_send_string(int pid, const char *str)
{
	int	i;

	i = -1;
	while (str[++i])
		ft_send_char(pid, str[i]);
	ft_send_char(pid, '\n');
	ft_send_char(pid, '\0');
}

int	main(int argc, char **argv)
{
	int	pid;

	if (argc != 3)
	{
		ft_putstr_fd("\033[1;35mUsage: ./client [PID_SERVER] [MESSAGE]\033[0m\n", 2);
		exit(EXIT_FAILURE);
	}
	pid = ft_atoi(argv[1]);
	if (pid <= 0)
	{
		ft_putstr_fd("PID invalide\n", 2);
		exit(EXIT_FAILURE);
	}
	signal(SIGUSR2, ft_resp_handler);
	ft_send_string(pid, argv[2]);
	return (0);
}
