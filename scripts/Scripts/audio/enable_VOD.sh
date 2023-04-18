#!/usr/bin/env bash

# load music sink
pactl load-module module-null-sink sink_name="Music_Sink" sink_properties=device.description="Music_Sink"
pactl load-module module-loopback latency_msec=1 source=Music_Sink.monitor sink=alsa_output.pci-0000_00_1f.3.analog-stereo

# load main sink
# pactl load-module module-null-sink sink_name="Main_Sink" sink_properties=device.description="Main_Sink"
# pactl load-module module-loopback latency_msec=1 source=Main_Sink.monitor sink=alsa_output.pci-0000_00_1f.3.analog-stereo
