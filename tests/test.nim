import unittest

import vt100

vt100Style red 31

vt100Styles:
  bold 1
  cyan 36


test "single style":
  check "\e[31mpass\e[0m" == "pass".red

test "multiple styles":
  check "\e[36m\e[1mpass\e[0m\e[0m" == "pass".bold.cyan


