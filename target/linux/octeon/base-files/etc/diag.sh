#!/bin/sh
# Copyright (C) 2009-2013 OpenWrt.org

. /lib/functions/leds.sh

get_status_led() {
	local board=$(cat /tmp/sysinfo/board_name)

	case $board in
	aruba)
		status_led="power-green"
		;;
	wa6x3xn)
		status_led="power"
		;;
	esac

}

set_state() {
	get_status_led

	case "$1" in
	preinit)
		status_led_blink_preinit
		;;
	failsafe)
		status_led_blink_failsafe
		;;
	preinit_regular)
		status_led_blink_preinit_regular
		;;
	done)
		status_led_on
		;;
	esac
}
