--------------------社区ID-------------------
community_id = 'MVRP2022'
--	为用户端保存的值设置前缀，没有这个前缀，在多个LVC服务器上玩的人可能会遇到冲突。**一旦设置，请不要更改。这将导致最终用户数据丢失。**
--	建议使用短（4-6个字符），例如社区缩写。不允许使用空格。

------------------菜单按键绑定------------------
open_menu_key = 'O'
--	设置RegisterKeyMapping的默认键。示例：'l','F5'等。默认：'O'，用户可以在GTA V > 设置 > 快捷键 > FiveM设置中设置一个。
--	更多信息：https://cookbook.fivem.net/2020/01/06/using-the-new-console-key-bindings/
--	按键列表：https://pastebin.com/u9ewvWWZ


---------------锁定功能---------------
lockout_default_hotkey = ''
--	设置RegisterKeyMapping的默认键。示例：'l','F5'等。默认：无，用户可以在GTA V > 设置 > 快捷键 > FiveM设置中设置一个。
--	更多信息：https://cookbook.fivem.net/2020/01/06/using-the-new-console-key-bindings/
--	按键列表：https://pastebin.com/u9ewvWWZ
locked_press_count = 5    
--	提醒的初始按键次数，例如，如果这是5，而reminder_rate是10，那么在5次按键后第一次提醒，在那之后每10次按键提醒一次。 
reminder_rate = 10
--	多久（luxart按键次数）提醒你你的警报器控制器已锁定。

-----------------HUD 功能-----------------
hud_first_default = true
--	HUD的第一个状态，否则它使用玩家的KVP设置（前一个状态）。 

---------------主要警报器设置-----------------
main_siren_settings_masterswitch = true
--	允许用户重命名警报器音调，更改警报器选项。（循环 / 按钮） 
park_kill_masterswitch = true
--	启用停车杀戮功能。将此设置为false将不允许用户更改此默认行为。 
park_kill_default = false
--	停车杀戮模式的默认设置。（默认：true）
airhorn_interrupt_masterswitch = true
--	启用切换空气喇叭中断的能力。将此设置为false将不允许用户更改此默认行为。 
airhorn_interrupt_default = true
--	主要警报器空气喇叭中断的默认设置。（默认：true） 
reset_to_standby_masterswitch = true
--	启用切换到待机状态的能力。将此设置为false将不允许用户更改此默认行为。 
reset_to_standby_default = true
--	Reset-To-Standby功能的默认设置。（默认：true）
horn_on_cycle_masterswitch = true
--	启用切换鸣笛循环功能的能力。将此设置为false将不允许用户更改此默认行为。 
horn_on_cycle_default = false
--	启用鸣笛循环功能时的默认设置，当启用时，您的车辆的默认喇叭将在切换警报器时播放。（默认：false）
airhorn_behavior_masterswitch = true
--	启用自定义鸣笛循环功能的能力。将此设置为false将不允许用户更改此默认行为。 
airhorn_behavior_default = 4
--	空气喇叭行为的默认设置：[1]-禁用空气喇叭，[2]-当灯光激活时使用空气喇叭，[3]-当警报器激活时使用空气喇叭，[4]-始终使用空气喇叭。（默认：4） 

--------------自定义手动/喇叭/警报器---------------
custom_manual_tones_master_switch = true
--	启用手动音调设置菜单项，以更改主音调和次音调所播放的音调。
custom_aux_tones_master_switch = true
--	启用辅助音调设置菜单项，以便玩家可以在启用AUX警报器（向上箭头）时更改所播放的音调。 
main_siren_set_register_keys_set_defaults = true
--	启用RegisterKeyMapping对所有main_allowed_tones，并将默认键设置为numrow 1-0。


--------------转向信号/危险警告---------------
hazard_key = 202	
left_signal_key = 84
right_signal_key = 83
hazard_hold_duration = 750
--	按下退格键以打开/关闭危险警告灯的时间（毫秒）。 


----------------声音效果音量---------------
button_sfx_scheme_choices = { 'SSP2000', 'SSP3000', 'Cencom', 'ST300' }
--	自定义可用的按钮SFX方案。此处的项目必须与位于`lvc\UI\sounds`中的文件夹名称完全匹配，建议不要使用空格，而使用破折号（例如 Cencom-Gold）
default_sfx_scheme_name = 'SSP2000'
default_on_volume = 0.5			
default_off_volume = 0.7			
default_upgrade_volume = 0.5		
default_downgrade_volume = 0.7
default_hazards_volume = 0.09
default_lock_volume = 0.25
default_lock_reminder_volume = 0.2
default_reminder_volume = 0.09


------------------插件支持------------------
plugins_installed = true

------------------车辆配件自定义配置------------------
-- 格式示例：
-- vehicle_extras_config = {
--   ["police"] = {
--     default = {1, 2}, -- 车辆刷新时默认激活的配件编号
--     extra1 = 3,        -- 切换配件1（按 [ ）
--     extra2 = 4,        -- 切换配件2（按 ] ）
--     extra3 = 5,        -- 切换配件3（按 . ）
--     extra4 = 6         -- 切换配件4（按 / ）
--   },
--   ["ambulance"] = {
--     default = {1},
--     extra1 = 2,
--     extra2 = 3,
--     extra3 = 4,
--     extra4 = 5
--   }
-- }
vehicle_extras_config = {
   ["chp20fpiu"] = {
   default = {4, 5, 6, 7, 8, 9}, -- 车辆刷新时默认激活的配件编号
   extra1 = 3,        -- 切换配件1（按 [ ）
   extra2 = 2,        -- 切换配件2（按 ] ）
   extra3 = 1,        -- 切换配件3（按 H ）
   extra4 = nil         -- 切换配件4（按 F11 ）
   },
   ["chp16fpiu"] = {
    default = {4, 5, 6, 7, 8, 9}, -- 车辆刷新时默认激活的配件编号
    extra1 = 3,        -- 切换配件1（按 [ ）
    extra2 = 2,        -- 切换配件2（按 ] ）
    extra3 = nil,        -- 切换配件3（按 H ）
    extra4 = 1         -- 切换配件4（按 F11 ）
    }
  -- ["CHP18D"] = {
  --   default = {1}, -- 车辆刷新时默认激活的配件编号
  --   extra1 = 1,        -- 切换配件1（按 [ ）
  --   extra2 = 2,        -- 切换配件2（按 ] ）
  --   extra3 = 3,        -- 切换配件3（按 H ）
  --   extra4 = nil         -- 切换配件4（按 F11 ）
  -- }
}