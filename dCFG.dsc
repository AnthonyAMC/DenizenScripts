# ---------------------------------------------------------------------------- #
#                                                                              |
#                                                                              |
#                     C o n f i g F i l e G e n e r a t o r                    |
#                                                                              |
#         A system for extracting default config files for your scripts        |
#                                                                              |
#                                                                              |
#   Author: |Anthony|                                                          |
#   Version: 2.0                                                               |
#   dScript Version: 1.1.7-b5132-DEV                                           |
#                                                                              |
# ---------------------------------------------------------------------------- #
#                                                                              |
#                                                                              |
# ABOUT:                                                                       |
#                                                                              |
#       It extracts default config files from your script. It is entirely      |
#     useless now since Denizen has the builtin copykey argument for the       |
#     yaml command.                                                            |
#                                                                              |
#       This is a re-write of an old script of mine that was then very         |
#     useful to me, but no longer necessary. This was just an exercise for     |
#     me to get back into Denizen scripting.                                   |
#                                                                              |
#       Included is an example usage scenario presented in the form of a       |
#     comparative stress test against the builtin copykey arg.                 |
#                                                                              |
#______________________________________________________________________________#
#                                                                              #
#==============================================================================#
#                                                                              #
#------------------------------------------------------------------------------#
#..............................................................................#
#                                                                              #
dCFG_Main:
  type: task
#   definitions: readID|writeID|readPath|writePath
  debug: false
  script:
    - choose <script[<[1]>].data_key[<[3]>].type||element>:
      - case map:
        - yaml set <[4]>:<map[]> id:<[2]>
        - foreach <script[<[1]>].list_keys[<[3]>]>:
          - run instantly <script[dCFG_Main]> def:<[1]>|<[2]>|<[3]>.<[value]>|<[4]>.<[value]>
      - case list:
        - yaml set <[4]>:|: id:<[2]>
        - foreach <script[<[1]>].data_key[<[3]>].unescaped>:
          - yaml set <[4]>:->:<[value].unescaped> id:<[2]>
      - case element:
        - yaml set <[4]>:<script[<[1]>].data_key[<[3]>].unescaped> id:<[2]>
#______________________________________________________________________________#
#                                                                              |
#==============================================================================#
#                                                                              #
#                          E X A M P L E   U S A G E                           #
#                                                                              #
#------------------------------------------------------------------------------#
#..............................................................................#
#______________________________________________________________________________#
#                                                                              #
dCFG_Example_dCFG:
# >ex run <script[dCFG_Example_dCFG]>
# [12:39:57] [Server thread/INFO]: Executing Denizen script command...
# [12:39:57] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_OhioNebraskaCircular'...
# [12:39:57] [Server thread/INFO]: +- Queue 'EXCOMMAND_OhioNebraskaCircular' Executing: (line 1) RUN <script[dCFG_Example_dCFG]> ---------+
# [12:39:57] [Server thread/INFO]:  Filled tag <script[dCFG_Example_dCFG]> with 's@dcfg_example_dcfg (TASK)'.
# [12:39:57] [Server thread/INFO]: +> Executing 'RUN': script='s@dcfg_example_dcfg (TASK)'
# [12:39:58] [Server thread/INFO]:  Completing queue 'EXCOMMAND_OhioNebraskaCircular' in 580ms.
  type: task
  debug: false
  script:
    - define readID dCFG_Test_Config
    - define writeID CFG_Test_Config_Output
    - define readPath <element[]>
    - define writePath <element[]>
    - define savePath dCFG/config_b.yml
    - if <yaml.list.contains[<[writeID]>]>:
      - yaml unload id:<[writeID]>
    - if <server.has_file[<[savePath]>]>:
      - yaml load:<[savePath]> id:<[writeID]>
    - else:
      - yaml create id:<[writeID]>

    - repeat 1000:
      - foreach <script[<[readID]>].list_keys[<[readPath]>].exclude[type]>:
        - run instantly <script[dCFG_Main]> def:<[readID]||>|<[writeID]||>|<[value]>|<[value]>

    - yaml savefile:<[savePath]> id:<[writeID]>
    - yaml unload id:<[writeID]>

dCFG_Example_copykey:
# >ex run <script[dCFG_Example_copykey]>
# [12:41:05] [Server thread/INFO]: Executing Denizen script command...
# [12:41:05] [Server thread/INFO]:  Starting InstantQueue 'EXCOMMAND_MxRvNewfoundland'...
# [12:41:05] [Server thread/INFO]: +- Queue 'EXCOMMAND_MxRvNewfoundland' Executing: (line 1) RUN <script[dCFG_Example_copykey]> ---------+
# [12:41:05] [Server thread/INFO]:  Filled tag <script[dCFG_Example_copykey]> with 's@dcfg_example_copykey (TASK)'.
# [12:41:05] [Server thread/INFO]: +> Executing 'RUN': script='s@dcfg_example_copykey (TASK)'
# [12:41:05] [Server thread/INFO]:  Completing queue 'EXCOMMAND_MxRvNewfoundland' in 22ms.
  type: task
  debug: false
  script:
    - define readID dCFG_Test_Config
    - define writeID CFG_Test_Config_Output
    - define readPath <element[]>
    - define writePath <element[]>
    - define savePath dCFG/config_a.yml
    - if <yaml.list.contains[<[writeID]>]>:
      - yaml unload id:<[writeID]>
    - if <server.has_file[<[savePath]>]>:
      - yaml load:<[savePath]> id:<[writeID]>
    - else:
      - yaml create id:<[writeID]>

    - yaml load:<script[dCFG_Main].relative_filename> id:<[readID]>
    - repeat 1000:
      - foreach <yaml[<[readID]>].list_keys[dCFG_Test_Config].exclude[type]>:
        - yaml copykey:dCFG_Test_Config.<[value]> <[value]> to_id:<[writeID]> id:<[readID]>
    - yaml unload id:<[readID]>

    - yaml savefile:<[savePath]> id:<[writeID]>
    - yaml unload id:<[writeID]>
#______________________________________________________________________________#
#                                                                              #
#==============================================================================#
#______________________________________________________________________________#
#                                                                              #
# Example Config Script Container                                              #
#                                                                              #
#------------------------------------------------------------------------------#
#..............................................................................#
#______________________________________________________________________________#
#                                                                              #
dCFG_Test_Config:
  type: data

# ------ Single Value file container ------ #

  singleValues:
    keyA: 1
    keyB: 0.1
    keyC: -1
    keyD: NaN
    keyE: This is a StRiNg!

# ------ Single Lists file container ------ #

  singleLists:
    listA:
      - 1
      - 0.1
      - -1
      - NaN
      - This is a StRiNg!
    listB:
      - 2
      - 0.2
      - -2
      - nAn
      - This is a sTrInG!

# ------ Recursive Lists file container ------ #

  recursiveLists:
    list1:
      list1A:
        list1A1:
          key1A1A: 1
          list1A1A:
            - 1
            - 2
        list1A2:
          list1A2A:
            key1A2A1: 1
            list1A2A1:
              - 1
              - 2
      list1B:
        - 1
        - 2
    list2:
      list2A:
        key2A1: 1
        list2A1:
          - 1
          - 2
      list2B:
        key2B1: 1
        list2B1:
          - 1
          - 2
      list2C:
        key2C1: 1
        list2C1:
          - 1
          - 2
    list3:
      emptyKey: {}
      emptyList: []
      emptyValue: ''
#______________________________________________________________________________#
#                                                                              #
#==============================================================================#