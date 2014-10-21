# pushoveR: Send pushover notifications from R

This is an R package that lets you send [Pushover](https://pushover.net) notifications from `R`. It's inspired by [this package by Dirk Eddelbuettel
](http://dirk.eddelbuettel.com/code/rpushbullet.html), but uses Pushover to avoid using a Google account. To use it, you'll need.

1. A Pushover account (which gets you a user key)
2. A Pushover API key
3. R 3.1 or higher
4. A configuration file

To get a Pushover API key, go [here](https://pushover.net/apps/build) once you've created your account. Give your 'app' a Name (e.g. "Nick's pushoveR"). For "Type" select "Script", and then click "Create Application". Use the generated key as your API key.

To create a configuration file, copy and paste this code into a blank text file:

```
{
 "apikey": "your_api_key_here",
"userkey": "your_user_key_here",
"devices": [ "device_1", "device_2", "device_3", "etc" ] 
}
```

enter your information. Your devices are the names you gave them on your Pushover account. Save that file as `pushoverinfo.json` in your home directory (Mac) or your R working directory (Windows).

# Usage

Pretty simple:

```
pushoveR('Your message here')
```

If you want a custom title (defaults to "RStudio"):

```
pushoveR('Your message here',title='Awesome Title')
```