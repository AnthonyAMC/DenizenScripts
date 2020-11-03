# ============================================================================ #
# ---------------------------------------------------------------------------- #
#                                                                              |
#                                                                              |
#                          D e n i z e n   T e s t s                           |
#                                                                              |
#                       Stress tests and timings reports                       |
#                                                                              |
#                                                                              |
#   Author: |Anthony|                                                          |
#   Version: 0.0.1                                                             |
#   dScript Version: 1.1.7-b5132-DEV                                           |
#                                                                              |
# ---------------------------------------------------------------------------- #
#                                                                              |
#                                                                              |
# ABOUT:                                                                       |
#                                                                              |
#       A collection of scripts that test Denizen in various ways.             |
#     This is the result of me exploring the limits of Denizen and finding     |
#     multiple ways to do various things.                                      |
#                                                                              |
#                                                                              |
#______________________________________________________________________________#
#                                                                              #
#==============================================================================#




# ============================================================================ #
# ---------------------------------------------------------------------------- #
#                                                                              |
#   E V E N T S                                                                |
#                                                                              |
# ---------------------------------------------------------------------------- #
#    Simply announce the event context to verify it works                      |
#                                                                              |
# ____________________________________________________________________________ #
#                                                                              #
# ============================================================================ #
#
dTests_Events_World:
  type: world
  debug: false
  events:

    on pre script reload:
      - announce to_console "[dTests] dUinitTest_Events_World: Pre-Script Reload"
      - announce to_console "[dTests] Context: none"

    on reload scripts:
      - announce to_console "[dTests] dUinitTest_Events_World: Scripts Reloaded"
      - announce to_console "[dTests] Context: had_error = <c.had_error>"

    on server prestart:
      - announce to_console "[dTests] dUinitTest_Events_World: Server Prestart"
      - announce to_console "[dTests] Context: none"

    on server start:
      - announce to_console "[dTests] dUinitTest_Events_World: Server Start"
      - announce to_console "[dTests] Context: none"

    on shutdown:
      - announce to_console "[dTests] dUinitTest_Events_World: Server Shutdown"
      - announce to_console "[dTests] Context: none"
#______________________________________________________________________________#
#                                                                              #
#==============================================================================#