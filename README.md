# Sechzig Compute Module

Sechzig is a work-in-progress compute module specification.

Sechzig modules have a 60-pin 2.54mm card edge connector.

This repo contains detailed specifications as well as relevant KiCad symbols and footprints.

## Specifications

## Signals

This section describes the signals and their directions from the perspective of the module.

| Signal | Voltage | Dir | Description |
| ------ | ------- | --- | ----------- |
| PWR5V0 | 5.0V | I | System power (2A max) |
| PWR3V3 | 3.3V | I | System power (1A max) |
| SYS\_PG | 3.3V | I | System power good |
| SYS\_RST\_N | 3.3V | I | System reset (active low) |
| SYS\_CLK48 | 3.3V | I | System clock (48MHz) |
| USBD\_Dx | 3.3V | IO | USB device interface |
| USBHx\_Dx | 3.3V | IO | USB host interfaces |
| AUD\_DAT | 3.3V | O | Audio data |
| AUD\_BCK | 3.3V | O | Audio clock |
| AUD\_WS | 3.3V | O | Audio word select |
| ETH\_TXx | 3.3V | O | Ethernet RMII PHY transmit data |
| ETH\_RXx | 3.3V | I | Ethernet RMII PHY receive data |
| ETH\_TXEN | 3.3V | O | Ethernet RMII PHY transmit enable |
| ETH\_CRS\_DV | 3.3V | I | Ethernet RMII PHY carrier sense / receive data valid |
| ETH\_TXEN | 3.3V | O | Ethernet RMII PHY transmit enable |
| ETH\_RST\_N | 3.3V | O | Ethernet RMII PHY reset (active low) |
| ETH\_CLK50 | 3.3V | I | Ethernet/video clock (50MHz) |
| DDMI\_xx\_x | 3.3V | O | [DDMI](https://github.com/machdyne/ddmi) interface |
| I2C\_CLK | 3.3V | IO | I2C clock |
| I2C\_DAT | 3.3V | IO | I2C data |
| SD\_CD\_N | 3.3V | I | SD card detect (active low) |
| SD\_SS | 3.3V | IO | SD slave select / DAT3 |
| SD\_SCK | 3.3V | O | SD clock |
| SD\_MISO | 3.3V | IO | SD data output / DAT0 |
| SD\_MOSI | 3.3V | IO | SD data input / CMD |
| SD\_D1 | 3.3V | IO | SD DAT1 |
| SD\_D2 | 3.3V | IO | SD DAT2 |
| JTAG\_xxx | 3.3V | IO | JTAG interface |
| UART\_TX | 3.3V | O | UART transmit |
| UART\_RX | 3.3V | I | UART receive |
| IOx | 3.3V | IO | GPIO |

### Module Dimensions

Length: 79mm
Height: 50mm max
Depth: 10mm max (5mm from center)
