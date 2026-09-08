1.20 - The mini "flattening" update:

`This version introduces a new organized style for future changelogs`

## Changes:
- Replaced glowing ores with a new optimized algorithm
	- This successfully restores original ore borders from pack version 1.13
- Removed redundant glowing ore textures for deepslate
- Removed old glowing ores because the code was a total mess
- Removed ´oretemplates´ folder from ´models > block´

*Technical explanation:*

Old glowing ores from pack version 1.13.1 calculated every pixel on the block and gave each one a light pixel individually. This made only the ore, but not the borders have an emmisive texture

New glowing ores load up the base texture and the glow texture. The glow texture superimposes the base one, and it is given a light level, making the code much more optimized and more open to custom textures

- Moved some items inside main folder instead of variations folder:
	- Copper lanterns
	- Copper torches
	- Copper bars
- Door items now rely on a single "template_door"
- All containers textures loadouts now have been decreased by 2 pixels to fix consistency with new selection texture
- Loadout texture for crafter GUI texture has been sightly recolored
- Tweaked mace holding position, now matching correctly Bedrock Edition
- Changed folder names for fog_88 and fog_93 to shaders_88 and shaders_93 respectively
- Changed pack description, now includes version of the pack
- Fixed underwater overlay added in pack version 1.6.4 not being completely visible
- Fixed unlit redstone ore item not being unlit
- Removed fencier fences due to overexcessive file editing cluttering pack's files
- Removed some unused files:
	- custom_fence_inventory
	- custom_fence_post
	- custom_fence_side_east
	- custom_fence_side_west
	- custom_fence_side_north
	- custom_fence_side_south
- End portal top textures are no longer animated
- Fixed menu click sounds being applied to dispensers, levers and droppers
- Zombie textures are now vanilla
- Shulker textures except for Default and Black are now vanilla

## Additions:
- Added more pixels to clouds, as a way of bringing back old textures
- Added glowing aura to end portal frames like Minecraft Dungeons (https://modrinth.com/resourcepack/emissive-end-portal)
- Added new texture for end portal tops to match glowing aura textures
- Added new texture for stonecutters, matching Minecraft Pocket Edition alpha =<0.12.0
	- Fixed bottom texture for stonecutters
- Added support for Gamma Utils resource pack, now Night Vision texture uses the same texture as resource pack
- Added paleteless textures for dyes
- Added loading colors for charging crossbows, matching charging bow textures
- Added hotbar selection texture for GUI selection
- Added unoxidized version of copper ore, raw copper and raw copper block for consistency with copper ingot
- Added actual glass sides for cauldrons with water, powder snow and lava, as well as composter sides (https://www.planetminecraft.com/texture-pack/composter-and-cauldron-side-windows-2-0/)
- Water in cauldrons now becomes tinted depending in different biome water colors

1.19 - Fall drop update:
- Updated pack to work in Minecraft version 26.3
- Pack.mcmeta maximum version is now the latest snapshot resource pack version instead of a fixed number
- Removed "incompatible resource pack" warning when using with Sodium
- Fixed fog not working correctly
- Added new subfolders for fogs:
	- fog_88 (>=26.2 → <=26.3 snapshot 4)
	- fog_93 (>=26.3 snapshot 5)
- Removed Dark UI (temporarily and possibly indefinitely), got broken in 26.3 snapshot 5 :(
	- While this UI doesn't work, original light UI got updated with small tweaks:
		- Updated recipe book button texture
		- All buttons now have a white outline when hovered combined with a blue highlight color
		- Removed unused textures for containers
		- Recipe book arrows are now pixel consistent and smaller
- Added Brewing stand guide in Brewing stand GUI
	- Updated icons in brewing guide GUI to match mob effect icons
	- Slime and stone blocks inside brewing guide GUI are now 3D rendered instead of flat images
- Arabic numerals now work for all languages
- Cushions now have a 3D item model
- Cushions item models are now inside `models > item > cushion` instead of `models > item`
- Updated crafting filter and furnace filter toggle textures to match Bedrock Edition pack
- Changed pack.png icon to Evernight (I love her so much! <3)
- Replaced 2D animated wind charge to a 3D animated wind charge item model
- Reverted creeper face to its iconic, vanilla look (he's not angry anymore!)
- Fixed Weathered Copper Lanterns not having 3D item models
- Heavy Core held item position is now like Bedrock Edition
- End portal frame item model is now fixed completely
- End portal texture is now darker instead of fully black
- Reintroduced boss bars from pack version 1.2, now fully functional
- Fixed Pale Oak and Poplar fencier fences not showing correct textures
- Fixed the frog texture swap introduced in pack version 1.8
- Added new texture for frog spawn egg
- Added old styled textures for chicken and rabbit food (consistency with the ones added in pack version 1.14)
- Note block item texture now shows side texture with screen (00, F# as default)
- Wolf armor is now plane, for consistency with player leather armor
- Added, after five years, proper textures for powered and non powered hoppers
- Hopper arrows now match Bedrock Edition pack
- Hopper arrows no longer render inside, now they render only outside
- Tweaked mace item model to match Bedrock Edition
- Spyglass now resembles its crafting recipe (copper as the base, and amethyst shard as the glass)
- Added a subtle enchantment glint for items and armors, but keeping it Vanilla
- Updated splash texts and sightly tweaked some and added more splash texts
- Chests and copper chests now have a cubic [3D bottom model and texture](https://www.planetminecraft.com/texture-pack/vanilla-3d-chests/)
- Ender chests now have an animated nether portal inside
- Trapped chests have inside a tripwire hook
- All chests now have proper break particles, instead of using their material type particle
- Backported maps and filled maps from 26.3 snapshot 7
- Replaced snapshot beacons with a much [lightweight and still consistent beacons](https://www.planetminecraft.com/texture-pack/yaboi-s-accurate-beacons/)
- Beacons now have animated textures
- The inside of beacons now glow in the dark
- Added beacon beam fix from Vanilla Tweaks (26.2 only)
- Added Story Mode clouds, now fixed when using Vulkan (26.2 only)
	- Translated and added Story Mode clouds in 26.3 snapshot 9+
- Fixed mangrove propagule showing missing texture when bonemealing
- Added new texture for anvil's mace in GUI (Thanks to REGV!)
- Fixed straw bed item model showing up too low in GUI
- Piston sounds now have their vanilla sounds
- Sulfur cubes now have proper bounce particles, matching slimes
- Added new sulfur cube textures, now they match slime faces
- Added a less obtrusive overlay texture for bogged
- Strays now have a more pronounced mouth texture
- Adult sniffers are now [pixel consistent with Minecraft's style](https://www.planetminecraft.com/texture-pack/non-hd-sniffer/)

1.18 - Dark UI Update:

Snapshot changes:
- Updated pack to work in 26.3 snapshots
- Added 3D item models to new poplar wood, this includes:
	- Doors
	- Hanging signs
	- Signs
- Added fencier fences for poplar wood
- Added fencier fence gates for poplar wood

Normal changes:
- Pack minimum Minecraft version is now 26.2+
- Added classic cod style for cod spawn egg, matching the food item and entity
- Removed unique dyes to match with vanilla style, this includes:
	- White
	- Magenta
	- Lime
	- Pink
	- Grey
	- Purple
- Added an animation to wind charge item texture [https://www.planetminecraft.com/texture-pack/animated-wind-charge-and-brush/]
- Updated weakness and strength effect icons using outdated texture
- Removed classic button hovered colors
- Added Dark GUI (old GUI still saved inside textures > gui > old_gui)
- Fixed brewing stand fuel icon showing vanilla blaze powder instead of pack blaze powder outline
- All nether blocks are now brighter, increasing the sight-readability
- Removed blockstates for saplings as they're obsolete and unused
- Cleaned some unused item models
- Fixed armor stand bottom texture not being consistent with smooth stone texture
- Removed dirt background in panorama and replaced it instead with the old white overlay from versions 1.15 and below

1.17 - A "slight" technical update:
- Reverted clouds to their original vanilla texture
- Fixed sticky piston heads not showing proper textures
- Fixed hanging signs logs not showing proper textures
- Fixed sign textures not working properly
- Fixed textures for sign items not rendering correctly
- Added logs for hanging signs GUI, matching the block texture
- Added and fixed hanging signs item models, tweaking its position
- Removed lantern and soul lantern textures, matching chain textures
- Added custom egg textures to match normal eggs, this includes:
	- Blue cold eggs
	- Brown warm eggs
- Fixed minecarts with chests item models
- Chests and Ender chests now have proper break particles when broken
- Removed colormap textures as now they're useless
- Crimson log and wood is now vanilla-like, no longer red colored


1.16 - Tiny Takeover and Chaos Cubed drop update
- Updated pack to work in 26.1 and beyond
- Pack minimum version is now 26.1, older versions not supported
- Changed pack.png icon to Cyrene (she's too pretty!!)
- Added [old texture and model for beacons from 12w36a](https://www.planetminecraft.com/texture-pack/snapshot-beacons/)
- Moved copper textures to main assets folder
- Renamed "new_additions" folder to "variations" as the texture pack no longer supports 1.21 versions
- Added sulfur cube bucket textures for Sulfur drop (26.2)
- Removed old debug stick custom texture
- Fixed custom entity textures not showing properly, this includes:
	- Witches
	- Blazes
	- Minecarts
	- Shields
	- Guardians
	- Experience orbs
	- Beacon beams
	- Phantoms
	- Wandering Traders
	- Elytra
This change was made at somepoint in 1.21 releases by moving all of them to its own dedicated folder inside textures > entity
- Added consistency for baby zombie piglins and zoglins textures to match their adult counterparts
- Added arabic numerals for enchantments and potions for english and spanish languages

1.15 - Fall and Copper drop update
- Updated pack to work in 1.21.9+
- Pack minimum version is now 1.21.9, older versions aren't supported anymore
- Removed unused folders for older versions
- Rewrote pack.mcmeta to new standard introduced in 1.21.9
- Added copper nugget textures like iron and gold nuggets
- Added copper sword textures
- Added copper armour textures matching the other armour textures
- Added copper bar 3D item models as iron bars
- Added 3D item models for copper lanterns and its variations
- Added workaround classic fog for pre-release versions of 1.21.11

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


