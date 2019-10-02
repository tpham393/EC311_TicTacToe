This folder contains four files:

clock_divider.v - A clock divider module to convert the 100 MHz clock to a 25Mhz
                  clock used as the pixel clock of the VGA monitor.

VGAController.v - The main logic to generate the horizontal sync (HS) and
                  vertical sync (VS) needed by the VGA monitor. Read the nexys-3
                  manual for more information on these signals. This module also
                  outputs the counters tracking the x and y position of the
                  current pixel being rendered on the screen. See below for more
                  details on these signals.

VGADisplay.v    - A sample top level module using the VGA Controller. The color
                  output on the monitor is a function of the x and y coordinate
                  on the screen.

vga.ucf         - A sample UCF file for the VGADisplay sample top level module.




VGAController Interface:
+-------------+-----------+---------------------------------------+
| Signal Name | Direction | Description                           |
+-------------+-----------+---------------------------------------+
| rst         | input     | Active high reset signal              |
+-------------+-----------+---------------------------------------+
| pixel_clk   | input     | Clock signal for the VGA module       |
+-------------+-----------+---------------------------------------+
| HS          | output    | The horizontal sync signal connected  |
|             |           | to the VGA monitor.                   |
+-------------+-----------+---------------------------------------+
| VS          | output    | The vertical sync signal connected to |
|             |           | the VGA monitor.                      |
+-------------+-----------+---------------------------------------+
| hcounter    | output    | A counter indicating the horizontal   |
|             |           | position of the pixel being rendered  |
|             |           | on the VGA monitor.                   |
+-------------+-----------+---------------------------------------+
| vcounter    | output    | A counter indicating the vertical     |
|             |           | position of the pixel being rendered  |
|             |           | on the VGA monitor.                   |
+-------------+-----------+---------------------------------------+
| blank       | output    | An active high output indicating      |
|             |           | the pixel being rendered is outside   |
|             |           | the visible are on the monitor        |
|             |           | (front porch or back porch)           |
+-------------+-----------+---------------------------------------+


Notes:

- The VGA output on the nexys-3 board uses 8 bit color. 3 red bits, 3 green bits,
  2 blue bits.

- The hcounter and vcounter can be used to determine what color should be output
  on the R,G and B outputs in the VGADisplay module. But beware that not every
  pixel will be visible on the monitor. The VGA protocol uses a front porch and
  back porch. Both the horizontal and vertical directions have porches. The
  horizontal porches are sections at the beginning and end of each line that are
  not visible. The vertical porches are several lines at the beginning and end
  of each frame that are not visible. See the VGA timing specifications in the
  nexys-3 manual (or search google for more info) to determine the size of each
  porch.

