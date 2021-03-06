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
      - announce to_console "[dTests] Context: had_error = <context.had_error>"

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
  - define a a
  - repeat 100000:
    - define x a
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
  - define a a
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
  - define a a
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
#
# FLAGS
#
# ------------------------------------ #
#
dTests_DataStorage_Flags_1:
# >ex run s@dTests_DataStorage_Flags_1 instantly
# [01:19:24] [Server thread/INFO]: Executing Denizen script command...
# [01:19:24] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_ExecutedConnecticutHitachi'... 
# [01:19:24] [Server thread/INFO]: +- Queue 'EXCOMMAND_ExecutedConnecticutHitachi' Executing: (line 1) RUN s@dTests_DataStorage_Flags_1 instantly ---------+ 
# [01:19:24] [Server thread/INFO]: +> Executing 'RUN': script='s@dTests_datastorage_flags_1 (TASK)'  instant='true' 
# [01:19:24] [Server thread/INFO]:  Completing queue 'EXCOMMAND_ExecutedConnecticutHitachi' in 393ms. 

  type: task
  debug: false
  comment: 'Flag with literal value'
  script:
  - repeat 100000:
    - flag server dTests_DataStorage_Flags_1:true
  - flag server dTests_DataStorage_Flags_1:!
#
dTests_DataStorage_Flags_2:
# >ex run s@dTests_DataStorage_Flags_2 instantly
# [01:20:59] [Server thread/INFO]: Executing Denizen script command...
# [01:20:59] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_SonicLoginBox'... 
# [01:20:59] [Server thread/INFO]: +- Queue 'EXCOMMAND_SonicLoginBox' Executing: (line 1) RUN s@dTests_DataStorage_Flags_2 instantly ---------+ 
# [01:20:59] [Server thread/INFO]: +> Executing 'RUN': script='s@dTests_datastorage_flags_2 (TASK)'  instant='true' 
# [01:21:00] [Server thread/INFO]:  Completing queue 'EXCOMMAND_SonicLoginBox' in 404ms. 
  type: task
  debug: false
  comment: 'Flag with <[def]>'
  script:
  - define a a
  - repeat 100000:
    - flag server dTests_DataStorage_Flags_2:<[a]>
  - flag server dTests_DataStorage_Flags_2:!
#
dTests_DataStorage_Flags_3:
# >ex run s@dTests_DataStorage_Flags_3 instantly
# [01:21:44] [Server thread/INFO]: Executing Denizen script command...
# [01:21:44] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_CertainlyBasinAqua'... 
# [01:21:44] [Server thread/INFO]: +- Queue 'EXCOMMAND_CertainlyBasinAqua' Executing: (line 1) RUN s@dTests_DataStorage_Flags_3 instantly ---------+ 
# [01:21:44] [Server thread/INFO]: +> Executing 'RUN': script='s@dTests_datastorage_flags_3 (TASK)'  instant='true' 
# [01:21:45] [Server thread/INFO]:  Completing queue 'EXCOMMAND_CertainlyBasinAqua' in 818ms.
  type: task
  debug: false
  # comment: 'Flag with <flag[flag]>'
  script:
  - flag server dTests_DataStorage_Flags_3:true
  - repeat 100000:
    - flag server dTests_DataStorage_Flags_3:<server.flag[dTests_DataStorage_Flags_3]>
  - flag server dTests_DataStorage_Flags_3:!
#
dTests_DataStorage_Flags_write:
# >ex run <script[dTests_DataStorage_flags_write]>
# [00:52:27] [Server thread/INFO]: Executing Denizen script command...
# [00:52:27] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_GmcDenizenPassed'... 
# [00:52:27] [Server thread/INFO]: +- Queue 'EXCOMMAND_GmcDenizenPassed' Executing: (line 1) RUN <script[dTests_DataStorage_flags_write]> ---------+ 
# [00:52:27] [Server thread/INFO]:  Filled tag <script[dTests_DataStorage_flags_write]> with 's@dtests_datastorage_flags_write (TASK)'. 
# [00:52:27] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_datastorage_flags_write (TASK)' 
# [00:52:27] [Server thread/INFO]:  Completing queue 'EXCOMMAND_GmcDenizenPassed' in 398ms. 
  type: task
  debug: false
  script:
  - repeat 100000:
    - flag server dTests_DataStorage_Flags_write:1
#
dTests_DataStorage_Flags_read:
# >ex run <script[dTests_DataStorage_flags_read]>
# [00:57:36] [Server thread/INFO]: Executing Denizen script command...
# [00:57:36] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_PikeSoutheastWeekends'... 
# [00:57:36] [Server thread/INFO]: +- Queue 'EXCOMMAND_PikeSoutheastWeekends' Executing: (line 1) RUN <script[dTests_DataStorage_flags_read]> ---------+ 
# [00:57:36] [Server thread/INFO]:  Filled tag <script[dTests_DataStorage_flags_read]> with 's@dtests_datastorage_flags_read (TASK)'. 
# [00:57:36] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_datastorage_flags_read (TASK)' 
# [00:57:36] [Server thread/INFO]:  Completing queue 'EXCOMMAND_PikeSoutheastWeekends' in 489ms. 
  type: task
  debug: false
  script:
  - repeat 100000:
    - define a <server.flag[dTests_DataStorage_Flags_write]>
#
dTests_DataStorage_Flags_writeRead:
# >ex run <script[dTests_DataStorage_flags_writeRead]>
# [00:58:47] [Server thread/INFO]: Executing Denizen script command...
# [00:58:47] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_TonyJudyPaintball'... 
# [00:58:47] [Server thread/INFO]: +- Queue 'EXCOMMAND_TonyJudyPaintball' Executing: (line 1) RUN <script[dTests_DataStorage_flags_writeRead]> ---------+ 
# [00:58:47] [Server thread/INFO]:  Filled tag <script[dTests_DataStorage_flags_writeRead]> with 's@dtests_datastorage_flags_writeread (TASK)'. 
# [00:58:47] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_datastorage_flags_writeread (TASK)' 
# [00:58:48] [Server thread/INFO]:  Completing queue 'EXCOMMAND_TonyJudyPaintball' in 817ms. 
  type: task
  debug: false
  script:
  - repeat 100000:
    - flag server dTests_DataStorage_Flags_write:<server.flag[dTests_DataStorage_Flags_write]>
#
#
# - END FLAGS
#
# ---------------------------------------------------------------------------- #
#
# YAML
#
# ------------------------------------ #
#
dTests_DataStorage_yaml_load:
# >ex run <script[dTests_DataStorage_yaml_load]>
# [00:23:30] [Server thread/INFO]: Executing Denizen script command...
# [00:23:30] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_AolBeliefsAutomated'... 
# [00:23:30] [Server thread/INFO]: +- Queue 'EXCOMMAND_AolBeliefsAutomated' Executing: (line 1) RUN <script[dTests_DataStorage_yaml_load]> ---------+ 
# [00:23:30] [Server thread/INFO]:  Filled tag <script[dTests_DataStorage_yaml_load]> with 's@dtests_datastorage_yaml_load (TASK)'. 
# [00:23:30] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_datastorage_yaml_load (TASK)' 
# [00:23:30] [Server thread/INFO]:  Completing queue 'EXCOMMAND_AolBeliefsAutomated' in 346ms. 
  type: task
  debug: false
  script:
  - if !<server.has_file[dTests/yaml_test.yml]>:
    - yaml create id:dTests_DataStorage_yaml
    - yaml set value:1 id:dTests_DataStorage_yaml
    - yaml savefile:dTests/yaml_test.yml id:dTests_DataStorage_yaml
  - if <yaml.list.contains[dTests_DataStorage_yaml]>:
    - yaml unload id:dTests_DataStorage_yaml
  - repeat 10000:
    - yaml load:dTests/yaml_test.yml id:dTests_DataStorage_yaml
#
dTests_DataStorage_yaml_write:
# >ex run <script[dTests_DataStorage_yaml_write]>
# [00:24:39] [Server thread/INFO]: Executing Denizen script command...
# [00:24:39] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_BottomBrakesBecomes'... 
# [00:24:39] [Server thread/INFO]: +- Queue 'EXCOMMAND_BottomBrakesBecomes' Executing: (line 1) RUN <script[dTests_DataStorage_yaml_write]> ---------+ 
# [00:24:39] [Server thread/INFO]:  Filled tag <script[dTests_DataStorage_yaml_write]> with 's@dtests_datastorage_yaml_write (TASK)'. 
# [00:24:39] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_datastorage_yaml_write (TASK)' 
# [00:24:40] [Server thread/INFO]:  Completing queue 'EXCOMMAND_BottomBrakesBecomes' in 169ms. 
  type: task
  debug: false
  script:
  - repeat 100000:
    - yaml set value:1 id:dTests_DataStorage_yaml
#
dTests_DataStorage_yaml_read:
# >ex run <script[dTests_DataStorage_yaml_read]>
# [00:25:21] [Server thread/INFO]: Executing Denizen script command...
# [00:25:21] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_JerusalemPurchasesEthics'... 
# [00:25:21] [Server thread/INFO]: +- Queue 'EXCOMMAND_JerusalemPurchasesEthics' Executing: (line 1) RUN <script[dTests_DataStorage_yaml_read]> ---------+ 
# [00:25:21] [Server thread/INFO]:  Filled tag <script[dTests_DataStorage_yaml_read]> with 's@dtests_datastorage_yaml_read (TASK)'. 
# [00:25:21] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_datastorage_yaml_read (TASK)' 
# [00:25:21] [Server thread/INFO]:  Completing queue 'EXCOMMAND_JerusalemPurchasesEthics' in 138ms. 
  type: task
  debug: false
  script:
  - repeat 100000:
    - define a <yaml[dTests_DataStorage_yaml].read[value]>
#
dTests_DataStorage_yaml_writeRead:
# >ex run <script[dTests_DataStorage_yaml_writeRead]>
# [00:51:13] [Server thread/INFO]: Executing Denizen script command...
# [00:51:13] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_NuclearProducingInteraction'... 
# [00:51:13] [Server thread/INFO]: +- Queue 'EXCOMMAND_NuclearProducingInteraction' Executing: (line 1) RUN <script[dTests_DataStorage_yaml_writeRead]> ---------+ 
# [00:51:13] [Server thread/INFO]:  Filled tag <script[dTests_DataStorage_yaml_writeRead]> with 's@dtests_datastorage_yaml_writeread (TASK)'. 
# [00:51:13] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_datastorage_yaml_writeread (TASK)' 
# [00:51:13] [Server thread/INFO]:  Completing queue 'EXCOMMAND_NuclearProducingInteraction' in 217ms. 
  type: task
  debug: false
  script:
  - repeat 100000:
    - yaml set value:<yaml[dTests_DataStorage_yaml].read[value]> id:dTests_DataStorage_yaml
#
dTests_DataStorage_yaml_save:
# >ex run <script[dTests_DataStorage_yaml_save]>
# [00:26:33] [Server thread/INFO]: Executing Denizen script command...
# [00:26:33] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_StayingFluxLisa'... 
# [00:26:33] [Server thread/INFO]: +- Queue 'EXCOMMAND_StayingFluxLisa' Executing: (line 1) RUN <script[dTests_DataStorage_yaml_save]> ---------+ 
# [00:26:33] [Server thread/INFO]:  Filled tag <script[dTests_DataStorage_yaml_save]> with 's@dtests_datastorage_yaml_save (TASK)'. 
# [00:26:33] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_datastorage_yaml_save (TASK)' 
# [00:26:34] [Server thread/INFO]:  Completing queue 'EXCOMMAND_StayingFluxLisa' in 1053ms. 
  type: task
  debug: false
  script:
  - repeat 10000:
    - yaml savefile:dTests/yaml_test.yml id:dTests_DataStorage_yaml
#
dTests_DataStorage_yaml_unload:
# >ex run <script[dTests_DataStorage_yaml_unload]>
# [00:27:16] [Server thread/INFO]: Executing Denizen script command...
# [00:27:16] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_CitizensFittingLarger'... 
# [00:27:16] [Server thread/INFO]: +- Queue 'EXCOMMAND_CitizensFittingLarger' Executing: (line 1) RUN <script[dTests_DataStorage_yaml_unload]> ---------+ 
# [00:27:16] [Server thread/INFO]:  Filled tag <script[dTests_DataStorage_yaml_unload]> with 's@dtests_datastorage_yaml_unload (TASK)'. 
# [00:27:16] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_datastorage_yaml_unload (TASK)' 
# [00:27:16] [Server thread/INFO]:  Completing queue 'EXCOMMAND_CitizensFittingLarger' in 0ms.
  type: task
  debug: false
  script:
  - yaml unload id:dTests_DataStorage_yaml
#
#
# - END YAML
#
# ---------------------------------------------------------------------------- #
#                                                                              #
# END DATA STORAGE                                                             #
#                                                                              #
#                                                                              #
#______________________________________________________________________________#
#                                                                              #
#==============================================================================#




# ============================================================================ #
# ---------------------------------------------------------------------------- #
#                                                                              |
#   C o n d i t i o n a l s                                                    |
#                                                                              |
# ---------------------------------------------------------------------------- #
#    How to run code blocks based on variables                                 |
#                                                                              |
# ____________________________________________________________________________ #
#                                                                              #
# ============================================================================ #
#
# ---------------------------------------------------------------------------- #
#
# IF
#
# ------------------------------------ #
#
dTests_Conditionals_If:
# >ex run <script[dTests_Conditionals_If]>
# [02:01:34] [Server thread/INFO]: Executing Denizen script command...
# [02:01:34] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_GuiltyCharmingCigarettes'... 
# [02:01:34] [Server thread/INFO]: +- Queue 'EXCOMMAND_GuiltyCharmingCigarettes' Executing: (line 1) RUN <script[dTests_Conditionals_If]> ---------+ 
# [02:01:34] [Server thread/INFO]:  Filled tag <script[dTests_Conditionals_If]> with 's@dtests_conditionals_if (TASK)'. 
# [02:01:34] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_conditionals_if (TASK)' 
# [02:01:35] [Server thread/INFO]:  Completing queue 'EXCOMMAND_GuiltyCharmingCigarettes' in 74ms. 
  type: task
  debug: false
  script:
  - repeat 10000:
    - define val <list[foo|bar|baz].random>
    - if <[val]> == foo:
      - repeat next
    - else if <[val]> == bar:
      - repeat next
    - else if <[val]>  == baz:
      - repeat next
#
# - END IF
#
# ---------------------------------------------------------------------------- #
#
# CHOOSE
#
# ------------------------------------ #
#
dTests_Conditionals_Choose:
# >ex run <script[dTests_Conditionals_Choose]>
# [02:04:41] [Server thread/INFO]: Executing Denizen script command...
# [02:04:41] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_UndDiscussionsIndustrial'... 
# [02:04:41] [Server thread/INFO]: +- Queue 'EXCOMMAND_UndDiscussionsIndustrial' Executing: (line 1) RUN <script[dTests_Conditionals_Choose]> ---------+ 
# [02:04:41] [Server thread/INFO]:  Filled tag <script[dTests_Conditionals_Choose]> with 's@dtests_conditionals_choose (TASK)'. 
# [02:04:41] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_conditionals_choose (TASK)' 
# [02:04:41] [Server thread/INFO]:  Completing queue 'EXCOMMAND_UndDiscussionsIndustrial' in 24ms. 
  type: task
  debug: false
  script:
  - repeat 10000:
    - define val <list[foo|bar|baz].random>
    - choose <[val]>:
      - case foo:
        - repeat next
      - case bar:
        - repeat next
      - case baz:
        - repeat next
#
# - END CHOOSE
#
# ---------------------------------------------------------------------------- #
#
# INJECT
#
# ------------------------------------ #
#
dTests_Conditionals_Inject:
# >ex run <script[dTests_Conditionals_Inject]>
# [02:09:27] [Server thread/INFO]: Executing Denizen script command...
# [02:09:27] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_CarryingWashAuthors'... 
# [02:09:27] [Server thread/INFO]: +- Queue 'EXCOMMAND_CarryingWashAuthors' Executing: (line 1) RUN <script[dTests_Conditionals_Inject]> ---------+ 
# [02:09:27] [Server thread/INFO]:  Filled tag <script[dTests_Conditionals_Inject]> with 's@dtests_conditionals_inject (TASK)'. 
# [02:09:27] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_conditionals_inject (TASK)' 
# [02:09:27] [Server thread/INFO]:  Completing queue 'EXCOMMAND_CarryingWashAuthors' in 27ms. 
  type: task
  debug: false
  script:
  - repeat 10000:
    - define val <list[foo|bar|baz].random>
    - inject locally <[val]>
  foo:
    - repeat next
  bar:
    - repeat next
  baz:
    - repeat next
#
# - END INJECT
#
# ---------------------------------------------------------------------------- #
#
# RUN
#
# ------------------------------------ #
#
dTests_Conditionals_Run:
# >ex run <script[dTests_Conditionals_run]>
# [02:10:29] [Server thread/INFO]: Executing Denizen script command...
# [02:10:29] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_AirfareNewportSystematic'... 
# [02:10:29] [Server thread/INFO]: +- Queue 'EXCOMMAND_AirfareNewportSystematic' Executing: (line 1) RUN <script[dTests_Conditionals_run]> ---------+ 
# [02:10:29] [Server thread/INFO]:  Filled tag <script[dTests_Conditionals_run]> with 's@dtests_conditionals_run (TASK)'. 
# [02:10:29] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_conditionals_run (TASK)' 
# [02:10:29] [Server thread/INFO]:  Completing queue 'EXCOMMAND_AirfareNewportSystematic' in 38ms. 
  type: task
  debug: false
  script:
  - repeat 10000:
    - define val <list[foo|bar|baz].random>
    - run instantly <script[dTests_Conditionals_Run]> path:<[val]>
  foo:
    - stop
  bar:
    - stop
  baz:
    - stop
#
# - END RUN
#
# ---------------------------------------------------------------------------- #
#
# GOTO
#
# ------------------------------------ #
#
dTests_Conditionals_Goto:
# >ex run <script[dTests_Conditionals_Goto]>
# [02:17:10] [Server thread/INFO]: Executing Denizen script command...
# [02:17:10] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_ControlledLnCreek'... 
# [02:17:10] [Server thread/INFO]: +- Queue 'EXCOMMAND_ControlledLnCreek' Executing: (line 1) RUN <script[dTests_Conditionals_Goto]> ---------+ 
# [02:17:10] [Server thread/INFO]:  Filled tag <script[dTests_Conditionals_Goto]> with 's@dtests_conditionals_goto (TASK)'. 
# [02:17:10] [Server thread/INFO]: +> Executing 'RUN': script='s@dtests_conditionals_goto (TASK)' 
# [02:17:10] [Server thread/INFO]:  Completing queue 'EXCOMMAND_ControlledLnCreek' in 32ms.
  type: task
  debug: false
  script:
  - repeat 10000:
    - define val <list[foo|bar|baz].random>
    - goto <[val]>
    - mark foo
    - repeat next
    - mark bar
    - repeat next
    - mark baz
    - repeat next
#
# - END GOTO
#
# ---------------------------------------------------------------------------- #
#                                                                              #
# END CONDITIONALS                                                             #
#                                                                              #
#                                                                              #
#______________________________________________________________________________#
#                                                                              #
#==============================================================================#