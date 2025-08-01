1.14.1
- Updated pack to load in 1.21.9 snapshots
(However, take note that some things are BROKEN due to pack.mcmeta being changed, this includes:
	- New additions, such as axolotl unique items, unique paintings, happy ghasts, etc
	- Shaders, such as old fog
Anyways, when I figure out how to fix backwards compatibility I'll surely update the mcmeta!)
- Added missing copper door item models
	- This includes the models for all oxidized stages
- Added zoglin and zombified piglin spawn egg consistent textures (previously they were pink, now they match)
- Sightly tweaked hoglin, piglin brute and piglin spawn eggs to match zombified versions

1.14.0 - Chase the Skies drop update!
- Updated pack to work in 1.21.4 - 1.21.8
- Resource pack minimum version is now 1.21.4
- Added oarless pale oak boats
- Removed 1.20 overlays folder
	- Because of this, pre-1.21.2 shaders such as simplified glowing effect, or bright armor trims were removed entirely.
- Readjusted pack format
- Fixed armor slots textures not having its textures
- Fixed elytra broken texture not showing up
- Updated splash texts :P
- Removed green axolotl texture
- Added variated unique axolotl buckets
- Added variated unique paintings
- Replaced glowing ores with an universal currently working version, because shaders got changed in 1.21.
- Added old ghast pixel consistency textures for happy ghasts [https://www.planetminecraft.com/texture-pack/good-ol-ghasts/]
- Moved old fog to its own folder because old fog isn't working in 25w16a+
- Reverted clouds to the pattern before 25w21a and mixed with pattern after 25w21a+
- Fixed goat horn not having textures when used
- Added <=beta 1.7 item tooltips
- Removed custom textures for tools
- Added old styled textures for meat foods (porkchop, beef and mutton)
- Added new sweeping edge sounds

1.13.1 - The bundles of bravery update (full changelog):

- Updated pack to work on 1.21.2 and 1.21.3
- Added vanilla emmisive glowing ores (only works in MC 24w33a and beyond)
- Fixed vexes having broken textures
- Sky fog fix added in pack version 1.6.6 [MC-227139] now only supports Minecraft versions 1.20.5 to 1.21.1
- Added 24w33a redstone torch block textures, model and item model
- Added 24w33a repeater and comparator models with updated redstone torch
- Removed smiling bees
- Changed enchantment glint to default
- Changed some splash texts
- Changed cod textures to the pre-1.13 item style
	- This also affects the cod bucket item
- Renamed 1.20 shaders folder because it's not used only for clouds now
- Glowing armor trim shaders are now moved to 1_20_shaders folder because they're incompatible in 24w34a+
- Improved recipe book filter buttons
- Changed bubble column texture
- Changed minecart textures
- Added back hotbar GUI from pack versions pre-1.10
- Added Minecraft pre-1.4.2 sounds for stone and wood blocks
- Fixed cauldron item sides not displaying correctly [after 4 years (':]
- Added bedrock entity shadows
- Restricted background music to C418 only in the end, menu and overworld
	- Lena Raine's nether update music is still available
- Added simplified vanilla glowing effect outline (severe fps boost for weak computers)
[https://github.com/McTsts/mc-core-shaders/tree/main/simplified%20glowing] (only works in 1.20.5 - 1.21.1)
- Fixed fog being too dense in the nether (This change does NOT apply when using Sodium Core Shader Support!)
	- HOW EVER, if the render distance is >16 chunks, fog will be dense once again
- Fog is now once again spherical (This change does NOT apply when using Sodium Core Shader Support!)
- Added back textures for offhand slots
- Fixed offhand slots not having their keybinds
- Changed recipe book gui texture
- Added console-styled shield item slot icon
- Added Vanilla tweaks' old ice textures
- Added old beta 1.7.3 highlighted blue gui
- Changed gamemode switcher textures
- Fixed blackstone stairs having netherite block textures (when tf did I do this?)
- Cleaned some unused or old not working textures
- Removed goat horn model
- Removed fast grass block sides
- Removed old fog style support for Sodium Core Shader Support
- Added Legacy Console Edition's music "Cat" mixed with "Dog"
- Sightly changed fog start (from 3 to 2.5)
- Added round log tops for cherry and pale oak logs
- Added item model for pale oak door
- Added fencier fence gates textures for pale oak fences and fence gates
- Removed variations for warped planks
- Added Kung Fu Panda's Po easter egg for aggresive panda variant
- Grass blocks and dirt paths now have their own particles
- Added item textures for all armors, being consistent with its model style
- Ported 1.21.2 left hand display for <=1.21.1
- Reverted left hand display for totem of undying because it looks too weird
- Fixed nether sprouts item holding
- Fixed nether wart and bowl having missing textures
- Added 3D item model for pale oak signs
- Separated bedrock leaves as an add-on to reduce performance issues in Vanilla
