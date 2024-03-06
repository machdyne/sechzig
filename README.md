# Sechzig Compute Module

Sechzig is a work-in-progress compute module specification.

![Sechzig ML1](https://github.com/machdyne/sechzig/blob/4ddd1e48dee8f0d31b78590a8419e66eab25ad2f/ml1.png)

Sechzig modules have a 60-pin 2.54mm card edge connector.

This repo contains detailed specifications as well as relevant KiCad symbols and footprints.

## Specifications

### Signals

This section describes the signals from the perspective of the module when paired with [Mozart](https://machdyne.com/product/mozart-motherboard).

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
| Xx | PWRIO | IO | Module <-> Host link (e.g. LiteX SPIBone) | 
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
| DSx\_x | 2.5V | IO | Experimental high-speed link |

#### Signal Notes

  * While all Sechzig modules should be compatible with [Mozart](https://github.com/machdyne/mozart), it is possible to develop alternative host boards that use some signals for other purposes (see [Vivaldi](https://github.com/machdyne/vivaldi) and [Chopin](https://github.com/machdyne/chopin)).

  * The DSx signal traces are routed as length-matched 100 ohm differential pairs. Functionality may differ between modules.

### Power

Sechzig modules can operate with 2.5V or 3.3V I/O (note that some signals must be 2.5V and 3.3V on all modules). Modules that use 3.3V I/O can simply connect PWRIO to PWR3V3. Modules that use 2.5V I/O must provide 2.5V on PWRIO.

### Module Dimensions

| Dimension | Value |
| --------- | ----- |
| Width | 79mm |
| Height | 50mm max |
| Depth | 8mm max (4mm from center) |
| Card Edge Depth | 1.4mm - 1.6mm |

### Board Revisions

The version number can be found on the back of the module.

#### ML1

| Revision | Notes |
| -------- | ----- |
| ML1.1 | Initial production version; **Xx signals are not connected** |
| ML1.2 | Work-in-progress |

#### ML2

| Revision | Notes |
| -------- | ----- |
| ML2.0 | Initial production version |

#### MX1

| Revision | Notes |
| -------- | ----- |
| MX1.1 | Initial production version |

## License

The contents of this repo are released under the [Lone Dynamics Open License](LICENSE.md) with the following exceptions:

- The KiCad design files may contain symbols and footprints released under other licenses; please contact us if we've failed to give proper attribution.

Note: You can use these designs for commercial purposes but we ask that instead of producing exact clones, that you either replace our trademarks and logos with your own or add your own next to ours.
