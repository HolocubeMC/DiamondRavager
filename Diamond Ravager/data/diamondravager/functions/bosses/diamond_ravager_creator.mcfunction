#This file is run every single game tick

#Adds the Boss to the 'diamondravagerboss' team created in the function 'diamond_ravager_setup'
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run team join blue @s

#Adds health/loot/etc
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run data merge entity @s {Attributes:[{Base:0.3d, Name:"generic.movementSpeed"},{Base:100.0f, Name:"generic.maxHealth"}], Health:100.0d, PlayerCreated:0b, CustomName:'{"text":"Diamond Ravager", "color":"aqua"}',  DeathLootTable:"diamondravager:entities/diamond_ravager"}

#Below are all the buffs

#Gives it strength 1
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run effect give @s minecraft:strength 1000000 1 true
#Gives it regen 2
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run effect give @s minecraft:regeneration 1000000 2 true
#Gives it water breathing(For the particle effects)
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run effect give @s minecraft:water_breathing 1000000 1 false
#Gives it resistance 1
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run effect give @s minecraft:resistance 1000000 1 true
#Gives it fire resistance 1
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run effect give @s minecraft:fire_resistance 1000000 1 true
#Gives it speed 1
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run effect give @s minecraft:speed 1000000 1 true

#Gives it feather falling boots
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run replaceitem entity @s armor.feet leather_boots{Enchantments:[{id:feather_falling,lvl:10},{id:projectile_protection,lvl:15},{id:unbreaking,lvl:100},{id:vanishing_curse,lvl:1}]} 1
#Gives it projectile Protection armour
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run replaceitem entity @s armor.legs leather_leggings{Enchantments:[{id:projectile_protection,lvl:15},{id:unbreaking,lvl:100},{id:vanishing_curse,lvl:1}]} 1
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run replaceitem entity @s armor.head leather_helmet{Enchantments:[{id:projectile_protection,lvl:15},{id:unbreaking,lvl:100},{id:vanishing_curse,lvl:1}]} 1
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run replaceitem entity @s armor.chest leather_chestplate{Enchantments:[{id:projectile_protection,lvl:15},{id:unbreaking,lvl:100},{id:vanishing_curse,lvl:1}]} 1

#Below sends a message and a sound to all online players

#Send a message in chat to all players
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run tellraw @a {"text":"Whomst has summoned the almighty one?", "color":"aqua"}

#Play a sound to all players
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run playsound minecraft:entity.iron_golem.death hostile @a ~ ~ ~ 100 .5



#This adds a buffed function so the above doesn't constantly run
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=!buffed] run tag @s add buffed

#Below sets the BossBar stats

#Set the bossbar value equal to the Diamond Ravager Boss's current health
execute if entity @e[type=minecraft:ravager, name="Diamond Ravager", tag=buffed] store result bossbar minecraft:diamondravagerbossbar value run data get entity @e[type=minecraft:ravager, name="Diamond Ravager", tag=buffed, limit=1] Health

#Make the bossbar visible to all players within 50 blocks of the Diamond Ravager
execute as @e[type=minecraft:ravager, name="Diamond Ravager", tag=buffed] at @s run bossbar set minecraft:diamondravagerbossbar players @a[distance=..50]

#Disable the bossbar when the Diamond Ravager Boss is no longer present
execute unless entity @e[type=minecraft:ravager, name="Diamond Ravager", tag=buffed] run bossbar set minecraft:diamondravagerbossbar players
