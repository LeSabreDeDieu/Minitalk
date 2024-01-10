/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sgabsi <sgabsi@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/21 15:27:03 by sgabsi            #+#    #+#             */
/*   Updated: 2023/12/13 16:20:56 by sgabsi           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <stdarg.h>
# include <unistd.h>
# include <stdint.h>
# include <libft.h>

int	ft_printf(const char *format, ...);
int	ft_printstr(char *str);
int	ft_printnbr(int n);
int	ft_printpourcent(void);
int	ft_print_hex(unsigned int num, const char format);
int	ft_print_ptr(void *ptr);
int	ft_print_unsigned(unsigned int n);

#endif