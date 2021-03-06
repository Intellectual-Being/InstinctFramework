Instinct
=================

Framework for roblox - optimized to run survival games, but useable for a wide variety of games. 

Goals:

* A lightweight framework which is object oriented
* Easy to use
* Does not ask a lot more resources than normal
* A lot of features which will not impact performance
* API should be very easy to learn

Instinct will use ModuleScripts. Once it's loaded once, new loads of Instinct will be extremely fast as the original setup will be saved in the memory. This allows extremely quick respawning, because the environment is already loaded! Only the first time loading the scripts will take some CPU!

Instinct comes without any presets. You need to load the base system first, and need to provide which modules you want to load on startup. You can also load this **after** you loaded the framework, but this means one additional require before everything is loaded - for maximum efficiency, define everything in the Instinct main module.

Every module also loads its own dependencies. You can just load a module, and the module itself will load every other dependency it has. You don't have the worry about it.

Instinct comes with handy game management tools, handy modules and libraries and comes with a full replacement of roblox default GUIs.

Instinct tries to mirror the roblox API. It has features which provide a Child-Parent structure. Objects can either be created by ClassName or by their raw object data. Note that raw object data can easily be accessed and due Instinct does not want to impact the performance a lot, there will be no change filtering!

Instinct object creation can be via;

`New = Instinct.Create(Instinct.Resources.Fruit)`
`New = Instinct.Create "Fruit"`

Note that you can provide two "Fruit" classes, but that you then need to explicitly specify which Class you want to load. (The first example). 

Instinct comes with handy services which will make your life easier. It is module-based, so it's easy to plug in and plug out some modules you either want or not!

Instinct comes with a Plugin which updates your ModuleScripts when you are scripting. This will allow you to immediately test changes of ModuleScripts, something which would need some hacky workaround first (copy source, create new modulescript, parent it to the old location, name it to the old name, then delete the old script). The plugin does this for you in a very clean way.
