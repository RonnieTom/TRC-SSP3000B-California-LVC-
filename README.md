# Based on Luxart Vehicle Control (LVC) | 基于 Luxart 车辆控制 (LVC)

## 简介 | Introduction

LVC（Luxart Vehicle Control）是一款专为FiveM平台设计的高自由度警灯、警报器、配件控制与HUD自定义插件，适用于各类应急车辆。支持多种自定义UI联动、动画、音效与多警笛状态独立/叠加显示。

LVC (Luxart Vehicle Control) is a highly customizable siren, emergency light, and vehicle accessory controller for FiveM, supporting advanced HUD, animation, sound, and independent/overlay siren states for all types of emergency vehicles.


![e62fa92d237ad1b9bb5de2d20a2008a8](https://github.com/user-attachments/assets/3676c01e-f73a-446b-aa2c-79f0ef263478)

YouTube https://youtu.be/WSVgbH0XMaM?si=Fi7dY5xK0YKBPahl


## 主要功能 | Main Features

- 主警笛、气喇叭、手动警报等多种警报状态独立控制
- 主警笛不同音调（Wail/Yelp/Priority）HUD图片自动切换
- 警灯开启时主警灯轮播动画（code_L/code_R）
- 支持每辆车自定义配件（extra1~extra4），HUD图片与动画联动
- 配件激活/关闭时播放自定义音效
- 配件HUD图片与主警灯轮播互斥显示，避免重叠
- 完善的NUI消息机制，前后端状态同步
- 高度可定制的UI与图片路径、动画间隔

---

- Independent control for main siren, airhorn, manual, etc.
- Automatic HUD image switching for different main siren tones (Wail/Yelp/Priority)
- Main lightbar animation (code_L/code_R) when lights are on
- Per-vehicle custom extras (extra1~extra4) with HUD and animation linkage
- Custom sound effects for extra activation/deactivation
- Mutual exclusion between extra HUD images and main lightbar animation (no overlap)
- PA (AUX/PA) and main siren can overlay, display independently
- Robust NUI messaging for frontend-backend state sync
- Highly customizable UI, image paths, and animation intervals

---

## 安装与使用 | Installation & Usage

1. 将本插件文件夹放入FiveM资源目录下（resources/[车辆]/[Luxart]/lvc）。
2. 在`server.cfg`中添加：
   ```
   ensure lvc
   ```
3. 根据`SETTINGS.lua`和`SIRENS.lua`自定义警笛、配件、图片路径等参数。
4. 启动服务器，进入游戏即可体验自定义HUD与警灯控制。

1. Place this resource folder into your FiveM resources directory (resources/[vehicles]/[Luxart]/lvc).
2. Add to your `server.cfg`:
   ```
   ensure lvc
   ```
3. Customize sirens, extras, image paths, etc. in `SETTINGS.lua` and `SIRENS.lua`.
4. Start your server and enjoy the advanced HUD and light control in-game.

---

## 常见问题与支持 | FAQ & Support

- 如遇到UI图片不显示、警笛状态不同步等问题，请检查NUI消息与Lua配置是否正确。
- 建议使用最新版FiveM与浏览器，确保NUI兼容性。
- 更多问题可在GitHub或FiveM社区反馈。

- If HUD images do not display or siren states are not synced, check your NUI messages and Lua configs.
- Use the latest FiveM and browser for best NUI compatibility.
- For more issues, report on GitHub or the FiveM community.

---

## 致谢与开源协议 | Credits & License

- 本插件基于GNU GPL v3协议开源，欢迎二次开发与贡献。
- 感谢原作者TrevorBarns及所有社区贡献者。

- This plugin is open-sourced under the GNU GPL v3 license. Contributions are welcome!
- Thanks to the original author TrevorBarns and all community contributors.
