#!/usr/bin/env bash

# load music sink
pactl load-module module-null-sink sink_name="Music_Sink" sink_properties=device.description="Music_Sink"
pactl load-module module-loopback latency_msec=1 source=Music_Sink.monitor sink=alsa_output.usb-GN_Netcom_A_S_Jabra_EVOLVE_LINK_MS_00059C4E6

# load main sink
pactl load-module module-null-sink sink_name="Main_Sink" sink_properties=device.description="Main_Sink"
pactl load-module module-loopback latency_msec=1 source=Main_Sink.monitor sink=alsa_output.usb-GN_Netcom_A_S_Jabra_EVOLVE_LINK_MS_00059C4E63

