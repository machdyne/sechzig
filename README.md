# Sechzig Compute Module

Sechzig is a work-in-progress compute module specification.

![Sechzig ML1](https://github.com/machdyne/sechzig/blob/4ddd1e48dee8f0d31b78590a8419e66eab25ad2f/ml1.png)

Sechzig modules have a 60-pin 2.54mm card edge connector.

This repo contains detailed specifications as well as relevant KiCad symbols and footprints.

## Specifications

### Signals

This section describes the signals from the perspective of the module when paired with [Mozart](https://github.com/machdyne/mozart).

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
| Xx | PWRIO | IO | Extra link (see notes below) |
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
| DSx\_x | 2.5V | IO | Experimental high-speed link (see notes below) |

#### Signal Notes

  * While all Sechzig modules should be compatible with [Mozart](https://github.com/machdyne/mozart), it is possible to develop alternative host boards that use some signals for other purposes (see [Vivaldi](https://github.com/machdyne/vivaldi) and [Chopin](https://github.com/machdyne/chopin)).

##### Extra Link (Xx) Notes

The purpose of the Xx signals is determined by the host board. For example, on Mozart:

| Signal | Description |
| ------ | ----------- |
| XA | SPI MISO / I2C SCL |
| XB | SPI SCK / I2C SDA |
| XC | SPI MOSI |
| XD | SPI SS |

##### Experimental High-Speed Link (DSx) Notes

The DSx signal traces are routed as length-matched 100 ohm differential pairs. The following minimum required configuration should be supported by all modules, but some modules may have additional capabilities:

| Signal | Standard | Dir | Required | Description |
| ------ | -------- | --- | -------- | ----------- |
| DS0\_x | LVDS25 | IO | N | Transmit and/or Receive |
| DS1\_x | LVDS25 | O | Y | Transmit |
| DS2\_x | LVDS25 | I | Y | Receive |

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

Product page for [Sechzig ML1](https://machdyne.com/product/sechzig-ml1-compute-module/).

| Revision | Stackup | Notes |
| -------- | ------- | ----- |
| ML1.1 | Aisler 4L | Initial production version; **Xx signals are not connected** |
| ML1.2 | Aisler 4L | Current production version; connects Xx signals; adds LED |

#### ML2

Product page for [Sechzig ML2](https://machdyne.com/product/sechzig-ml2-compute-module/).

| Revision | Stackup | Notes |
| -------- | ------- | ----- |
| ML2.0 | Aisler 6L | Initial production version |
| ML2.0B | JLC06161H-3313 | Current production version |

#### MX1

Product page for [Sechzig MX1](https://machdyne.com/product/sechzig-mx1-compute-module/).

| Revision | Stackup | Notes |
| -------- | ------- | ----- |
| MX1.1 | Aisler 4L | Initial production version |

#### MX2

Product page for [Sechzig MX2](https://machdyne.com/product/sechzig-mx2-compute-module/).

| Revision | Stackup | Notes |
| -------- | ------- | ----- |
| MX2.0 | JLC06161H-3313 | Initial production version |

## Funding

This project was partially funded through the NGI0 Entrust Fund, a fund established by NLnet with financial support from the European Commission's Next Generation Internet programme.

## License

This project is released under the [CERN-OHL-P](LICENSE.txt) license.

Note: You can use these designs for commercial purposes but we ask that instead of producing exact clones, that you either replace our trademarks and logos with your own or add your own next to ours.
