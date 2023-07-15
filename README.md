# Death beam

Shows the beam between killer and victim

### Client Preferences

* Beam display [ Enabled / Disabled ]
* Beam color

### Beam Colors

* Red
* Lime
* Blue
* Yellow
* Fuchsia
* Aqua
* White

### Supported Games

* Day of Defeat: Source

### Installation

* Download latest [release](https://github.com/dronelektron/death-beam/releases) (compiled for SourceMod 1.11)
* Extract "configs", "plugins" and "translations" folders to "addons/sourcemod" folder of your server

### Console Variables

* sm_deathbeam_enable - Enable (1) or disable (0) plugin [default: "1"]
* sm_deathbeam_color_name - Default beam color name [default: "White"]

### How to add colors

Edit the following files:

File: `configs/death-beam-colors.txt`
```
"Colors"
{
    "Orange"    "255 165 0 255"
}
```

File: `translations/death-beam-colors.phrases.txt`
```
"Phrases"
{
    "Orange"
    {
        "en"    "Orange"
    }
}
```

Also you can add color translation for another language

File: `translations/ru/death-beam-colors.phrases.txt`
```
"Phrases"
{
    "Orange"
    {
        "ru"    "Оранжевый"
    }
}
```
