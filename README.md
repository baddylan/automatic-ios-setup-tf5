# Automatically setup TinyFugue 5 on iOS/iPadOS

Automatically setup TinyFugue 5 (tf5) on iOS/iPadOS devices using iSH-AOK that's available through Apple's [TestFlight](https://apps.apple.com/us/app/testflight/id899247664/) app.
This is meant to make setup as straight-forward and easy as I possibly can. I want to make it something anyone's able to make use of.

## How to use this repository.

1. If you haven't already, download TestFlight from the appstore linked above.
2. Once you've got testflight, join the iSH-AOK Testflight beta [here](https://testflight.apple.com/join/X1flyiqE).
3. Install iSH-AOK and launch the application.
4. Download this repository. [main.zip](https://github.com/baddylan/automatic-ios-setup-tf5/archive/refs/heads/main.zip)
   * If on the device you're going to be using for this, long-press that link until it provides the option to "Copy Link"
5. In iSH-AOK type `wget` and then paste that link and press Enter.
   * If `wget` can't be found, run the command 'sudo apk add wget`
6. Once you've done this, run `unzip main.zip` to extract the files.
7. After that's been done, run `cd automatic-ios-setup-tf5-main`.
8. Run `./setup.sh`, which will proceed to start setting everything up that needs to be done just one time for it to be setup to be used without further configuration, but
   configuring tf5 is highly recommended.
9. Let it finish completely. Once it's done, it let you know that it's fully complete with 'Setup complete. TF5 now ready for use.'
10. Just to start a fresh session (You won't lose your files or anything that have already been setup, don't wory) completely close the app and re-launch it.
11. Afterwards, type 'nano tfrc' to edit the file used for configuring the client. More comments have been left in there, so follow them to get what you want.
12. To save, press the '^' icon on the screen, and `x` on the keyboard. It'll ask if you want to save, press `y' and hit return when it asks about the file name.

## Credits for the scripts I use.
[tinyfugue-scripts collection by Sketch](https://github.com/Sketch/tinyfugue-scripts)  
[idler.tf by Christian Robinson](https://christianrobinson.name/programming/tinyfugue/idler.tf)
