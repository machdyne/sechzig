# Sechzig Compute Module

Sechzig is a work-in-progress compute module specification.

Sechzig modules have a 60-pin 2.54mm card edge connector.

This repo contains detailed specifications as well as relevant KiCad symbols and footprints.

## Specifications

### Signals

This section describes the signals and their directions from the perspective of the module.

| Signal | Voltage | Dir | Description |
| ------ | ------- | --- | ----------- |
| PWR5V0 | 5.0V | I | System power (2A max) |
| PWR3V3 | 3.3V | I | System power (1A max) |
| PWRIO | 2.5V - 3.3V | O | I/O power (1A max) |
| SYS\_PG | 3.3V | I | System power good |
| SYS\_RST\_N | PWRIO | I | System reset (active low) |
| SYS\_CLK48 | PWRIO | I | System clock (48MHz) |
| USBD\_Dx | 3.3V | IO | USB device interface |
| USBHx\_Dx | 3.3V | IO | USB host interfaces |
| AUD\_DAT | PWRIO | O | Audio data |
| AUD\_BCK | PWRIO | O | Audio clock |
| AUD\_WS | PWRIO | O | Audio word select |
| ETH\_TXx | PWRIO | O | Ethernet RMII PHY transmit data |
| ETH\_RXx | PWRIO | I | Ethernet RMII PHY receive data |
| ETH\_TXEN | PWRIO | O | Ethernet RMII PHY transmit enable |
| ETH\_CRS\_DV | PWRIO | I | Ethernet RMII PHY carrier sense / receive data valid |
| ETH\_RST\_N | PWRIO | O | Ethernet RMII PHY reset (active low) |
| ETH\_CLK50 | PWRIO | I | Ethernet/video clock (50MHz) |
| DDMI\_xx\_x | 3.3V | O | [DDMI](https://github.com/machdyne/ddmi) interface |
| Xx | PWRIO | IO | 2-wire Module <-> Host link | 
| SD\_CD\_N | 3.3V | I | SD card detect (active low) |
| SD\_SS | 3.3V | IO | SD slave select / DAT3 |
| SD\_SCK | 3.3V | O | SD clock |
| SD\_MISO | 3.3V | IO | SD data output / DAT0 |
| SD\_MOSI | 3.3V | IO | SD data input / CMD |
| SD\_D1 | 3.3V| IO | SD DAT1 |
| SD\_D2 | 3.3V | IO | SD DAT2 |
| JTAG\_xxx | PWRIO | IO | JTAG interface |
| UART\_TX | PWRIO | O | UART transmit |
| UART\_RX | PWRIO | I | UART receive |
| IOx | 3.3V | IO | GPIO |

### Power

Sechzig modules can operate with 2.5V or 3.3V I/O (some signals must be 3.3V on all modules). Modules that use 3.3V I/O can simply connect PWRIO to PWR3V3. Modules that use 2.5V I/O must provide 2.5V on PWRIO.

### Module Dimensions

Width: 79mm
Height: 50mm max
Depth: 8mm max (4mm from center)
Card Edge Depth: 1.4mm - 1.6mm
