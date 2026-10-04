# Player Value Tracker

Track and display player-specific values in FiveM

## Features

- Tracks player-specific values in a MySQL database
- Displays player values with a notification when the E key is pressed

## Requirements

- FiveM server with ESX Legacy
- MySQL database

## Installation

1. Download the script files
2. Place them in your FiveM server's resources folder
3. Import the database.sql file into your MySQL database
4. Add `start player-value-tracker` to your server.cfg file

## Usage

- Players can retrieve their values by pressing the E key

## Configuration

Edit the `config.lua` file to customize:

- Database table name
- Default value
- Debug mode

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=player-value-tracker&utm_content=bottom) — describe it in one sentence and get the full source code.