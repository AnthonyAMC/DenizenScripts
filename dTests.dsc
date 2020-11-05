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
      - announce to_console "[dTests] dTests_Events_World: Pre-Script Reload"
      - announce to_console "[dTests] Context: none"

    on reload scripts:
      - announce to_console "[dTests] dTests_Events_World: Scripts Reloaded"
      - announce to_console "[dTests] Context: had_error = <c.had_error>"

    on server prestart:
      - announce to_console "[dTests] dTests_Events_World: Server Prestart"
      - announce to_console "[dTests] Context: none"

    on server start:
      - announce to_console "[dTests] dTests_Events_World: Server Start"
      - announce to_console "[dTests] Context: none"

    on shutdown:
      - announce to_console "[dTests] dTests_Events_World: Server Shutdown"
      - announce to_console "[dTests] Context: none"
#______________________________________________________________________________#
#                                                                              #
#==============================================================================#




# ============================================================================ #
# ---------------------------------------------------------------------------- #
#                                                                              |
#   D A T A   S T O R A G E                                                    |
#                                                                              |
# ---------------------------------------------------------------------------- #
#    Compare speeds of various ways we can store and access data               |
#                                                                              |
# ____________________________________________________________________________ #
#                                                                              #
# ============================================================================ #
#
# ---------------------------------------------------------------------------- #
#
# DEFINITIONS
#
# ------------------------------------ #
#
dTests_DataStorage_Definitions_1:
# >ex run s@dTests_DataStorage_Definitions_1 instantly
# [01:05:32] [Server thread/INFO]: Executing Denizen script command...
# [01:05:32] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_IcelandMathematicsSends'...
# [01:05:32] [Server thread/INFO]: +- Queue 'EXCOMMAND_IcelandMathematicsSends' Executing: (line 1) RUN s@dTests_DataStorage_Definitions_1 instantly ---------+
# [01:05:32] [Server thread/INFO]: +> Executing 'RUN': script='s@dTests_datastorage_definitions_1 (TASK)'  instant='true'
# [01:05:32] [Server thread/INFO]:  Completing queue 'EXCOMMAND_IcelandMathematicsSends' in 90ms.
  type: task
  debug: false
  comment: 'Define literal value'
  script:
  - define a 'a'
  - repeat 100000:
    - define x 'a'
#
dTests_DataStorage_Definitions_2:
# >ex run s@dTests_DataStorage_Definitions_2 instantly
# [01:06:58] [Server thread/INFO]: Executing Denizen script command...
# [01:06:58] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_BmwSupportBiological'... 
# [01:06:58] [Server thread/INFO]: +- Queue 'EXCOMMAND_BmwSupportBiological' Executing: (line 1) RUN s@dTests_DataStorage_Definitions_2 instantly ---------+ 
# [01:06:58] [Server thread/INFO]: +> Executing 'RUN': script='s@dTests_datastorage_definitions_2 (TASK)'  instant='true' 
# [01:06:58] [Server thread/INFO]:  Completing queue 'EXCOMMAND_BmwSupportBiological' in 100ms. 
  type: task
  debug: false
  comment: 'Define with <[def]>'
  script:
  - define a 'a'
  - repeat 100000:
    - define x <[a]>
dTests_DataStorage_Definitions_3:
# >ex run s@dTests_DataStorage_Definitions_3 instantly
# [01:08:26] [Server thread/INFO]: Executing Denizen script command...
# [01:08:26] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_SheetCurrenciesMart'... 
# [01:08:26] [Server thread/INFO]: +- Queue 'EXCOMMAND_SheetCurrenciesMart' Executing: (line 1) RUN s@dTests_DataStorage_Definitions_3 instantly ---------+ 
# [01:08:26] [Server thread/INFO]: +> Executing 'RUN': script='s@dTests_datastorage_definitions_3 (TASK)'  instant='true' 
# [01:08:26] [Server thread/INFO]:  Completing queue 'EXCOMMAND_SheetCurrenciesMart' in 100ms.
  type: task
  debug: false
  comment: 'Define with <definition[def]>'
  script:
  - define a 'a'
  - repeat 100000:
    - define x <definition[a]>
#
dTests_DataStorage_Definitions_4:
# >ex run s@dTests_DataStorage_Definitions_4 instantly
# [01:15:22] [Server thread/INFO]: Executing Denizen script command...
# [01:15:22] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_LancasterComingBeatles'... 
# [01:15:22] [Server thread/INFO]: +- Queue 'EXCOMMAND_LancasterComingBeatles' Executing: (line 1) RUN s@dTests_DataStorage_Definitions_4 instantly ---------+ 
# [01:15:22] [Server thread/INFO]: +> Executing 'RUN': script='s@dTests_datastorage_definitions_4 (TASK)'  instant='true' 
# [01:15:22] [Server thread/INFO]:  Completing queue 'EXCOMMAND_LancasterComingBeatles' in 484ms.
  type: task
  debug: false
  comment: 'Define with <server.flag[flag]>'
  script:
  - flag server dTests_DataStorage_Flags_4:a
  - repeat 100000:
    - define x <server.flag[dTests_DataStorage_Flags_4]||true>
  - flag server dTests_DataStorage_Flags_4:!
#
#
# - END DEFINITIONS
#
# ---------------------------------------------------------------------------- #