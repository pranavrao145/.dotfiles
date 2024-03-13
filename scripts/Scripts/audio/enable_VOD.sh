#!/usr/bin/env bash

# load music sink
pactl load-module module-null-sink sink_name="Music_Sink" sink_properties=device.description="Music_Sink"
pactl load-module module-loopback latency_msec=1 source=Music_Sink.monitor sink=bluez_sink.30_63_71_82_CF_17.a2dp_sink

# load main sink
pactl load-module module-null-sink sink_name="Main_Sink" sink_properties=device.description="Main_Sink"
pactl load-module module-loopback latency_msec=1 source=Main_Sink.monitor sink=bluez_sink.30_63_71_82_CF_17.a2dp_sink
