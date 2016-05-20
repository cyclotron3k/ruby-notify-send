#NotifySend for Ruby

This gem allows you to generate desktop notifications from your Ruby script.

It replicates the functionality of `notify-send`, but actually bypasses it completely and goes direct to `dbus`.

Installation
-------

`gem install ruby-notify-send`

Usage
-------

```
require 'notify-send'

# With positional parameters (summary, [body], [icon], [timeout]):
NotifySend.send "Long running process just completed"
NotifySend.send "Title", "some extra text"
NotifySend.send "Title", "some extra text", "error" # <--- use the 'error' icon
NotifySend.send "Title", "some extra text", "error", 1000 # See 'Notes'

# With a hash:
NotifySend.send({summary: "Hi", timeout: 2000})
NotifySend.send({summary: "Hi", body: "<b>Hello, World!</b>", icon: "info"})
NotifySend.send summary: "Hello, World!", icon: "notification-audio-volume-off"
```

Icons
-------

The `:icon` parameter can be one of:
* 'error', 'info'
* Any of the files in `/usr/share/notify-osd/icons/gnome/scalable/status`, minus the file extension (if you're on Ubuntu)
* An absolute path to an image file, e.g. `{icon: "/home/user_name/Desktop/some_image.jpg", summary: ...}`

Notes and known issues
-------

* `:timeout` seems to be ignored on my desktop.
* If `:summary` is an empty string, the notification will not be displayed.
* For reference, the: [D-BUS notification spec](https://developer.gnome.org/notification-spec/).
* Needs better inputs validation. E.g. D-Bus demands that `:timeout` must be an Int, but this gem does not enforce that.
